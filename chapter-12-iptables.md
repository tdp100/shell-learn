# iptables

iptables

---

## 1 iptables

iptables用于创建、维护、检查linux内核中IPv4、ipv6包过滤规则， 它是使用kernel 中netfilter framework实现的。 其中netfilter framework开放了5个hook points（见/usr/include/linux/netfilter_ipv4.h)，允许用户通过hook这5个points来实现对包的自定义过滤：`PREROUTING，  INPUT， FORWARD，POSTROUTING，OUTPUT`。内建的chain也是hook了这5个点的。

注意：`FORWARD` 需要开启IP forwarding
```shell
# Turn on IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
```

结构图：

```conf
iptables(userspace tool)
   |
netfilter-framework
   |
ip_tables(the kernel module)
```


### 1.1. table:

linux 内建的ipv4 包过滤表有： `filter、nat、mangle、raw`

filter :This is the default table (if no -t option is passed)

### 1.2. chain

每一个table下面都有多个chain， 而chain是一组rule的集合。 可以给chain指定它的policy， policy有：`ACCEPT, DROP, QUEUE, RETURN`。

查看一个table下的chain详情：

```shell
tdp@ubuntu:/tdp/home$ sudo iptables --table nat --list
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination    
```

指定chain的Policy

```shell
# -P, --policy chain target
tdp@ubuntu:/home/tdp/$ sudo iptables -t nat -P INPUT DROP
```

### 1.3. rules

给chain中添加规则, Following are the key points to remember for the iptables rules.

1. Rules contain a criteria and a target.
2. If the criteria is matched, it goes to the rules specified in the target (or) executes the special values mentioned in the target.
3. If the criteria is not matached, it moves on to the next rule.


**注：使用得最多的有`-p --protocol, -s --source, -d --destination, -j --jump target` 以及后面`-m`, 见:match extend**

添加一条规则的命令：

```shell
iptables -A chain_name rule-specification
```

插入一条规则的命令：

```shell
iptables -I  chain [rulenum] rule-specification
```

查看规则:

```shell
iptables -L

# Adding the -v option will give you packet and byte information, and adding -n will list everything numerically. In other words – hostnames, protocols, and networks are listed as numbers.
```

### target

一条防火墙rule由criteria和 target构成，如果rule不匹配一个packet，那么由chain中的下一条rule再进行匹配；如果匹配，那么下一条rule由target指定。

target可以是内建的值：`ACCEPT、DROP、QUEUE、RETURN`, 也可以是user-defined chain， 也可以是一个[target extension](http://linux.die.net/man/8/iptables)。

内建的target值：

1. ACCEPT – Firewall will accept the packet.
2. DROP – Firewall will drop the packet.
3. QUEUE – Firewall will pass the packet to the userspace. 需要有queue handler, 内置的有：ip_queue
4. RETURN – Firewall will stop executing the next set of rules in the current chain for this packet. The control will be returned to the calling chain. 如果是user-build chain，则返回到父chain中，继续下一个rule匹配；如果是build-in chain，则使用chain policy作为target。

target extension: eg: REJECT、REDIRECT、SNAT 等等

```shell
iptables -N RH-Firewall-1-INPUT

# target是一个user-defined chain
iptables -A INPUT -j RH-Firewall-1-INPUT

# target是内建的ACCEPT
iptables -A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT

# target是一个target extension
iptables -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited

# target extension 帮助
iptables -j REJECT -h

REJECT target options:
--reject-with type              drop input packet and send back
                                a reply packet according to type:
Valid reject types:
    icmp-net-unreachable        ICMP network unreachable
    net-unreach                 alias
    icmp-host-unreachable       ICMP host unreachable
    host-unreach                alias
    icmp-proto-unreachable      ICMP protocol unreachable
    proto-unreach               alias
    icmp-port-unreachable       ICMP port unreachable (default)
    port-unreach                alias
    icmp-net-prohibited         ICMP network prohibited
    net-prohib                  alias
    icmp-host-prohibited        ICMP host prohibited
    host-prohib                 alias
    tcp-reset                   TCP RST packet
    tcp-rst                     alias
    icmp-admin-prohibited       ICMP administratively prohibited (*)
    admin-prohib                alias

```

### match extentions

有很多module扩展了package的匹配， 可以使用这些module来实现更加高级的match, 使用方法是：在-p 或者 -m后面跟上module名字，再加上module支持的command line options

即：
```shell
# -p 后面的module必须是系统支持的protocols，可以在/etc/protocols中查询得到
tdp@ubuntu:$ iptables -p protocol_module_name comannd_line_options

# -m 
tdp@ubuntu:$ iptables -m module_name comannd_line_options

# -h， 查看module支持command line options
tdp@ubuntu:$ sudo iptables -p tcp -h

tcp match options:
[!] --tcp-flags mask comp       match when TCP flags & mask == comp
                                (Flags: SYN ACK FIN RST URG PSH ALL NONE)
[!] --syn                       match when only SYN flag set
                                (equivalent to --tcp-flags SYN,RST,ACK,FIN SYN)
[!] --source-port port[:port]
 --sport ...
                                match source port(s)
[!] --destination-port port[:port]
 --dport ...
                                match destination port(s)
[!] --tcp-option number        match if TCP option set

```

## 2 匹配流程

![image](http://code.huawei.com/cloud-service-dev-team-devops/console-framework/uploads/1e65617067285a333e4f249783737a4a/image.png)

## 3 保存

当修改完iptables后，需要进行保存，不然reboot后会消失

ubuntu:

```shell
sudo /sbin/iptables-save
```

centos, redhat:

```shell
/sbin/service iptables save
```

或者：

```shell
/etc/init.d/iptables save
```

## 资料

1. http://www.thegeekstuff.com/2011/01/iptables-fundamentals/
2. http://linux.die.net/man/8/iptables
3. http://www.iptables.info/en/structure-of-iptables.html
4. http://www.thegeekstuff.com/2011/02/iptables-add-rule/
5. http://www.howtogeek.com/177621/the-beginners-guide-to-iptables-the-linux-firewall/