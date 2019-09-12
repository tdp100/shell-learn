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
   
2. go tool link
   >go tool link [flags] main.a
   
### 格式

1. ELF

### 编译CGO

具体问题： https://github.com/golang/go/issues/24592
使用go build xxx.go会找不到C语言定义的函数，需要直接build整个包。

>***When the Go tool sees that one or more Go files use the special import "C", it will look for other non-Go files in the directory and compile them as part of the Go package***. Any .c, .s, or .S files will be compiled with the C compiler. Any .cc, .cpp, or .cxx files will be compiled with the C++ compiler. Any .f, .F, .for or .f90 files will be compiled with the fortran compiler. Any .h, .hh, .hpp, or .hxx files will not be compiled separately, but, if these header files are changed, the package (including its non-Go source files) will be recompiled. Note that changes to files in other directories do not cause the package to be recompiled, ***so all non-Go source code for the package should be stored in the package directory, not in subdirectories.*** The default C and C++ compilers may be changed by the CC and CXX environment variables, respectively; those environment variables may include command line options.


如果要编译单独的一个go文件， 只能先将c文件编译成动态库。

step1 `gcc -fPIC -shared -o libfoo.so foo.c`

step2 `export CGO_LDFLAGS="-Wl,-Bdynamic -L/path -lfoo"`

step3 `go build xxx.go`

如果要静态链接，先将c文件编译成静态库

step1 `gcc -c -o foo.o foo.c`

step2 `ar rcs o libfoo.a foo.o`

step3 `export CGO_LDFLAGS="-Wl,-Bstatic -L/root/gotest/src/cgotest -lhello -Wl,-Bdynamic -lpthread -lgcc_s -lc -ldl -lrt -Wl,-dynamic-linker=/lib64/ld-linux-x86-64.so.2"`

step4 `go build -x --ldflags '-linkmode external -extldflags "-static"' foo.go`

step5 `ldd foo`

##--ldflags '-linkmode external -extldflags "-static"'  是传给go link的参数
##/opt/go/pkg/tool/linux_amd64/link -o $WORK/b001/exe/a.out -importcfg $WORK/b001/importcfg.link -buildmode=exe -##buildid=7vcbOOAdAfo1KTmt2g_1/zUkCWauDtjHIM8MX5O1O/WZxhSWLXYPrLlaRz99hl/7vcbOOAdAfo1KTmt2g_1 -linkmode external -extldflags -static -##extld=gcc $WORK/b001/_pkg_.a
```

静态/动态编译：https://renenyffenegger.ch/notes/development/languages/C-C-plus-plus/GCC/create-libraries/index
