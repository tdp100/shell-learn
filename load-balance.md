###  1. [王璞：基于容器的服务发现与负载均衡](http://gitbook.cn/books/59a901828116b10782dca13e/index.html)
常见的服务发现方式有三种，分别适用于同的TCP协议或HTTP协议。第一种是用IP地址+端口或者域名+端口的方式做服务发现，比如，“website.com:8080”代表一个应用，“website.com:8081”代表另一个应用，虽然这两个应用的域名相同。这种方式适用于四层和七层协议，即TCP及HTTP协议都可以用。

第二种是子域名的方式，仅适用于七层协议。子域名的方式是指不同的应用可能有共同的根源，但是有不同的子域名，比如，http://service1.zone1.website.com和http://service2.zone1.website.com，这两个不同的域名（访问端口都是80）），有共同的根域名website.com，但是子域名不同，因此七层协议，比如HTTP协议，会通过不同的子域名解析到不同的应用。

>>> 注：由于各子域名对应的公网IP可能是相同的，所以在做子域名的负载时，4层并不能实现，需要7层协议按不同的子域名解析到不同的应用。在nginx location>server中可以配置域名

第三种是子路径的方式，也仅适用于七层协议。比如，http://zone1.website.com/service1和http://zone1.website.com/service2，这两个路径的域名完全一样，但是子路径不一样，可以用于区分不同的应用服务。

这三种服务发现方式其实总结下来只有IP地址或者域名+端口是同时适用于四层、七层，其他如子域名、子路径的方式只适用于七层服务发现。


###  2. [从Google Maglev说起，如何造一个牛逼的负载均衡？](https://zhuanlan.zhihu.com/p/22360384)

###  3. [Maglev A Fast and Reliable Software Network Load Balancer]()

###  4. [alibaba LVS](https://github.com/alibaba/LVS)
