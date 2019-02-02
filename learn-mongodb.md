###  WAL(Write-Ahead Log)

1. [breaking-the-wiredtiger-logjam-the-write-ahead-log](https://engineering.mongodb.com/post/breaking-the-wiredtiger-logjam-the-write-ahead-log-1-2)

   1. 引入slot，多线程将数据写入到buffer中，最后再full-sync到操作系统文件上
   2. 使用位视图和位偏移实现多个计数器的在两同一个变量中实现原子操作。减少了多线程场景下因为CPU繁忙导致CAS原子操作时的busy。
   3. 使用50ms超时来解决空闲时full-sync问题

### Sharded cluster

1. [MongoDB Sharded cluster架构原理](https://yq.aliyun.com/articles/32434?spm=a2c4e.11153940.blogcont60096.5.4fb078ddnEXTiD)

    1. mongos, config server, shard（replica set)
    2. 按shardkey进行数据分区partition。shardkey可以经过hash function转换为int型，内部按range进行范围分片。
    3. 按range分片，每一个chunk对应一个范围。 
    4. 如果chunk容量过满，则chunk在自身范围内进行分裂，再细划出N个小范围chunk。让存储容量空间扩大N倍。
    5. 当各个shard上chunk数量不均衡时，会触发chunk在shard间的迁移
    6. database开启分片， collection开启数据分片

    
   
   
