# ifconfig

ifconfig

---

lo: 是一个允许自己连自己的虚拟网卡类型。通常用于测试

使用ifconfig配置interface, 并且需要使用route给interface配置网络路由

## ipv4

ip address, netmask, network, broadcast address:

![](http://faqintosh.com/risorse/common/ecg/191/en/ipmask.png)

![](http://faqintosh.com/risorse/common/ecg/191/en/ipnetwork.png)

可以使用ipcalc工具，计算ip信息：

```shell
tdp@ubuntu:~$ ipcalc -n 127.7.149.0/26
Address:   127.7.149.0          01111111.00000111.10010101.00 000000
Netmask:   255.255.255.192 = 26 11111111.11111111.11111111.11 000000
Wildcard:  0.0.0.63             00000000.00000000.00000000.00 111111
=>
Network:   127.7.149.0/26       01111111.00000111.10010101.00 000000
HostMin:   127.7.149.1          01111111.00000111.10010101.00 000001
HostMax:   127.7.149.62         01111111.00000111.10010101.00 111110
Broadcast: 127.7.149.63         01111111.00000111.10010101.00 111111
Hosts/Net: 62                    Class A, Loopback
```

## 工具

**查看route表：**

```shell
 netstat -nr
```

route表格式：
```shell
tdp@ubuntu:~$ route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         10.85.160.1     0.0.0.0         UG    0      0        0 eth2
10.85.160.0     *               255.255.254.0   U     0      0        0 eth2
10.85.160.0     10.85.160.1     255.255.254.0   UG    1      0        0 eth2
161.0.0.0       188.168.0.1     255.0.0.0       UG    20     0        0 tap0
link-local      *               255.255.0.0     U     1000   0        0 eth2
188.168.0.0     *               255.255.0.0     U     0      0        0 tap0
```

1. Flags:
    + U 表示网卡可用
    + G 表示需要使用网关
2. Gateway：表示网关，*表示不需要网关

**查看arp表：**

```shell
 arp -a
```
## 资料

1. http://www.tecmint.com/ifconfig-command-examples/
2. http://faqintosh.com/risorse/en/guides/net/tcp/basic/
3. http://www.aboutlinux.info/2006/11/ifconfig-dissected-and-demystified.html