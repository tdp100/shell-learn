## java 8

1. PermGen空间被移除了，取而代之的是Metaspace（JEP 122）。JVM选项-XX:PermSize与-XX:MaxPermSize分别被-XX:MetaSpaceSize与-XX:MaxMetaspaceSize所代替。

2. conncurent中增加了stampedLock和fork/join框架

3. Lambda语法

4. parallel数组
