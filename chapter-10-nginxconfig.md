# 如下是对nginx的配置优化

------

### 1. 对nginx worker_processes 进程绑核

按linux逻辑CPU核数设置`worker_processes`的数量

```shell
#查看cpu核数命令
cat /proc/cpuinfo | grep "processor" | wc -l
```

给nginx worker_processes进程绑核, 配置`nginx.conf`
```config
worker_processes 4;
worker_cpu_affinity 0001 0010 0100 1000; 
```

让nginx进程分配至多核CPU设置的启用
```shell
nginx -s reload
```

### 2. 主动式后端服务器健康检查的配置项优化

参考：http://tengine.taobao.org/document_cn/http_upstream_check_cn.html

我们引入了`ngx_http_upstream_check_module`模块，优化如下：
```config
upstream xxx {
    ...
    check interval=2000 rise=1 fall=3 timeout=3000;
    check_shm_size 20m;
}
```

目前我们每一个upstream中，配置的server个数不是很多，最多有10台， 默认1m的空间是够用的，但 所有的后端服务器健康检查状态都存于共享内存中， 这里`check_shm_size`修改为20m, 让其有足够大的空间

```config
Directives
check
    syntax: *check interval=milliseconds [fall=count] [rise=count]
    [timeout=milliseconds] [default_down=true|false]
    [type=tcp|http|ssl_hello|mysql|ajp]*
    default: *none, if parameters omitted, default parameters are
    interval=30000 fall=5 rise=2 timeout=1000 default_down=true type=tcp*
    context: *upstream*
    description: Add the health check for the upstream servers.
    
    The parameters' meanings are:
    *   *interval*: the check request's interval time.
    *   *fall*(fall_count): After fall_count check failures, the server is
        marked down.
    *   *rise*(rise_count): After rise_count check success, the server is
        marked up.
    *   *timeout*: the check request's timeout.
    *   *default_down*: set initial state of backend server, default is
        down.
    *   *type*: the check protocol type:
        1.  *tcp* is a simple tcp socket connect and peek one byte.
        2.  *ssl_hello* sends a client ssl hello packet and receives the
            server ssl hello packet.
        3.  *http* sends a http request packet, receives and parses the http
            response to diagnose if the upstream server is alive.
        4.  *mysql* connects to the mysql server, receives the greeting
            response to diagnose if the upstream server is alive.
        5.  *ajp* sends a AJP Cping packet, receives and parses the AJP
            Cpong response to diagnose if the upstream server is alive.

check_shm_size
    syntax: *check_shm_size size*
    default: *1m*
    context: *http*
    description: Default size is one megabytes. If you check thousands of
    servers, the shared memory for health check may be not enough, you can
    enlarge it with this directive.
```

### 3. 系统配置优化之网络参数`/etc/sysctl.conf`

参见： http://tweaked.io/guide/kernel/

#### 3.1 ip_local_port_range

由于上面的健康检查采用的是简单的tcp方式， 并且周期为2秒的频率进行刷新。所以我们需要对tcp socket等系统配置进行优化。

我使用如下命令查看生产环境的nginx vm上tcp有299个连接是用于健康检查的. 查看情况如下：
```shell
tdp:~ # netstat -ant | awk '/^tcp/ {print $6}' | sort | uniq -c
    299 ESTABLISHED
      7 LISTEN
```

而此时系统中端口的范围为32768~61000， 即：只有30000多的个port， 已经用于建立健康检查的port数为299个，其余可以给业务请求用.

```shell
tdp:~ # cat /proc/sys/net/ipv4/ip_local_port_range
32768   61000
```

我们如果有超时20,000个 open socket需求时，那么可以考虑扩大port的范围，优化设置如下：
```config
# 配置 /etc/sysctl.conf文件

# Use the full range of ports.
net.ipv4.ip_local_port_range = 1024 65535
```

#### 3.2 net.ipv4.tcp_tw_recycle

我们需要尽可能多地把socket资源释放出来给nginx使用，对于系统中TCP TIME_WAIT状态的连接需要及时释放。

```config
# 配置 /etc/sysctl.conf文件

# Enables fast recycling of TIME_WAIT sockets.
# (Use with caution according to the kernel documentation!)
net.ipv4.tcp_tw_recycle = 1

# Allow reuse of sockets in TIME_WAIT state for new connections
# only when it is safe from the network stack’s perspective.
net.ipv4.tcp_tw_reuse = 1

# 如果开启了tcp_tw_recycle, 那么需要关闭timestamps， 防止在NAT环境中出现丢包，具体见：http://tools.ietf.org/html/rfc1323
net.ipv4.tcp_timestamps = 0
```


#### 3.3 tcp socket buffer

调整TCP 发送和接收的buffers值, 并允许动态调整允许的大小范围

```config
# The four options increase the TCP send and receive buffers, which allow an application to move its data out faster so as to serve other requests. This also improves the client's ability to send data to the server when it gets busy.

#
# 16MB per socket - which sounds like a lot, but will virtually never
# consume that much.
#
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216

net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216

net.ipv4.tcp_window_scaling = 1
```

#### 3.4 tcp listening

当socket状态是listening时，并且在大并发下。请求会阻塞到连接队列上，我们需要对并发数进行调整

```config
# if a socket is listening and busy a connection-backlog will pile up. The kernel will keep pending connections in a buffer before failing. You can tweak several values to increase the size of the backlog

# Increase the number of outstanding syn requests allowed.
# c.f. The use of syncookies.
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_syncookies = 1

# The maximum number of "backlogged sockets".  Default is 128.
net.core.somaxconn = 1024
```

### 3.5 系统配置优化之文件句柄`/etc/sysctl.conf`

增加文件句柄数，由tcp会与一些文件关联，比如：
```shell
# list of open tcp sockets
cat /proc/net/tcp

# list of open udp sockets
cat /proc/net/udp

# list all the 'raw' sockets
cat /proc/net/raw
```

需要调整文件句柄数

```config
# /etc/sysctl.conf 
fs.file-max=500000

# /etc/security/limits.conf
* soft nofile 500000
* hard nofile 500000
```

nginx配置文件中相应修改为:

```config
#nginx.conf

worker_rlimit_nofile 500000;
events {
    use epoll;
    worker_connections 100000;
}
```

### 4. [准备获取访问者真实IP的方法](https://www.alibabacloud.com/help/zh/doc-detail/35620.htm)

将业务流量正式切换到Web应用防火墙后，对于该网站的访问就不再是简单地从用户的浏览器直达服务器，中间将至少经过Web应用防火墙进行转发。在这种情况下，您需要通过额外的方法获得真正发起请求的真实客户端IP。

说明：一般情况下，当一个透明的代理服务器将用户的请求转到下一环节的服务器时，会在HTTP的头部增加一条X-Forwarded-For记录，用于记录用户的真实IP，其形式为X-Forwarded-For:用户IP。因此，如果真实客户端与网站服务器中间经历了多个代理服务器，X-Forwarded-For将以该形式来展示所经过的代理服务器IP及真实用户IP：X-Forwarded-For:用户IP, 代理服务器1-IP, 代理服务器2-IP, 代理服务器3-IP, ……。

因此，在将您的网站域名正式接入Web应用防火墙防护后，您可以使用X-Forwarded-For的方式来获取访问者真实IP。关于具体的配置方法，请查看获取访问者真实IP配置方法。
