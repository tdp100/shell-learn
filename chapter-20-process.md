杀死进程
`ps -ef | grep haproxy | grep -v grep | awk -F " " '{print $2}' | xargs kill -9 $1`


ps -ef | grep keepalived | grep -v grep | awk -F " " '{print $2}' | xargs kill -9 $1
