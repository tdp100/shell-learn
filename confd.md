[confd](https://github.com/kelseyhightower/confd)
-------------------------------

confd是一个轻量级的配置监控工具，它可以支持多种backends配置工具，比如分布式key/value存储软件etcd和zookeeper。它backends发生配置变更时，它能够监控并更新配置文件，同时执行脚本让application重启加载新的配置文件

### 1. 原理

backends提供key/value存储能力，以etcd为例，它采用Raft算法实现分布式key/value存储，并且保持强一致性。可以使用etcdctl工具对键值进行增删查改操作。而confd周期性地监控etcd变化。一旦配置发生变化，confd将更新模板配置文件，并将配置文件输出到dest目录，让application重新加载。

### 2. confd组成

1. [toml](https://github.com/toml-lang/toml)配置语言

   toml和yaml、json类似，提供简洁的语法来描述配置规则。confd支持在定义template resource的toml文件，在该template resource文件中可以定义`[template]`标签，具体见：https://github.com/kelseyhightower/confd/blob/master/docs/template-resources.md， 在`[template]`中的src指定的source template文件采用go语言的template语法。

2. 目录结构
   
   默认的template resource toml文件放在/etc/confd/conf.d目录下，而source template文件则放在/etc/confd/templates目录中。具体参见：https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md 

### 3. application使用

application的配置文件需要是toml格式，所以需要toml解析包来解析toml语法并读取配置内容。


### 4. 延伸学习

1. alibaba开源的webx中提供的辅助工具[autoconfig](http://openwebx.org/docs/autoconfig.html)， 服务本身提供配置管理功能

2. [灰度发布与A/B Testing](http://www.jianshu.com/p/88f206f48278)

### 5. 功能开关

1. 第一种：服务提供功能开关，一旦开启或者关闭功能开关后，对所有用户生效
2. 第二种：类似于Gmail labs的窗口，用户可以选择使用或者关闭该功能。功能开关由用户自己决定
3. 第三种：A/B Test，服务新功能只让一部分人可用，当用户反馈好时再逐渐扩大部署范围。
