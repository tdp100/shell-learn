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
