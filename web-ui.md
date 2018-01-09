### 1. Fiddler工具

Fiddler工具是一款功能强大的Web调试工具，在解决现网UI问题时，能够起到很好的预验证作用。 

在现网环境中，我们通过会遇到各种JS、Ajax出现错误，或者要打开某个UI的特性开关。经过定位，我们很快就修复了该问题，
但出版本->验证->升级beta环境->升级类生产环境->升级生产环境，这一过程会花很长的时间，很不敏捷。我们如果通过替换修改的UI文件或者接口，
直接验证现网的功能，那么修复速度是非常快的。 而Fiddler工具可以对请求进行拦截，并可以自定义响应体的内容，从而来模拟替换现网UI文件或者接口,
达到验证的效果。

+ Fiddler下载地址: https://www.telerik.com/fiddler

#### 1.1 Fiddler命令

Fidder支持多种命令，常见的有过滤请求、中断、dump、clear. 具体可以参见：http://docs.telerik.com/fiddler/knowledgebase/quickexec

但更多的时候，需要使用Filters功能， 在Filters窗口面板中，可以配置自定义的规则。比如在Request Headers中配置正则表达式匹配规则，在Breakpoints
中配置break request。

比如：`REGEX:toggle.js|xxx.js`将匹配URL中包含toggle.js或者xxx.js的请求

#### 1.2 Fiddler Inspectors

对于每一个请求的详情，都可以在Inspectors面板中查看详情。

#### 1.3 AutoResponder

该功能允许定义规则，用于匹配到的请求重新定义响应体，这对于调试UI文件十分的方便。 它可以和Filters配合使用，实现对报文体的修改。
