ubuntu下搭建使用pptpd搭建VPN服务器

sudo apt-get install pptpd

2.配置内网ip策略

sudo vim /etc/pptpd.conf

在# TAG: localip后增加2行

localip 192.168.0.1

remoteip 192.168.0.234-238,192.168.0.245

3.配置dns

sudo vim /etc/ppp/pptpd-options

在#ms-dns后增加2行，也可以配置其他dns

ms-dns 8.8.8.8

ms-dns 8.8.4.4

4.配置VPN帐号

sudo vim /etc/ppp/chap-secrets

添加账号、服务器名、密码和IP限制，一个帐号一行，每个参数中间用空格间隔。如：

user * passwd *

5. TCP/IP策略配置

sudo vim /etc/sysctl.conf

插入一行：

net.ipv4.ip_forward=1

保存并退出vim

执行

sudo sysctl –p

提示net.ipv4.ip_forward = 1，说明配置生效

6.开放网络端口

安装iptables(已安装请忽略)

sudo apt-get install iptables

开放1723端口

sudo iptables -I INPUT -p tcp --dport 1723 -j ACCEPT

7.配置NAT网络地址转换

sudo iptables --table nat --append POSTROUTING --out-interface eth0 --jump MASQUERADE

8.重启pptpd

sudo /etc/init.d/procps restart

搭建完毕，客户端可以连接了。








安装VPN软件：sudo apt-get install pptpd;

编辑内网IP配置： sudo nano /etc/pptpd.conf;

 解开配置文件的末尾的 #localip #remoteip两行的开关（有两套IP，看个人喜好，开哪个自定）；

control+o（保存），control+x（退出）。

编辑选项文件：sudo nano /etc/ppp/pptpd-options;

解开选项文件中的#ms-dns的开关（默认是内网IP，看个人喜好修改，我是修改成了8.8.8.8,4.4.4.4）;

control+o（保存），control+x（退出）。

编辑账户文件，添加用户：sudo nano /etc/ppp/chap-secrets；

增加或修改用户信息，规则是：用户名，服务器，密码，授权IP地址（例如：user pptpd password *）;

control+o（保存），control+x（退出）。

 重启pptpd：sudo /etc/init.d/pptpd restart



以上pptpd的配置就完成了，但是，还需要配置一下ipv4.ip_forward

输入：sudo nano /etc/sysctl.conf

解开#net.ipv4ip_forward=1的开关

control+o（保存），control+x（退出）。

输入：sudo sysctl -p

开系统防火墙iptables，允许VPN：

这里默认有iptables，查看规则：sudo iptables -L -nv;

看看现在服务器有哪些规则，不要把服务器搞死，千万要记得要有SSH的防火墙规则，这很重要；

添加防火墙规则：sudo iptables -A INPUT -p tcp -i eth0 --dport ssh -j ACCEPT

添加防火墙规则：sudo iptables -A INPUT -p tcp -i eth0 --dport 1723 -j ACCEPT

添加NAT规则：sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE(192.168.0.0视第一部分分配的IP地址段自行修改)；

启动防火墙：modprobe ip_tables。