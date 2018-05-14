## java 8

1. PermGen空间被移除了，取而代之的是Metaspace（JEP 122）。JVM选项-XX:PermSize与-XX:MaxPermSize分别被-XX:MetaSpaceSize与-XX:MaxMetaspaceSize所代替。
2. conncurent中增加了stampedLock和fork/join框架
3. Lambda语法
4. parallel数组
5. Optional类，解决空指针问题

## java协程

1. [loom 轻量级的线程](http://openjdk.java.net/projects/loom/)
2. [kotlin coroutine](https://kotlinlang.org/docs/reference/coroutines.html)

## reactive stream

1. [Reactive架构升级实践——淘宝全站业务的全异步流式架构升级.pdf]()
2. [reactive stream](http://www.reactive-streams.org/)
3. [reactive manifesto 响应式宣言](https://www.reactivemanifesto.org)
4. [reactive flow](http://www.jdon.com/48781)
4. [发布者和订阅者之间的典型交互顺序](https://www.cnblogs.com/IcanFixIt/p/7245377.html)

### reactive stream的一些特点

1. 非阻塞背压(back pressure)
矛盾：在生产者和消费者模型中有两种形态，1：生产者生产消息后主动push给消费者，典型的实现有rabbit mq。 2：生产者生产消息后，由消息者主动来消费，这是pull模式，典型的有kafka。 

push模式下，如果生产者生产的速度大于消息的速度，则消息者会有崩溃的风险。如果限制生产，也会出现多用户场景下的不均衡。

背压的思想是在pull模式，由消息者主动提出能消费多少消息， 生产者每次提供不超过消息者一次消息能力的消息。这实质就是一种系统反馈。


