## 如何将nginx当做静态服务器

希望将/static 重定向到 /local/static/theme目录下

```config
server {
    listen ip:port;
    server_name: domain_name;
    
    location /static {
        root /local;
        rewrite ^/static/(.*)$ /static/theme/$1;
        rewrite_log on;
    }
}
```

借助rewrite实现路径的修改， 再定义root，实现路径的拼接
