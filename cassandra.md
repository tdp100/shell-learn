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
