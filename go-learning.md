## 1. Go汇编

1. Plan 9汇编语句的设计
2. 伪寄存器(FP, SP, SB, PC)
3. 地址和值的表示方法
4. 机器寄存器
5. obj文件
6. link和relocation，符号表

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

## 8. go tool

1. pprof
2. Env

## 9. scheduler

1. [Linux 2.6 CFS](http://www.ibm.com/developerworks/library/l-completely-fair-scheduler/l-completely-fair-scheduler-pdf.pdf)

