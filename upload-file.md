### 1. 上传大文件
1. XHR file upload
2. Blob API

实现方式：
1. HTTP Chunked 上传, 即使用http stream上传方式，它需要设置Transfer-Encoding头信息。
2. HTTP Multipart上传, 即form表单的enctype=multipart/form-data, 请参考[rfc1867 Form-based File Upload in HTML](https://tools.ietf.org/html/rfc1867)

### 2. chunk的格式
```json
num\r\n
chunk_content\r\n

//结束标识
0\r\n 
\r\n
```

### 3. HTTP访问控制（CORS）
[HTTP访问控制（CORS）](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)

浏览器控制流程：

对那些可能对服务器数据产生副作用的 HTTP 请求方法（特别是 GET 以外的 HTTP 请求，或者搭配某些 MIME 类型的 POST 请求），

step1: 浏览器必须首先使用 OPTIONS 方法发起一个预检请求（preflight request），从而获知服务端是否允许该跨域请求。
在预检请求的返回中，服务器端也可以通知客户端，是否需要携带身份凭证（包括 Cookies 和 HTTP 认证

step2: 服务器确认允许之后，浏览器才发起实际的 HTTP 请求。相关数据）

### 参考
1. [Advanced Uploading Techniques — Part 1](http://creativejs.com/tutorials/advanced-uploading-techniques-part-1/index.html)
2. [HTTP Streaming](https://gist.github.com/CMCDragonkai/6bfade6431e9ffb7fe88)
3. [四种常见的 POST 提交数据方式](https://imququ.com/post/four-ways-to-post-data-in-http.html)
4. []
