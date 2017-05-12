### Linux 用户密码

1. `cat /etc/passwd`   看所有系统用户信息

2. `cat /etc/shadow`   查看用户的密码


`/etc/shadow`中的密码可以进行加密散列保存，比如：
`aychedee:$6$vb1tLY1qiY$M.1ZCqKtJBxBtZm1gRi8Bbkn39KU0YJW1cuMFzTRANcNKFKR4RmAQVk4rqQQCkaJT6wXqjUkFcA/qNxLyqW.U/:15405:0:99999:7:::`

其中`$6$vb1tLY1qiY$`就表示加密的算法(`$6$`)和盐值(`vb1tLY1qiY`). 

Available algorithms:


|Number |  algorithms|
|------|--------------|
|$1$ | md5 |
|$2a$ | Blowfish |
| $2y$ | Blowfish, with correct handling of 8 bit characters|
| $5$  | sha256 |
| $6$  | sha512 |

### 密码加密的工具

+ python

```python
python -c 'import crypt; print crypt.crypt("PASSWORD", "$6$vb1tLY1qiY$")'
```
+ mkpasswd

```sh
mkpasswd --method=sha512 --salt=vb1tLY1qiY PASSWORD
```


https://www.aychedee.com/2012/03/14/etc_shadow-password-hash-formats/
