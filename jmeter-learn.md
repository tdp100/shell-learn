### 1. 下载jmeter

+ linux [apache-jmeter-3.3.tgz](http://jmeter.apache.org/download_jmeter.cgi)

#### 1.1 解压jmeter

1. 解压jmeter tgz 到 ~/jmeter33目录

```sh
mkdir -p ~/jmeter33
unzip apache-jmeter-3.3.zip
```

#### 1.2 jmeter节点安装监控插件

1. 下载最新jmeter插件[JMeter Plugins](http://jmeter-plugins.org/downloads/all/#Latest-Stable-Release)

2. 根据需求选择合适的插件，我们使用的[PerfMon](https://jmeter-plugins.org/wiki/PerfMon/)

3. 解压缩`jpgc-perfmon-2.1.zip`,复制文件`JMeterPlugins-Standard-1.2.1/lib/**`到`JMeter目录\apache-jmeter-2.13\lib\`目录下。

4. 重启JMeter

#### 1.3 app节点安装监控agent

 1. 下载最新PerfMon agent[ServerAgent-2.2.3.zip](https://github.com/undera/perfmon-agent/blob/master/README.md)

 2.  拷贝文件到需要监控的机器到指定目录

 3.  确认机器有安装JDK

 4.  启动服务
 
 ```sh
 ./startAgent.sh &

## a. You can specify the listening ports as arguments (0 disables listening), default is 4444:
## ./startAgent.sh --udp-port 0 --tcp-port 3450
 ```
 
 ### 2 jmeter集群模式

参考：[Apache JMeter Distributed Testing Step-by-step](http://jmeter.apache.org/usermanual/jmeter_distributed_testing_step_by_step.html)

![image](http://jmeter.apache.org/images/screenshots/distributed-names.svg)

+ Master – the system running Jmeter GUI, which controls the test
+ Slave – the system running **jmeter-server**, which takes commands from the GUI and send requests to the target system(s)
+ Target – the webserver we plan to stress test

执行步骤

1. On the slave systems, go to jmeter/bin directory and execute **jmeter-server.bat (jmeter-server on unix)**.
2. On master system acting as the console, open windows explorer and go to jmeter/bin directory
3. open jmeter.properties in a text editor 
4. edit the line “remote_hosts=127.0.0.1”
5. add the IP address. For example, if I have jmeter server running on 10.64.117.148 and 10.64.117.149,the entry would like like this:
   remote_hosts=xx.xx.xx.xx,xx.xx.xx.xx
6. Start jmeter.
7. Open the test plan you want to use

#### 2.1 slave节点配置

1. 安装JDK
2. 配置环境变量

```sh
vim /etc/profile

export DISPLAY=:0.0
export JAVA_HOME=~/JDK-9
export PATH=$PATH:$JAVA_HOME/bin

. /etc/profile
```
3. 启动jmeter

```sh
cd jmeter-home/bin

./jmeter-server -Djava.rmi.server.hostname=xx.xx.xx.xx  &
```

