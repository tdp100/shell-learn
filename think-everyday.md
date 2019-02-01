## 2019.2.1

1. 是否应该将两个进程合部到一个容器中，通过回环地址通信?

实际问题： 采用了Pulsar作为任务中心，而选择Pulsar Function作为客户端，它封装了连接Pulsar server的能力，以更高级的API让用户使用。 但Pulsar Function目前只支持
java和python，并不支持golang。 因此想通过将Pulsar Function进程与Go服务进程合部到一个容器实例中，通过回环地址通信。

本质的问题：如果将Pulsar Function当作一个SDK看待，它与Go服务进程合并。 那么就是Go服务进程同时提供两个端口，一个端口是业务程序使用，一个端口是与Pulsar server通信。。

合部带来的问题：

1. 从容器的使用上看，一个容器一个进程是最好的实践，因为进程死掉后，容器会自动退出，这在容器集群架构下是非常好的，做到故障隔离。 多个进程部在一个容器中，就打破了
这种优势就没有了， 如果Pulsar Function进程死掉，你不得不使用另外的手段杀死Go服务进程，让容器自动退出。否则这会影响到业务的正常运行，故障容器没有被隔离。

2. 从进程处理能力上看，Pulsar Function不涉及业务逻辑，它是非常轻量的，处理效率非常的高；而Go服务进程是业务强相关的，它的处理效率可能比较低。如果合部，随着Go服务的扩容，
同时也将Pulsar Function也一起扩容了，这是没有必要的，反而增加了Pulsar server的连接压力。

可以解决的办法：

Pulsar Function进程和Go服务进程分开部署，为Go服务进程创建一个集群负载，Pulsar Function与VIP通信。Pulsar Function与Go容器集群可以分开扩容。

