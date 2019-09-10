### 基础知识

1. [Go语言高级编程-CGO](https://chai2010.cn/advanced-go-programming-book/ch2-cgo/ch2-07-memory.html)
2. [safe.Pointer](https://studygolang.com/articles/20847)
3. [//go:linkname](https://studygolang.com/articles/15842)
4. [//go:linkname](https://golang.org/src/cmd/compile/doc.go?h=Compile)
5. [CGO](https://golang.org/cmd/cgo/)
   >Exception: static variables in the preamble may not be referenced from Go code; static functions are permitted.
   >在C中，static是relocatable object内可见，其它relocatable object不可见，不能被链接。
   >[Chapter 7 Object File Format](https://docs.oracle.com/cd/E19120-01/open.solaris/819-0690/6n33n7fcb/index.html)
6. [C-GO-CGO](https://blog.golang.org/c-go-cgo)
7. [Go_references_to_C](https://golang.org/cmd/cgo/#hdr-Go_references_to_C)
8. [gccgo](https://golang.org/doc/install/gccgo)
10. [from Source to Binary: How GNU Toolchain Works](https://www.slideshare.net/jserv/from-source-to-binary-how-gnu-toolchain-works)
11. [The C++ compilation process](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/compile.html)

### GO Tool

1. go tool objdump
   >go tool objdump [-S] [-s symregexp] binary [start end]

### 格式

1. ELF
