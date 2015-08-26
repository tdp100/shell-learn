config dns

```shell
sudo vim /etc/resolv.conf

nameserver 10.72.55.81
nameserver 10.72.255.100
nameserver 10.98.48.39

 /etc/init.d/networking restart
```