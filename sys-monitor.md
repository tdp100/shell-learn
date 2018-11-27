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

## 参考

1. https://www.jianshu.com/p/407c2baef92e
