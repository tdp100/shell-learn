#shell 学习

出现语法错误，首先要看一下文件的编码格式是否正确，最好使用UE打开，设置unix, utf-8
vim查看文件编码格式： :set fileencoding

1. cp 

复制文件夹  cp -r fold newfold

2. find
$(echo $file|tr a-z A-Z)

3.if 语句
if  exp ; then

elif exp; then

else
 ;
fi

####3. RPM 安装操作命令
+ 解压 `rpm2cpio xxx.rpm | cpio -div`

+ 安装
 + `rpm -i example.rpm` 安装 example.rpm 包；
 + `rpm -iv example.rpm` 安装 example.rpm 包并在安装过程中显示正在安装的文件信息；
 + `rpm -ivh example.rpm` 安装 example.rpm 包并在安装过程中显示正在安装的文件信息及安装进度；

+ 查询
 + `rpm -q …`
 + 附加查询命令：
   + 1. a 查询所有已经安装的包以下两个附加命令用于查询安装包的信息；
   + 2. i 显示安装包的信息；
   + 3. l 显示安装包中的所有文件被安装到哪些目录下；
   + 4. s 显示安装版中的所有文件状态及被安装到哪些目录下；以下两个附加命令用于指定需要查询的是安装包还是已安装后的文件；
   + 5. p 查询的是安装包的信息；
   + 6. f 查询的是已安装的某文件信息；

 + 举例如下：
   + rpm -qa | grep tomcat4 查看 tomcat4 是否被安装；
   + rpm -qip example.rpm 查看 example.rpm 安装包的信息；
   + rpm -qif /bin/df 查看/bin/df 文件所在安装包的信息；
   + rpm -qlf /bin/df 查看/bin/df 文件所在安装包中的各个文件分别被安装到哪个目录下；

+ 卸载
 + rpm -e 需要卸载的安装包
   + 在卸载之前，通常需要使用rpm -q …命令查出需要卸载的安装包名称。

+ 升级
 + rpm -U 需要升级的包
 + 举例如下：
   + rpm -Uvh example.rpm 升级 example.rpm 软件包

+ 验证
 + rpm -V 需要验证的包
 + 举例如下：
   + rpm -Vf /etc/tomcat4/tomcat4.conf

+ 其他附加命令
 + --force 强制操作 如强制安装删除等；
 + --requires 显示该包的依赖关系；
 + --nodeps 忽略依赖关系并继续操作
