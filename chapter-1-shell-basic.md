# Shell基本编程

shell 学习，提升效率
*****************************

## chapter 1 变量

Shell的类型只有**字串变量**，所以要使用数值运算则必须靠外部命令达成目的。而其变量种类有下列几种：

### 1. 普通变量

这是最常使用的变量，我们可以使用任何不包含空白字元的字串来当做变量名称。 设定变量值时则用下列方式：

+ `var=string`   

#不能是var = string，即**等号两边不能有空格**。与判断语句正好相反，判断语句表的=或者其他符号两边必须有空格，否则为赋值运算

+ 取用变量时则在变量名称前加上一"$" 号，或者${name}。

```sh
name=Tom
echo name
echo $name
结果如下：
name
Tom
```

### 2. 环境变量

和使普通变量相似，只不过此种变量会将其值传给其所执行的命令。

要将一普通变量设定为系统变量，只要加上：
`export var` 或者 `export var=var_value` 或者 `setenv var var_value` 或者

```sh
name=Tom
export name
```

以下是使用者一进入系统之後就已设定好的系统变量:

+ 1. $HOME 使用者自己的目录
+ 2. $PATH 执行命令时所搜寻的目录
+ 3. $TZ 时区
+ 4. $MAILCHECK 每隔多少秒检查是否有新的信件
+ 5. $PS1 在命令列时的提示号
+ 6. $PS2 当命令尚未打完时，Shell要求再输入时的提示号
+ 7. $MANPATH man 指令的搜寻路径

### 3. 只读变量

和普通变量相似，只不过这些变量不能被改变。要将变量设成只读的，只要加上：

`readonly var`

***还有一点，系统变量不可以设定成只读的***

### 4. 特殊变量

有些变量是一开始执行Script时就会设定，并且不可加以修改，但我们不叫它只读的系统变量，而叫它特殊变量，因为这些变量是一执行程式时就有了，况且使用者无法将一般的系统变量设定成只读的：

+ $0 这个程序的执行名字
+ $n 这个程序的第n个参数值,n=1..9
+ $* 这个程序的所有参数
+ $@ 这个程序的所有参数
+ $# 这个程序的参数个数
+ $$ 这个程序的PID
+ $! 执行上一个背景指令的PID
+ $? 执行上一个指令的返回值

### 5. command Substitution(命令替换)

+ 使用` `,  eg: date1=`date`
+ 推荐使用 $(), 注意括号两边要有空格, eg: date1=$( date )

### 6. test an expression

+ test command, build-in command. eg:

```sh
## true if a regular file
test -f hello.txt 
```

+ [], alternative version.  eg:

```sh
[ -f hello.txt ]
```

+ File Tests, eg:

```sh
 test -f /etc/fstab
 [ -f /etc/fstab ]
```

+ Integer Tests, -eq, -ne, -gt, -lt, -ge, and -le operators. eg:

```sh
 test 1 -eq 1
 [ 1 -eq 1 ]
 ```
	 
+ String Tests, The = operator tests for equality, != tests for inequality, The -z and -n operators return successfully if their arguments are empty or nonempty. eg

```sh
 [ -z "" ]
 test "$a" = "$b"
 [ "$q" != "$b" ]
 ```
 
+ (()), A nonstandard feature, `(( arithmetic expression ))` returns false if the arithmetic expression
evaluates to zero and returns true otherwise. eg: `echo $(( 1+1 ))`

+ [[]], nonstandard, does the same as test with the additional feature of
comparing regular expressions. eg:

```sh
string=whatever
[[ $string =~ h[aeiou]  ]]
```
	  
## chapter 2 引用

某些字符在SHELL中具备特殊的含义, 如：& * + ^ $ ` " | ? [ ] ; ^ < >               
可以使用双引号或者单引号或者\去掉特殊字符的含义，使成为一个普通字符.

+ 双引号：””可以去掉除$, \, ``之外的所有特殊字符的含义。
+ 单引号：‘’单引号可以去掉除\以外的任何特殊字符的含义，使成为一个普通字符.
+ 反斜杠： \可以去掉& * + ^ $ ` " | ?的特殊含义，\本身的特殊含义可以用\去掉，比如\\后面一个\就是普通字符    

## chapter 3 重新定向

+ 输入定向 <
+ 输出定向 >
+ 输出追加 >>
+ 管道 |

## chapter 4 基本流程语句


### 1. 条件语句

1. if-then-fi                                 

```sh
if  condition                     
then                    
...                    
fi               
  ```

我们经常使用的书写方式：使用;符号，在一行中包含多条命令与语句               

```sh
if  condition  ；then            
 ...                 
fi               
```
  
2. if-then-else-fi                                 

```sh
If  condition 
then
 ...
else
 ...
fi
```
  
或者                

```sh
if condition1
then
 ...
elif condition2
then
 ...
else
 ...
fi
```

### 2. 循环

1. while                                              

```sh
while express             
do              
 ...            
done        
#从循环中退出使用 break和continue命令              
```

2. for                                 

```sh
for var in arg1 arg2 ... argn            
do                   
 ...               
done              
#从循环中退出使用 break和continue命令                
```

3. until                                 

```sh
until express              
do           
 ...              
done                  
#从循环中退出使用 break和continue命令                              
```

### 3. 选择

1. case                                 

```sh
case var in                         
var1) 
 ... #代码语句                          
;;                       
var2|var3)                     
 ...                 
;;                
*)                       
;;                 
esac                
```

2. select                                 

```sh
select variable [in list]                                
do                    
 command...                    
break                      
done                            
```

## chapter 5 比较

I chose to use the [ expression ] form of the test command since most people think it's easier to read. Notice that the spaces between the "[" and the beginning of the expression are required. Likewise, the space between the end of the expression and the trailing "]".

### 1. 字符串比较

1. 字符串相等比较                                  

```sh      
if [ $str = “value” ]; then        #注意等号两边比较有空格，否则为赋值运算
…
fi
```

2. 字符串是否为空                                 

```sh
if [ “-$str” = “-” ]; then         #-没有任何含义，只是为了增加可读性
…
fi

if [ “X$str” = “X” ]; then         #X没有任何含义，只是为了增加可读性
…
fi
```
  
3. 字符串不相等比较                                 

```sh
if [ $str != “value” ]; then       #注意等号两边比较有空格，否则为赋值运算
…
fi

if [ ! $str = “value” ]; then      #！为not的含义，即取反
…
fi
```

### 2. 数字比较

1. 大于、大于等于                                 

```sh
if [ $str -gt 100 ]; then        #-gt表示大于
…
fi

if [ $str -ge 100 ]; then        #-ge表示大于等于
…
fi
  ```

2. 小于、小于等于

```sh
if [ $str -lt 100 ]; then        #-lt表示小于
…
fi

if [ $str -le 100 ]; then        #-le表示小于等于
…
fi
  ```
3. 等于、不等于  

```sh
if [ $str –eq 100 ]; then        #-eq表示等于
…
fi

if [ $str -ne 100 ]; then        #-ne表示不等于
…
fi

if [ ! $str -eq 100 ]; then        #!表示取否，-eq表示等于
…
fi
```

### 3. 判断条件连接

1. 与/and，即要求表达式1与表达式2同时为真

```sh
if express1 && express 2 ;           #&&表示与/and含义
then
…
fi

if [ str1 = “aa” ] && [ str2 = “bb” ] ;     
then
…
fi
```

2. 或/or，即要求表达式1或者表达式2之一为真
  
```sh
if express1 || express 2 ;             #||表示或/or含义
then
…
fi

if [ str1 = “aa” ] || [ str2 = “bb” ] ;     
then
…
fi
```

3. 取反
  
```sh
if ! express1 ;                    #！表示去反
then
…
fi

if [ ! $? –eq 0 ]; 
then
…
fi
```

## chapter 6 Sh 函数

可以将SH中需要重复执行的代码写成函数，与C编程的函数一致。            

***函数格式***                         

1. 定义函数的格式为：

```sh
    函数名（）                 
    {                           
       ...              
    }                   
    或者                         
    函数名（）{                         
       ...                    
    }                     
    两者方式都可行。如果愿意，可在函数名前加上关键字function，建议增加。                  
    function 函数名（）              
    {                  
     ...                  
    }                  
```

2. 向函数传入参数                
    函数可以带参数调用，调用方式为:                          
    函数名称  参数列表                            
    函数取得传入的参数，与SH得到调用的参数完全一致：                        
    判断参数个数：                    
    $#                         
    取参数：                           
    $1  $2 …                       

## chapter 7 if 表达式中的比较操作

+ -e  文件已经存在
+ -f  文件是普通文件
+ -s  文件大小不为零
+ -d  文件是一个目录
+ -r  文件对当前用户可以读取
+ -w  文件对当前用户可以写入
+ -x  文件对当前用户可以执行
+ -g  文件的 GID 标志被设置
+ -u  文件的 UID 标志被设置
+ -O  文件是属于当前用户的
+ -L  文件是符号链接文件
+ -G  文件的组 ID 和当前用户相同
+ file1 -nt file2 文件 file1 比 file2 更新
+ file1 -ot file2 文件 file1 比 file2 更老
+ -z string 判断字符串为空
+ -n string 判断字符串不为空
+ string1 = string2 string1等于string2
+ string1 != string2 string1不等于string2


## chapter 8 bash在控制台下的快捷键

+ ctrl+u 删除光标以前的所有字符
+ ctrl+d 删除光标以前的一个字符
+ ctrl+k 删除光标以后的所有字符
+ ctrl+h 删除光标以后的一个字符
+ ctrl+t 调换光标前两个字符的次序
+ ctrl+a 移动光标到最前面
+ ctrl+e 移动光标到最后面
+ ctrl+p 上一个命令
+ ctrl+n 下一个命令
+ ctrl+s 锁定输入
+ ctrl+q 解除锁定
+ ctrl+f 移动光标到后一个字符
+ ctrl+b 移动光标到前一个字符
+ ctrl+x 标记一个位置
+ ctrl+c 清除当前的输入


## chapter 9 linux 资源

http://blog.jobbole.com/76316/
