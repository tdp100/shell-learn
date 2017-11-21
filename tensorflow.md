## install tensorflow

1. install python 3.6.3

```sh
#eg: install path\Python\Python36
export PYTHON_HOME=path\Python\Python36
export PATH=:$PATH:$PYTHON_HOME:$PYTHON_HOME\Scripts
```
2. install tensorflow

```sh
pip3 install --upgrade tensorflow
```

 Set proxy, see [this](https://stackoverflow.com/questions/9698557/how-to-use-pip-on-windows-behind-an-authenticating-proxy)

3. run demo

由于我没有从源代码进行安装，所以会出现如下告警提示：`your cpu supports instructions that this tensorflow binary was not compiled to use avx`，可以设置日志级别关掉该提示，见https://github.com/tensorflow/tensorflow/issues/7778
