## 图形图像中的经典书籍

+ [Digital Image Processing Third Edition](http://web.ipac.caltech.edu/staff/fmasci/home/astro_refs/Digital_Image_Processing_3rdEd_truncated.pdf)
+ [COLOR DESIGN BOOK——色彩设计手册](http://product.dangdang.com/product.aspx?product_id=20449006)

## 视频转码软件

+ [FFmpeg](https://ffmpeg.org/legal.html)
+ [FFMPEG实现将视频自动转码成H264标准Mp4文件](https://yq.aliyun.com/ziliao/149794)
+ [linux ffmpeg编译配置安装详解](https://yq.aliyun.com/ziliao/80761?spm=5176.8246799.blogcont.25.dVDSi2)

## 图片占多少内存

http://www.jianshu.com/p/1af904e9a6e4

注意：

*    图片编辑器一般用MB衡量尺寸大小。(没压缩之前的原始尺寸除以1024x1024)
*    操作系统里显示的尺寸一般是压缩后的大小，会小于原始尺寸。
总体来说一张图片占多少内存，在于图片的尺寸大小和色彩模式。 (像素*色彩模式所占bit数)

## 阿里图片转码

阿里OSS中的图片转码采用的是GraphicsMagick,详见：[阿里云团队畅谈图片服务架构演进](http://blog.csdn.net/yechaodechuntian/article/details/38041901)

>>>图片编辑处理API
对于在线图片的编辑处理，GraphicsMagick（GraphicsMagick(http://www.graphicsmagick.org/)）对于从事互联网的技术人员应该不会陌生。GraphicsMagick是从 ImageMagick 5.5.2 分支出来的，但是现在他变得更稳定和优秀，GM更小更容易安装、GM更有效率、GM的手册非常丰富GraphicsMagick的命令与ImageMagick基本是一样的。
GraphicsMagick 提供了包括裁、缩放、合成、打水印、图像转换、填充等非常丰富的接口API,其中的开发包SDK也非常丰富，包括了JAVA(im4java)、C、C++、Perl、PHP、Tcl、Ruby等的调用，支持超过88中图像格式，包括重要的DPX、GIF、JPEG、JPEG-2000、PNG、PDF、PNM和TIFF，GraphicsMagick可以再绝大多数的平台上使用，Linux、Mac、Windows都没有问题。但是独立开发这些图片处理服务，对服务器的IO要求相对要高一些，而且目前这些开源的图片处理编辑库，相对来说还不是很稳定，笔者在使用GraphicsMagick 的时候就遇到了tomcat 进程crash情况，需要手动重启tomcat服务。
阿里云目前已经对外开放图片处理API,包括了大多数常用处理解决方案：缩略图、打水印、文字水印、样式、管道等。开发者可以非常方便的使用如上图片处理方案，希望越来越多的开发者能够基于OSS开放出更多优秀的产品。

## 又拍云的图片处理

增加缓存

>>>群友：处理过的图片会存储磁盘吗？
黄慧攀：处理过的图片，不存磁盘。 但上面有 2 层缓存。

参考：http://www.10tiao.com/html/175/201603/404669856/1.html
