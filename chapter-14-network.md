# network

## 1. 网络带宽测试

1. 使用iperf工具， iperf工具是一个client/server工具，用于TCP/UDP报文的性能测试。
如：

```sh
## client tcp
iperf -c 192.168.2.16 -b 1000M -i 1 -w 1M -t 600 -P 10 -p 5001

## server
iperf -s -p 5001 &
```

并发数据流数量，TCP 窗口大小、最大分段长度、拥塞算法

参考：

1. iperf官网： https://iperf.fr/iperf-doc.php
2. [像客户一样体验网络 -杜绝启动差异](https://www.viavisolutions.com/en-us/literature/experience-network-your-customers-do-closing-turn-gap-white-paper-zh-hans.pdf)
3. [Azure 中使用 iPerf 进行网络带宽测试](https://docs.azure.cn/zh-cn/articles/azure-operations-guide/virtual-network/aog-virtual-network-iperf-bandwidth-test)
4. book [Web性能权威指南（High Performance Browser Networking）](http://www.powerxing.com/reading-high-performance-browser-networking-ch2/) 
5. A primer on latency and bandwidth: https://www.oreilly.com/learning/primer-on-latency-and-bandwidth

## 2. network tools

1. ipcalc

计算ip地址的子网掩码，广播地址等工具, eg:

```shell
tdp@ubuntu:~/desired/idea-workspace$ ipcalc 149.16.2.1
Address:   149.16.2.1           10010101.00010000.00000010. 00000001
Netmask:   255.255.255.0 = 24   11111111.11111111.11111111. 00000000
Wildcard:  0.0.0.255            00000000.00000000.00000000. 11111111
=>
Network:   149.16.2.0/24        10010101.00010000.00000010. 00000000
HostMin:   149.16.2.1           10010101.00010000.00000010. 00000001
HostMax:   149.16.2.254         10010101.00010000.00000010. 11111110
Broadcast: 149.16.2.255         10010101.00010000.00000010. 11111111
Hosts/Net: 254                   Class B
```

2. arp

查看arp cache表。里面缓存了ip对应的mac地址。 它是通过发送广播报文进行收集的

查看本机的arp cache

```shell
tdp@ubuntu:~/desired/idea-workspace$ arp
Address                  HWtype  HWaddress           Flags Mask            Iface
10.85.160.21             ether   00:0f:e2:2f:e4:cf   C                     eth2
```

3. ip

查看、管理本机的ip地址等

```shell
# 查看ip地址：
ip addr

# 删除ip地址
ip addr address/netmask dev interf

# 查看网卡信息
ip a
```

4. hostname & networks

如果你的机器不能访问DNS或者NIS，那么需要设置hostname对应的ip地址，这样才能resolve hostname.

可以编辑如下文件：`/etc/hosts`

可以使用hostname命令来查看设置的hosts

同样你也可以给一个network定义名字，方便在route add -net时使用网络名字。

编辑如下文件： `/etc/networks`


5. ifconfig

给interface配置ip地址

```shell
# config ip
ifconfig interface address/netmask-prefix

# config ip alise
ifconifg interface:0 address

# delte ip alise
ifconfig interface:0 down
```

5. route

```shell
route add -net net-alise

# config gw

route add -net netalise gw gwaddress
```

6. netstat

查看所有路由表
```shell
netstat -nr
```

查看所有的网络连接
```shell
netstat -ta
```

7. iptabls

配置firewall和net等等, 有专门的文章介绍

8. 端口映射工具（IPOP）

## 2. 高性能网络编程

[一文读懂高性能网络编程中的I/O模型](http://www.52im.net/thread-1935-1-1.html)

## 3. 虚拟化技术

1 分布式虚拟的交换机：http://www.huawei.com/ilink/cnenterprise/download/HW_401035

1.1 网络I/O虚拟化，SR-IOV技术: http://www.sdnlab.com/14403.html 
>>>SR-IOV引入了两个新的功能类型：
>>>
>>>PFs（Physical Functions，物理功能）：物理网卡所支持的一项PCI功能，一个PF可以扩展出若干个VF。
>>>VFs（Virtual Functions，虚拟功能）：支持SR-IOV的物理网卡虚拟出来的实例，以一个独立网卡的形式呈现，每个VF有独立的PCI配置区域，并可以与其它VF共享同一个物理资源（共用同一个物理网口）。 VM需要安装VF 设备驱动

1.2 Linux virtualization and PCI passthrough: http://www.ibm.com/developerworks/library/l-pci-passthrough/index.html 

2 VLAN技术 802.1Q

3 TCP/IP详解：https://github.com/mymmsc/books/tree/master/network

## 3. 博客

1. [router alley](http://www.routeralley.com/guides.html)
2. [超大规模数据中心网络](http://www.sdnlab.com/16392.html)
   + CLOS组网方式
   
   + Fat tree组网方式
   
   + 收敛比 over subscription
   
3. [Data Center Data Center Network Topologies--Washington University](https://www.cse.wustl.edu/~jain/cse570-13/ftp/m_03dct.pdf)
4. [A Guided Tour through Data Center Networking](https://www.cs.cornell.edu/courses/cs5413/2014fa/lectures/07-datacenter-tour.pdf)
5. [ACM: A Guided Tour through Data Center Networking](http://static.googleusercontent.com/media/research.google.com/en/us/pubs/archive/40404.pdf)
6. [Data Center Network Architecture Yantao Sun, Jing Cheng, Konggui Shi, and Qiang Liu](www.cnki.net)
>>>the typical oversubscription ratio be⁃
tween neighboring layers is 1:5 or more. In the top layer, this
ratio may reach 1:80 to 1:240. Even if the fastest, most ad⁃
vanced switches and routers are used, only 50% of the aggrega⁃
tion bandwidth of edge networks can be supported in the top
layer [3]. The top layer is therefore becoming the bottleneck of
the entire network, especially in today’s cloud computing envi⁃
ronment where the requirement for intra-network traffic is in⁃
creasing rapidly.

## 4.术语：

1. DWDM，用于数据中心AZ间互连使用技术
3. VRF(Virtual Routing and Forwarding): 核心路由器上的一个功能，[参考](https://www.plixer.com/blog/netflow/what-is-vrf-virtual-routing-and-forwarding/)

## 5.文献索引
1. [citeseerx](http://citeseerx.ist.psu.edu/index)
2. [cnki 中国知网](www.cnki.net)

## 6 模拟器

1 华为的eNSP
