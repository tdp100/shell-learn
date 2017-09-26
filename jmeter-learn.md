### 1. 下载jmeter

+ linux [apache-jmeter-3.3.tgz](http://jmeter.apache.org/download_jmeter.cgi)

#### 1.1 解压jmeter

1. 解压jmeter tgz 到 ~/jmeter33目录

```sh
mkdir -p ~/jmeter33
unzip apache-jmeter-3.3.zip
```

#### 1.2 Master节点安装监控插件

1. 下载最新jmeter插件[jmeter-plugins-standard downloads page](http://jmeter-plugins.org/downloads/all/#Latest-Stable-Release)

2. 根据需求选择合适的插件，我们使用的`jmeter-plugins-standard`

3. 解压缩`JMeterPlugins-Standard-1.3.0.zip`,复制文件`JMeterPlugins-Standard-1.2.1/lib/ext/JMeterPlugins-Standard.jar`到`JMeter目录\apache-jmeter-2.13\lib\ext`目录下。

4. 重启JMeter

#### 1.3 Slave节点安装监控agent

 1. 下载最新[ServerAgent-2.2.1.zip downloads page](http://jmeter-plugins.org/downloads/all/ServerAgent-2.2.1.zip)

 2.  拷贝文件到需要监控的机器到指定目录

 3.  确认机器有安装JDK

 4.  启动服务
 
 ```sh
 ./startAgent.sh &

## a. You can specify the listening ports as arguments (0 disables listening), default is 4444:
## ./startAgent.sh --udp-port 0 --tcp-port 3450
 ```
