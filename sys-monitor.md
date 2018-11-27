## 监控项

1. 系统总的句柄数
```sh
sudo find /proc -print | grep -P '/proc/\d+/fd/'| wc -l
```

2. 进程打开的fd数
```sh
ls -l /proc/<pid>/fd | wc -l
```

3. 查看哪个进程使用的fd最多（再来一路组合拳）
```sh
sudo find /proc -print | grep -P '/proc/\d+/fd/'| awk -F '/' '{print $3}' | uniq -c | sort -rn | head
```

4. 查看系统打开的TCP连接数
```sh
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
```

5. 查看系统中目的端口为memcached 11211的TCP连接
```sh
 ss -ta state established dport = :11211
```

6. 与服务端7443端口建立的TCP连接数
```sh
 ss -ta '( sport = :7443 ) '
```

7. 服务端7443端口状态为LISTEN的个数
```sh
ss -ta state listening '( sport = :7443 ) '
```

## 参考

1. https://www.jianshu.com/p/407c2baef92e
2. https://my.oschina.net/lionel45/blog/109779
3. https://www.rootusers.com/21-ss-command-examples-in-linux/
