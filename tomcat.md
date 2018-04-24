## tomcat access_log日志格式

1. [Attributes](http://tomcat.apache.org/tomcat-7.0-doc/config/valve.html#Access_Log_Valve/Attributes)

+ %a - Remote IP address
+ %A - Local IP address
+ %b - Bytes sent, excluding HTTP headers, or '-' if zero
+ %B - Bytes sent, excluding HTTP headers
+ %h - Remote host name (or IP address if enableLookups for the connector is false)
+ %H - Request protocol
+ %l - Remote logical username from identd (always returns '-')
+ %m - Request method (GET, POST, etc.)
+ %p - Local port on which this request was received. See also %{xxx}p below.
+ %q - Query string (prepended with a '?' if it exists)
+ %r - First line of the request (method and request URI)
+ %s - HTTP status code of the response
+ %S - User session ID
+ %t - Date and time, in Common Log Format
+ %u - Remote user that was authenticated (if any), else '-'
+ %U - Requested URL path
+ %v - Local server name
+ %D - Time taken to process the request, in millis
+ %T - Time taken to process the request, in seconds
+ %F - Time taken to commit the response, in millis
+ %I - Current request thread name (can compare later with stacktraces)

## tomcat 进程/线程/连接数

在Linux下，如果连接数比较大，可以使用效率更高的ss来替代netstat。

4、如何查看tomcat对应的进程号：ps -ef|grep tomcat

根据进程号查询对应的目录：/proc/pid/cwd、ls -la /proc/pid/fd

根据目录查找对应的进程：lsof path

5、查看tomcat的线程数：ps -Lf pid|wc -l

6、查看tomcat的并发数：netstat -an|grep 10050|awk '{count[$6]++} END{for (i in count) print(i,count[i])}'

TIME_WAIT 25
LISTEN 1

7、根据端口号查询对应进程

lsof -Pnl +m -i4|grep port #根据此命令查出端口号对应的进程pid，然后使用ps查到进程信息。

netstat -anp|grep prot  #根据此命令查出端口号对应的进程pid，然后使用ps查到进程信息。
