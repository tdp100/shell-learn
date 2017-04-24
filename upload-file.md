## 上传大文件
1. XHR file upload
2. Blob API

实现方式：
1. HTTP Chunked 上传, 即使用http stream上传方式，它需要设置Transfer-Encoding头信息。
2. HTTP Multipart 上传

### chunk的格式
```json
num\r\n
chunk_content\r\n

//结束标识
0\r\n 
\r\n
```

## 参考
1. [Advanced Uploading Techniques — Part 1](http://creativejs.com/tutorials/advanced-uploading-techniques-part-1/index.html)
2. [HTTP Streaming](https://gist.github.com/CMCDragonkai/6bfade6431e9ffb7fe88)
