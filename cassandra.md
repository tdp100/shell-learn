1. Dynamo and Cassandra choose to be always writable

In Cassandra, consistency is not an all-or-nothing proposition, so we might more accurately
term it “tuneable consistency” because the client can control the number of
replicas to block on for all updates. This is done by setting the consistency level against
the replication factor.

## replication factor
The replication factor lets you decide how much you want to pay in performance to
gain more consistency. You set the replication factor to the number of nodes in the
cluster you want the updates to propagate to (remember that an update means any
add, update, or delete operation).

## consistency level
The consistency level is a setting that clients must specify on every operation and that
allows you to decide how many replicas in the cluster must acknowledge a write operation
or respond to a read operation in order to be considered successful. That’s the
part where Cassandra has pushed the decision for determining consistency out to the
client.

## Row-Oriented
Each row has a unique key, which makes its data
accessible. So although it’s not wrong to say that Cassandra is columnar or columnoriented,
it might be more helpful to think of it as an indexed, row-oriented store

Cassandra stores data in what can be thought of for now as a multidimensional hash
table. That means you don’t have to decide ahead of time precisely what your data
structure must look like, or what fields your records will need

## keyspace and column families
Cassandra requires you to define an outer container, called a keyspace, that contains
column families. The keyspace is essentially just a logical namespace to hold column
families and certain configuration properties. The column families are names for associated
data and a sort order

## Lots of writes
These are strong use cases for Cassandra because they involve lots of writing with less
predictable read operations

## Geographical Distribution
Cassandra has out-of-the-box support for geographical distribution of data. You can
easily configure Cassandra to replicate data across multiple data centers. If you have a
globally deployed application that could see a performance benefit from putting the
data near the user, Cassandra could be a great fit.

## Cluster(ring)
the outermost structure in Cassandra is the cluster, sometimes called the
ring, because Cassandra assigns data to nodes in the cluster by arranging them in
a ring.

## 公式
http://www.infoq.com/cn/articles/virtual-forum-three-basic-issues-about-distributed-storage
权衡的因素有很多——可靠性要求、可用性要求、时延要求、一致性要求、使用模式相关要求（包括请求大小、QPS/IOPS、吞吐）等。

比如：

对于块存储，要求的访问时延是 10ms 级的，因为给虚拟机用的，传统硬盘也是10ms 级的时延，请求尺寸都很小，但qps（iops）可能会很高，那么在这种情况下：
异地多中心是不现实的，存储要和主机尽量接近，相应地可靠性必然会有所打折
强一致副本不会过多，强一致要求对时延有影响
对于对象存储，要求的访问时延是 100ms - 1s 级的，请求一般是中到大尺寸，低 qps 的，在这种情况下
可以用更多的分散副本数来换取更高的可靠性，但过多副本增加维持一致性的难度，需要折衷

## 参考

1. Cassandra The Definitive Guide.pdf
2. [Facebook’s Cassandra paper, annotated and compared to Apache Cassandra 2.0](http://docs.datastax.com/en/articles/cassandra/cassandrathenandnow.html)
