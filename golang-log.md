## go log

go语言中已经提供了log包，其中log最核心的是output，它是log中的一个属性，用于指定日志的输出。通常可以给log实例设置output.

output是一个interface 类型，需要实现一个Writer接口，正因为如此，我们可以实现一个写入到文件的log库， 比如：logger,

它实现了Writer接口，同时也可以使用logger来管理file对象，实现日志文件的切割、压缩、定时清空等一系列的操作。