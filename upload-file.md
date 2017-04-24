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
### W3C File API
1. File API(File API)

+ A FileList interface, which represents an array of individually selected files from the underlying system. The user interface for selection can be invoked via <input type="file">, i.e. when the input element is in the File Upload state [HTML] .
+ A Blob interface, which represents immutable raw binary data, and allows access to ranges of bytes within the Blob object as a separate Blob.
+ A File interface, which includes readonly informational attributes about a file such as its name and the date of the last modification (on disk) of the file.
+ A FileReader interface, which provides methods to read a File or a Blob, and an event model to obtain the results of these reads.
+ A URL scheme for use with binary data such as files, so that they can be referenced within web applications.

2. [通过 File API 使用 JavaScript 读取文件](https://www.html5rocks.com/zh/tutorials/file/dndfiles/)

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
4. [分块传输编码 Chunked transfer encoding](https://zh.wikipedia.org/wiki/%E5%88%86%E5%9D%97%E4%BC%A0%E8%BE%93%E7%BC%96%E7%A0%81)
5. [Reading files in JavaScript using the File APIs](https://www.html5rocks.com/zh/tutorials/file/dndfiles/)

