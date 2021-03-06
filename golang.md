## 常用链接
1. go concurrency
    ------https://docs.google.com/presentation/d/1C7er9lmnCZgTw-WrsRkOEhTtvf5MK1zSMExa3iXW91A/present?slide=id.i77

2. rob pike

    -------simplicity-is-complicated  http://www.thedotpost.com/2015/11/rob-pike-simplicity-is-complicated
    ------https://talks.golang.org/2015/simplicity-is-complicated.slide
3.  Rob Pike's 5 Rules of Programming
    ------http://users.ece.utexas.edu/~adnan/pike.html

4.  Concurrency Is Not Parallelism
    ----https://talks.golang.org/2012/waza.slide

5.  go present
    ----http://halyph.com/blog/2015/05/18/golang-presentation-tool.html

6.  best practise
    ----https://talks.golang.org/2013/bestpractices.slide#1

7. golang 1.7 SSA
    ----https://sillymon.ch/posts/SSAinGo1.7.html 
8. golang cgo
    ----https://www.goinggo.net/2013/08/using-c-dynamic-libraries-in-go-programs.html
9. golang flag
    ----http://blog.ralch.com/tutorial/golang-subcommands/

10. 配置[file watcher](https://stackoverflow.com/questions/33774950/execute-gofmt-on-file-save-in-intellij)

11. [Golang控制goroutine的启动与关闭](http://www.cnblogs.com/vimsk/p/4866586.html)

12. [https://awesome-go.com/](https://awesome-go.com/)

## 测试

1. [Testing Go HTTP API](http://dennissuratna.com/testing-in-go/)

## golang 反射

1 [在 GOLANG 中用名字调用函数](https://mikespook.com/2012/07/%E5%9C%A8-golang-%E4%B8%AD%E7%94%A8%E5%90%8D%E5%AD%97%E8%B0%83%E7%94%A8%E5%87%BD%E6%95%B0/)

## golang Map

1. [sync.Map](http://colobu.com/2017/07/11/dive-into-sync-Map/)

>>> sync.Map没有Len方法，并且目前没有迹象要加上 (issue#20680),所以如果想得到当前Map中有效的entries的数量，需要使用Range方法遍历一次， 比较X疼。

2. [go-maps-in-action](https://blog.golang.org/go-maps-in-action)

## cgo

1.  [CGO编程](https://chai2010.gitbooks.io/advanced-go-programming-book/content/ch2-cgo/ch2-07-memory.html)

## 社区

1. [golang-nuts](https://groups.google.com/forum/#!forum/golang-nuts)
2. [github gophercon](https://github.com/gophercon/2017-talks)

## golang101

1. [panic-and-recover-use-cases](https://go101.org/article/panic-and-recover-use-cases.html)
2. [优雅地关闭channel](https://www.jianshu.com/p/d24dfbb33781)
3. [业界流行的令牌桶(token-bucket)算法](https://www.alexedwards.net/blog/how-to-rate-limit-http-requests)
4. [aliyun流控的博客](https://blog.jamespan.me/2015/10/19/traffic-shaping-with-token-bucket)
5. [http stats中间件](https://github.com/thoas/stats)
6. [body 重用](https://medium.com/@xoen/golang-read-from-an-io-readwriter-without-loosing-its-content-2c6911805361)
7. [Diving Deep Into The Golang Channels](https://codeburst.io/diving-deep-into-the-golang-channels-549fd4ed21a8)
8. [HTTP Client based on middlewares](https://www.reddit.com/r/golang/comments/5ijwdp/http_client_based_on_middlewares/)
   + [cliware](https://github.com/delicb/cliware/blob/2b464a60fa549906d68c406a86ee6f7ffdc4de06/cliware.go)
   + [cliware-middlewares](https://github.com/delicb/cliware-middlewares/blob/b0fb368b63b5548808f0b7532f6a8f0280c34e4c/errors/errors.go)
   + [gentleman](https://github.com/h2non/gentleman)
   
9. [使用buffer以及in/out channel达到动态调整channel的大小](https://groups.google.com/forum/?nomobile=true#!topic/golang-nuts/RkGSPl5xOqM)
   + [Communicating Sequential Processes for JavaTM](https://www.cs.kent.ac.uk/projects/ofa/jcsp/)

## golang file

1.  func (*File) Seek该接口，不支持append flag的文件。if any. The behavior of Seek on a file opened with O_APPEND is not specified.在超大文件的磁盘缓存中，不能同时使用append和seek。

## golang pool

1. 一切可动态创建和回收的对象都可以使用pool, https://www.programming-books.io/essential/go/ec2352421ba7472ab82d9dcc71d2c389-sync.pool-for-better-performance

2. https://robreid.io/sync-pool/

## golang limit redirect

1. golang stdlib中，Client.CheckRedirect可以自定义处理重定向的次数。 系统默认有一个checkRedrect，10次就行了。
2. https://studygolang.com/articles/2974
