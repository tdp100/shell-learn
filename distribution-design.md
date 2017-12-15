### 1. [分布式系统工程实践](http://docs.linuxtone.org/ebooks/Architecture/%E5%88%86%E5%B8%83%E5%BC%8F%E7%B3%BB%E7%BB%9F%E5%B7%A5%E7%A8%8B%E5%AE%9E%E8%B7%B5_taobao.pdf)

### 2. [LESLIE LAMPORT paxos主页](http://www.lamport.org/)

### 3. [Paxos算法的改进点]

1. 基于超时机制的Paxos

### 4. [康奈尔大学计算机系 Paxos Made Moderately Complex](http://paxos.systems/index.html)

### 5. [介绍的比较全面中国人最容易懂的paxos](http://blog.csdn.net/dellme99/article/details/14162159)

1. promise：Acceptor对proposer承诺，如果没有更大编号的proposal会accept它提交的proposal
2. accept：Acceptor没有发现有比之前的proposal更大编号的proposal，就批准了该proposal
3. chosen：当Acceptor的多数派都accept一个proposal时，该proposal就被最终选择，也称为决议
4. proposer: 提案者，负责向acceptor提交proposal
4.1 prososer leader:提案Leader，充当其它proposer的代理人，向acceptor提交proposal
5. Acceptor: 提案接收者
6. learner: 只能"学习"被批准的提案

### 6. [Google's Infrastructure for Everyone Else](https://github.com/GIFEE/GIFEE)

### 7. [持续可用与CAP理论 – 一个系统开发者的观点](https://yq.aliyun.com/articles/26616?spm=5176.100239.blogcont54371.22.CNYIu3)

1. 共享存储
2. Paxos解决方案

### 8. [分布式一致性算法：Raft 算法（论文翻译）](https://yq.aliyun.com/articles/71302?spm=5176.100239.blogcont54371.21.aMG8QJ)

1. [etcd-服务注册与发现](http://ralphbupt.github.io/2017/05/04/etcd-%E6%9C%8D%E5%8A%A1%E6%B3%A8%E5%86%8C%E4%B8%8E%E5%8F%91%E7%8E%B0/)

### 9. [MIT 分布式课程](http://nil.csail.mit.edu/6.824/2016/schedule.html)

1. [Distributed transactions,• Availability • Replicated State Machines](http://web.mit.edu/6.033/www/lec/s19.pdf)

### 10.[yan Barrett, Google App Engine datastore lead, gave this talk Transactions Across Datacenters (and Other Weekend Projects) at the Google I/O 2009 conference. ](http://highscalability.com/blog/2009/8/24/how-google-serves-data-from-multiple-datacenters.html)

### etcd 

1. [本地搭建etcd 集群](https://skyao.gitbooks.io/learning-etcd3/content/documentation/dev-guide/local_cluster.html)：

```
goreman -f Procfile start
```

### 本地编程：
[golang开发环境搭建-安装go 和 grpc](http://www.jianshu.com/p/e2435b834d68)
