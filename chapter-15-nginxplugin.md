develop nginx plugin

## IDE

emacs

## compile

## luajit
1. [install luajit](http://luajit.org/download.html)

have a issue:

```shell
 /usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed/limits.h:168:61: fatal error: limits.h: No such file or directory
 #include_next <limits.h>  /* recurse down to the real one */
```

原因是我本机上没有安装`sudo apt-get install -y build-essential`, 安装完后编译OK

编译命令：

```shell
vim Makefile
make
sudo make install
```

## lua

1. [install lua](http://www.lua.org/)

have a issue:

```shell

gcc -o lua  lua.o liblua.a -lm -Wl,-E -ldl -lreadline -lhistory -lncurses
/usr/bin/ld: cannot find -lncurses
collect2: error: ld returned 1 exit status
Makefile:55: recipe for target 'lua' failed
make[2]: *** [lua] Error 1
make[2]: Leaving directory '/home/tdp/Downloads/lua-5.1/src'

```

原因是我本机上没有安装`sudo apt-get install libncurses5-dev`, 安装完毕后一切OK

```shell
# 修改安装路径
vim Makefile

# make linux

# sudo make install

```

## download ngx_devel_kit

https://github.com/simpl/ngx_devel_kit/tags

## download lua-nginx-module

https://github.com/openresty/lua-nginx-module/releases/tag
 

## build nginx

```shell

./configure --prefix=/opt/nginx --with-ld-opt="-Wl,-rpath,/usr/local/luajit/lib" --add-module=/home/tdp/Downloads/ngx_devel_kit --add-module=/home/tdp/Downloads/lua-nginx-module

make

sudo make install
```


## reference

1. http://www.evanmiller.org/nginx-modules-guide.html
2. http://wiki.nginx.org/3rdPartyModules
3. https://github.com/alibaba/nginx-http-concat
4. http://openresty.org/download/agentzh-nginx-tutorials-en.html
5. https://github.com/nihuo/Nginx-Module-Development-Tutorial
6. http://tengine.taobao.org/book/chapter_04.html //filter module.
