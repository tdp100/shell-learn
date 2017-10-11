## 1. Go汇编

1. Plan 9汇编语句的设计
2. 伪寄存器(FP, SP, SB, PC)
3. 地址和值的表示方法
4. 机器寄存器
5. obj文件
6. link和relocation，符号表

### 1.1 寄存器

+ FP（frame pointer）: 帧指针，保存参数和本地变量

 编译器维护了一个虚拟的栈指针，使用对伪寄存器的offsets操作的形式，指向栈上的函数参数。 于是，0(FP)就是第一个参数，8(FP)就是第二个(64位机器)

+ PC：程序指针，负责跳转和流程控制
+ SB（static base）: 静态基指针，全局变量
 
 SB伪寄存器用来表示全局的变量或者函数，比如foo(SB)用来表示foo的地址。加<>表示符号本文件内可见。

+ SP（stack pointer）：栈指针，栈顶
  
  用来指向栈帧本地的变量和为函数调用准备参数。它指向本地栈帧的顶部，所以一个对栈帧的引用必须是一个负值且范围在[-framesize:0]之间，例如: x-8(SP)，y-4(SP)。 0（SP）表示第一个局部变量

## 2. 编译链接过程

1. 词法分析（src/cmd/compile/internal/gc/lex.go）---token流
2. 语法分析（src/cmd/compile/internal/gc/parser.go）---AST（GENERIC形式）
3. 语义分析（src/cmd/compile/internal/gc/typecheck.go）---AST（GENERIC形式
4. 平台无关中间代码生成（src/cmd/compile/internal/gc/walk.go）---IL（GIMPLE形式+CFG）
5. 平台无关优化  ---IL（GIMPLE形式+CFG）
6. 平台相关中间代码生成（src/cmd/compile/internal/gc/pgen.go）   ---RTL
7. 平台相关优化   ---RTL
8. 目标代码生成   ---汇编 / 机器码
9. 链接   ---可执行文件 / 共享库文件

## 3.阅读汇编代码

1. go build -gcflage="-S" xxx.go
2. go tool compile -S xxx.go
3. go tool compile -X xxx.go //debug lexer
4. go tool compile -W xxx.go //debug parse tree after type checking
5. go tool objdump xxx.exe
6. objdump -S xxx.o

## 4.stack自动扩展管理和TLS原理

1. runtime.morestack_noctxt
2. src/runtime/runtime2.go `type g struct `

## 5.go bootstrap过程

1. 借助GNU objdump

## 6.go 基本语法

1. 基本数据结构：string, array, slice, map, chan
2. make, new, append, copy, delete, len, cap, close
3. return语句的解析
4. defer原理
5. panic/recover
6. goroutine原理, [go scheduler](http://www.cs.columbia.edu/~aho/cs6998/reports/12-12-11_DeshpandeSponslerWeiss_GO.pdf)

## 7.go标准库

1. sync
2. reflect

**引用**
+ [GO REFLECTION BASICS EXPLAINED IN COLOR](http://www.hawthorne-press.com/GO_Reflection_Basics_Explained_In_Color.pdf)

## 8. go tool

1. pprof
2. Env

## 9. scheduler

1. [Linux 2.6 CFS](http://www.ibm.com/developerworks/library/l-completely-fair-scheduler/l-completely-fair-scheduler-pdf.pdf)
2. [Con Kolivas's blog](http://ck-hack.blogspot.com/)

## 10. concurrency

1. [Golang concurrency - data races](http://wysocki.in/golang-concurrency-data-races/)
2. [C. A. R. Hoare Communicating Sequential Processes](http://usingcsp.com/cspbook.pdf)
3. [Systems Performance: Enterprise and the Cloud](http://www.brendangregg.com/books.html)

## 11. others
1. [Linux Signal及Golang中的信号处理](http://colobu.com/2015/10/09/Linux-Signals/)
2. [GopherChina sliders](https://github.com/gopherchina)
3. [雨痕-学习笔记](https://github.com/qyuhen/book)
4. [state of go 2017](https://talks.golang.org/2017/state-of-go.slide)
5. [Mutex profile](https://rakyll.org/mutexprofile/)
6. [谢孟军 stae of go 1.8](http://blog.qiniu.com/archives/8203)
7. [Go London User Group](https://www.meetup.com/Go-London-User-Group/events/236962716/)
8. [Dave Cheney blogs](https://dave.cheney.net/about)
9. [Go programming language secure coding practices guide](https://github.com/Checkmarx/Go-SCP)
10. [Go 1.8 Plugins](https://speakerdeck.com/ianlewis/getting-plugged-in-with-go-1-dot-8-plugins-at-gophercon-india)
11. [gopherconindia-slides 2017](http://budhram.in/writing/2017/02/27/gopherconindia-slides/)

## 12. books

1. [go programming blueprint](https://books.google.com/books?id=15XcDgAAQBAJ&lpg=PA163&ots=iVzVyqPJPh&dq=should%20not%20use%20basic%20type%20string%20as%20key%20in%20context.WithValue&pg=PP3#v=twopage&q&f=true)
2. [go books list](https://github.com/miguellgt/books/tree/master/go)

## 13. 性能调优

1. [使用pprof优化golang性能](http://cjting.me/golang/use-pprof-to-optimize-go/)
2. [The complete guide to Go net/http timeouts](https://blog.cloudflare.com/the-complete-guide-to-golang-net-http-timeouts/)



# CGO

## 1. [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)

一个记录compiler和linker所需要的参数的工具，它会生成`.pc`描述文件

## 2. cgo

方式1. 定义编译和链接所需要的cgo参数

+ #cgo CFLAGS
+ #cgo LDFLAGS

方式2. 使用pkg-config方式提供编译和链接所需要的cgo参数

+ #cgo !no_pkgconfig pkg-config: MagickWand MagickCore


## 参考：

1. [Using CGO with Pkg-Config And Custom Dynamic Library Locations](https://www.goinggo.net/2013/08/using-cgo-with-pkg-config-and-custom.html)
2. [cgo项目如何编译便携版二进制文件](http://www.jianshu.com/p/15e5b0a50244)
