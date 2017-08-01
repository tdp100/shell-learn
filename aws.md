### s3-curl

1. install s3-curl: http://www.dowdandassociates.com/blog/content/howto-install-aws-cli-amazon-simple-storage-service-s3-s3curl-dot-pl/
2. Amazon S3 Authentication Tool for Curl: https://aws.amazon.com/code/128
3. s3-curl github: 

#### s3curl 命令行使用方式：

```sh
./s3curl.pl --id=[aws-access-key-id] --key=[aws-secret-access-key] -- http://s3.amazonaws.com/[bucket-name]/[key-name]
```

#### xml格式化输出

```sh
./s3curl.pl --id=[aws-access-key-id] --key=[aws-secret-access-key] -- http://s3.amazonaws.com/[bucket-name]/[key-name] -v | xmllint --format
```
