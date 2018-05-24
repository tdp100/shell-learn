./tcpdump -i eth0 -s 0 host xxx.xxx.xxx.xx -w api.cap

./tcpdump -i eth0 -s 0 host 46.29.103.37 -w api.cap

./tcpdump -i eth0 tcp and port 8080


## 连接跟踪表
http://wushank.blog.51cto.com/3489095/1264758

watch -n 1 "cat /proc/sys/net/netfilter/nf_conntrack_count"

cat /proc/sys/net/netfilter/nf_conntrack_count

cat /proc/sys/net/netfilter/nf_conntrack_max

Every 1.0s: cat /proc/sys/net/netfilter/nf_conntrack_count                                                                                                             Thu Feb 11 11:40:21 2016

40792

## 查网卡流量变化

watch -n 1 "ifconfig vlan49"

watch -n 1 "cat /proc/sys/net/netfilter/nf_conntrack_count"

sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.ipv4.tcp_tw_recycle=1
sysctl -w net.ipv4.tcp_fin_timeout=30
sysctl -w net.ipv4.tcp_max_tw_buckets=5000


不需要链接跟踪表，在装系统中，选择了高级功能。把连接跟踪表也加进来了。
连接跟踪表主要用于安全
