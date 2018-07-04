## [格式化时间方式调用Curl](https://blog.csdn.net/hqzxsc2006/article/details/50547684)

详见引用：https://blog.csdn.net/hqzxsc2006/article/details/50547684

```sh
#curl -o /dev/null -s -w %{http_code}:%{http_connect}:%{content_type}:%{time_namelookup}:%{time_redirect}:%{time_pretransfer}:%{time_connect}:%{time_starttransfer}:%{time_total}:%{speed_download} www.baidu.com
```
