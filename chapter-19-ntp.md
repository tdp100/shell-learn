## 1. 为什么需要时钟同步
1. 在分布式系统中，一致性算法要求对操作的记录有一致的时间顺序，就就需要整个系统的时钟同步，但往往受限了网络时延，各个服务器的时钟并不一致，这就为一致性实现带来了复杂性。
2. 在系统认证中也会遇到同样的问题，比如基于token的认证，所有的token都是iam服务生产的，如果各服务之间基于token做有效性校验，而时钟却不与IAM的保持一致，也会影响系统的正常功能

## 2 NTP服务，以及闰秒问题

## 3 Google Spanner，基于原子钟和GPS实现全球一致性的数据库

1 [Spanner: Google's Globally-Distributed Database](https://research.google.com/archive/spanner.html)
