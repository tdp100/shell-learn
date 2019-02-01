###  WAL(Write-Ahead Log)

1. [breaking-the-wiredtiger-logjam-the-write-ahead-log](https://engineering.mongodb.com/post/breaking-the-wiredtiger-logjam-the-write-ahead-log-1-2)

   1. 引入slot，多线程将数据写入到buffer中，最后再full-sync到操作系统文件上
   2. 使用位视图和位偏移实现多个计数器的在两同一个变量中实现原子操作。减少了多线程场景下因为CPU繁忙导致CAS原子操作时的busy。
   3. 使用50ms超时来解决空闲时full-sync问题
