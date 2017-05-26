#### 使用linux cgroup方式解决node.js 单CPU问题

基本思想：使用linux cgroups来绑定CPU， 同时不同的cgroup中分配不同的node.js进程，从而解决在一台机器上node.js 单CPU的问题， 这和容器的思维差不多。但好处是
cgroups更轻量，只隔离资源，可以做到进程间通信。
