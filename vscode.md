## 1. 安装cntlm

1. 安装HACC V1.8.12_setup.exe
2. 安装[cntlm.exe](http://cntlm.sourceforge.net/)到C盘
3. 修改配置文件cntlm.ini

```
Username	xxx
Domain		xxx
Auth        NTLM
PassNT      2311CCF6F55211E3CACDA610293ABAEF
PassLM      382D6D3999273D7876CFFCCD4124DA61

Proxy		proxy.host.com:port
NoProxy		127.0.0.1,*.noporxy.host.com
Listen		3133
Gateway	yes
```

4.  生成NTLM

```
cntlm.exe -c cntlm.ini -v -I -f -M http://www.google.com
```

将生成的Auth, PassNT,  PassLM替换到cntlm.ini文件中

5. 设置windows中的代理为127.0.0.1:3133

6. 设置vscode settings中的代理：

```
{
    "http.proxy": "http://127.0.0.1:3133",
    "http.proxyStrictSSL": false
}
```
