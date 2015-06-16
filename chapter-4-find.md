#shell find
查询

1. 命令帮助
```sh
find --help
man find
```

2. 基本格式
```sh
find path -options expression
```

3. 无错误输出
```sh
find / -name ttt.sh 2>/dev/null
```

4. find命令把查询结果赋值给xargs命令, 所以可以配合使用，如：
```sh
find ./ -name main.js | xargs grep -2 "lang"
```
