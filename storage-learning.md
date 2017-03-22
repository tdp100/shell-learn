## 存储设备

+ NAS(network attached storage)： NAS存储允许管理员分配一部分存储组成一个文件系统，每一个文件系统就是一个单一的命名空间，文件系统是管理NAS的主要单位
+ [SAN(storage area network)](http://searchstorage.techtarget.com/definition/storage-area-network-SAN)：SAN可以通过网络，让多台计算机共享网络上的存储。SAN使用相似的块协议，就像访问本地硬盘一样
+ DAS(direct attached storage)：DAS是最简单的存储模型。我们家里的个人电脑用的硬盘就是一个DAS。DAS只能给一台计算机使用



## 存储协议

+ NAS: [YANFS](https://blogs.oracle.com/shepler/entry/yanfs_is_the_new_webnfs)、NFS-SUN microsystem、[SMB-microsoft](http://searchnetworking.techtarget.com/definition/Server-Message-Block-Protocol)
+ DAS: [iSCSI-IBM](http://searchstorage.techtarget.com/definition/iSCSI)、SATA
+ SAN: [FC](http://searchstorage.techtarget.com/definition/Fibre-Channel)、iSCSI

## 云存储

通过hypervisor虚拟化出来的存储，其背后依然使用了DAS, SAN, NAS设备

+ 实例存储：可以用DAS实现，也可以用NAS或者卷存储
+ 卷存储：SAN，用NFS或者iSCSI实现
+ 对象存储：NAS， 对象存储提供最终的一致性，并且对高时延的WAN连接进行优化。由于对象存储的规模优势和成本优势，很多云环境采用对象存储来代替NAS。但对象存储这种弱一致性并不适合所有的场景，很多随机负载，对强一致性和性能都有要求，还是需要采用实例或者卷存储模型。

## [NAS和SAN的区别](http://searchstorage.techtarget.com/answer/SAN-vs-NAS-A-diagram-of-the-differences)

## 论文

+ [CACSS: TOWARDS A GENERIC CLOUD STORAGE SERVICE](http://www.leonli.co.uk/blog/wp-content/uploads/2012/05/CACSS-TOWARDS-A-GENERIC-CLOUD-STORAGE-SERVICE.pdf)
+ [Google File System Paper](https://static.googleusercontent.com/media/research.google.com/zh-CN//archive/gfs-sosp2003.pdf)
+ [GFS 中文版](http://blog.bizcloudsoft.com/wp-content/uploads/Google-File-System%E4%B8%AD%E6%96%87%E7%89%88_1.0.pdf)
+ [存储系统的那些事 许式伟]( http://www.infoq.com/cn/articles/storage-system-stuff)
2. 虚拟座谈会：有关分布式存储的三个基本问题 http://www.infoq.com/cn/articles/virtual-forum-three-basic-issues-about-distributed-storage
3. Hadoop http://blog.csdn.net/runningtortoises/article/details/51589918
4. Erasure Coding in Windows Azure Storage, Microsoft Corporation, https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/LRC12-cheng20webpage.pdf
5. Erasure Coding vs. Replication: A Quantitative Comparison, Hakim Weatherspoon and John D. Kubiatowicz, https://oceanstore.cs.berkeley.edu/publications/papers/pdf/erasure_iptps.pdf
6. Failure Trends in a Large Disk Drive Population, Google Inc, https://static.googleusercontent.com/media/research.google.com/zh-CN//archive/disk_failures.pdf
7. xp的分布式系统系列教程之: Erasure-Code: 工作原理, 数学解释, 实践和分析. http://drmingdrmer.github.io/tech/distributed/2017/02/01/ec.html
8. Amazon S3 Data Consistency Model https://docs.aws.amazon.com/AmazonS3/latest/dev/Introduction.html
9. [WORM-THE USE OF WRITE-ONCE READ-MANY OPTICAL DISKS FOR TEMPORARY AND ARCHIVAL STORAGE](https://pubs.usgs.gov/of/1992/0036/report.pdf)
10. [Windows Azure Storage: A Highly Available Cloud Storage Service with Strong Consistency ](http://sigops.org/sosp/sosp11/current/2011-Cascais/printable/11-calder.pdf)
11. [SOSP Paper – Windows Azure Storage: A Highly Available Cloud Storage Service with Strong Consistency](https://blogs.msdn.microsoft.com/windowsazurestorage/2011/11/20/sosp-paper-windows-azure-storage-a-highly-available-cloud-storage-service-with-strong-consistency/)
## 其它

+  [从Maglev到Vortex，揭秘100G＋线速负载均衡的设计与实现](http://www.infoq.com/cn/articles/Maglev-Vortex)
+  [Maglev论文](http://static.googleusercontent.com/media/research.google.com/en//pubs/archive/44824.pdf)
+  [Mathematics for Computer Science](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-042j-mathematics-for-computer-science-fall-2005/lecture-notes/)
+  [23rd ACM Symposium on Operating Systems Principles (SOSP)](http://sosp2011.gsd.inesc-id.pt/)

## 会议

+ [usenix hotstorage16](https://www.usenix.org/conference/hotstorage16/workshop-program)

## 博客

+ [Werner Vogels(CTO - Amazon.com)](http://www.allthingsdistributed.com/2007/10/amazons_dynamo.html)
+ [存储系统的那些事-许式伟](http://www.infoq.com/cn/articles/storage-system-stuff)
