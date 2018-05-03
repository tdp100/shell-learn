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
