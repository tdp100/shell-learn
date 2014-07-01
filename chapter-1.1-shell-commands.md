#常见命令

**********************
#### 使用vi 设置文件格式
“行终束符”，unix/linux使用 换行符;而dos/windows使用 回车+换行

解决办法                       
1. 使用vi打开该脚本
2. 设置fileformat(ff) 
   :set ff=unix
3. 另存
   :w test.sh
此时sh就能在linux下执行了(运行前注意是否可执行)

#### exit
当执行exit时，脚本将立即终止， 可以给exit语句传递一个状态值

`exit 0`      
exits your script and sets the exit status to 0 (success)
`exit 1`                  
exits your script and sets the exit status to 1 (failure)


$? will contain the exit status of the last command executed.

```shell
# Check the exit status

cd $some_directory
if [ "$?" = "0" ]; then
	rm *
else
	echo "Cannot change directory!" 1>&2
	exit 1
fi
```

#### 查看脚本执行详情
set -x to turn tracing on and set +x to turn tracing off. For example

```shell
#!/bin/bash

number=1

set -x
if [ $number = "1" ]; then
    echo "Number equals 1"
else
    echo "Number does not equal 1"
fi
set +x
```

#### 键盘输入 read
read 从键盘中读取一值，并赋值给一个变量

```shell
#!/bin/bash

echo -n "Enter some text > "
read text
echo "You entered: $text"
```

#### 计算
shell 只提供了integer的计算能力，对浮点运算不支持

语法: $((expression))

```shell
#!/bin/bash

first_num=0
second_num=0

echo -n "Enter the first number --> "
read first_num
echo -n "Enter the second number -> "
read second_num

echo "first number + second number = $((first_num + second_num))"
echo "first number - second number = $((first_num - second_num))"
echo "first number * second number = $((first_num * second_num))"
echo "first number / second number = $((first_num / second_num))"
echo "first number % second number = $((first_num % second_num))"
echo "first number raised to the"
echo "power of the second number   = $((first_num ** second_num))"
```

#### 退出函数?
http://linuxcommand.org/writing_shell_scripts.php

menu()         
{
	echo "\$1 is $1"
	echo "this is $2"
	reture 9
	#函数内内语句也无分号;
}

menu aa bb
#和C语言不同，执行函数不带括号()

menu aa bb
result=$?
echo "$result”