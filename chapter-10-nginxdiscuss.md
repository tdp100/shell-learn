
我在 1:10分左右登陆 xxxxxx 机器发现机器已经恢复健康，表象如下：
1、Nginx占用CPU很低
   linux:/xxx/nginx # ps aux|grep -e nginx -e CPU
USER        PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root      13977  0.0  0.0 232360  2292 ?        Ss   00:42   0:00 nginx: master process /xxx/nginx/sbin/nginx
1000      13979  0.0  0.0 232360  2948 ?        S    00:42   0:03 nginx: worker process            
1000      13980  0.0  0.0 232360  2948 ?        S    00:42   0:02 nginx: worker process            
1000      13981  0.0  0.0 232360  2948 ?        S    00:42   0:03 nginx: worker process            
1000      13982  0.0  0.0 232792  4632 ?        S    00:42   0:04 nginx: worker process            
root      88026  0.0  0.0   4556   816 pts/0    R+   02:29   0:00 grep -e nginx -e CPU
2、连接情况：netstat -ant | awk '/^tcp/ {print $6}' | sort | uniq -c
    299 ESTABLISHED
      7 LISTEN
   established状态几乎都是到后端的健康检查。
3、日志信息：
查看nginx没有任何可疑信息。
 
 
一直等待未看到问题复现，但通过查阅你们的配置代码、系统参数等信息，我还是发现了一些问题。
由于我只是匆匆查看，理解可能会有偏差，专家可根据自己的业务场景判断是否可采纳。
 
1、nginx启了四个进程，却没绑核。
2、系统文件句柄过低，只有1024，同时健康检查消耗很多，所以可支撑业务的性能会很低，很容易就会出现业务不可用的现象。如下修改：
   1）/etc/sysctl.conf 文件中添加 fs.file-max=500000
   2）/etc/security/limits.conf
加上
* soft nofile 500000
* hard nofile 500000
nginx的配置文件也做相应的修改：
worker_rlimit_nofile 500000;
events {
use epoll;
worker_connections 100000;
}
3、TCP需配置快速回收、超时等选项，因为健康检查的时间间隔都很短，如果TCP参数不优化，健康检查会消耗很多端口。如下建议：
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1   
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_max_tw_buckets = 10000
4、 nginx没有使用固定ip监听，有一定的安全隐患。
5、 nginx 的cc防御能力极低 ，不过  是否这个LB不太关注CC防护，毕竟访问量很少。
6、check_shm_size 默认配置只有1M，建议配20M。（当前还是有挺多健康检查的，如果后续持续加入业务，可能出现问题）
7、nginx的访问日志关闭，不知是否考虑安全问题，这样定位问题难度会加大。
8、端口范围要配尽量大
   /etc/sysctl.conf 中添加：net.ipv4.ip_local_port_range = 1024    65535
