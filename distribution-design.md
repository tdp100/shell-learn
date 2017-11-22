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


