## [Go 在证券行情系统中的应用](http://www.10tiao.com/html/528/201709/2653370259/1.html)

>>>Go使用CMS，它的优点是不中断业务的情况下并行执行，将停顿时间降低到最小，缺点是GC并行执行需要更多的状态同步开销，降低了GC吞吐量以及堆空间增长难以预测。

>>>GC捡垃圾的速度跟不上业务线丢垃圾的速度，导致我们的堆空间暴涨。

>>>我们要避免Goroutine的频繁创建销毁,...频繁创建的Goroutine在销毁时产会生大量的内存垃圾，比如每秒创建或销毁1000个Goroutine时，垃圾就非常多，GC线程就会非常繁忙。CPU 30%－50%的时间用来处理GC。整个系统的响应速度就会很慢。这时就不能每个请求创建一个Goroutine那么奢侈，最好用采用Nginx并发模型。


## [NGINX Concurrent model](https://www.nginx.com/resources/library/complete-nginx-cookbook/)
