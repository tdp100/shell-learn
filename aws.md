### 1. s3-curl

1. install s3-curl: http://www.dowdandassociates.com/blog/content/howto-install-aws-cli-amazon-simple-storage-service-s3-s3curl-dot-pl/
2. Amazon S3 Authentication Tool for Curl: https://aws.amazon.com/code/128
3. s3-curl github: 

#### 1.1 s3curl 命令行使用方式：

```sh
./s3curl.pl --id=[aws-access-key-id] --key=[aws-secret-access-key] -- http://s3.amazonaws.com/[bucket-name]/[key-name]
```

#### 1.2 xml格式化输出

```sh
./s3curl.pl --id=[aws-access-key-id] --key=[aws-secret-access-key] -- http://s3.amazonaws.com/[bucket-name]/[key-name] -v | xmllint --format
```

### 2 aws-cli

命令行参考：http://docs.aws.amazon.com/zh_cn/cli/latest/index.html

2.1 安装：

```sh
git clone http://github.com/aws/aws-cli.git
cd aws-cli/
python setup.py install

complete -C aws_completer aws
source bin/aws_zsh_completer.sh
cd ../
mkdir ~/.aws
cd .aws/
vim credentials
aws s3api get-object -help

pip install --upgrade awscli
cd ../
cd aws-cli/
source bin/aws_bash_completer
./bin/aws_bash_completer
cd ~
aws_bash_completer
aws_completer

cd aws-cli/
dos2unix -f .
cd ..
find aws-cli/ -type f -exec dos2unix {} \;
cd aws-cli/
python setup.py install
aws
aws s3api get-object -help

```

2.2 命令：

```sh
aws s3api get-object --bucket [bucket-name] --key demo.html --part-number 1 demo

aws s3api get-object --no-verify-ssl --debug --bucket [bucket-name] --key demo.html --part-number 1 demo

### 查询多版本
aws s3api list-object-versions --no-verify-ssl --debug --bucket tdpdocument --prefix dfgsdgf/demo.txt
```
