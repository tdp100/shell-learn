## config dns

```shell
sudo vim /etc/resolv.conf

nameserver 10.72.55.81
nameserver 10.72.255.100
nameserver 10.98.48.39

 /etc/init.d/networking restart
```

## nslookup commmand

1. query A record
nslookup domain-name

2. query mx
nslookup -query=MX mail-server

for example:
¡°@redhat.com¡°
nslookup -query=mx redhat.com

3. Query the NS Record using -query=ns
nslookup -type=ns redhat.com

4. Query the SOA Record using -query=soa
nslookup -type=soa redhat.com

5. View available DNS records using -query=any
nslookup -type=any google.com

6. Reverse DNS lookup
nslookup 209.132.183.181

7. Using Specific DNS server
nslookup redhat.com ns1.redhat.com

8. Change the port number to connect with
 nslookup -port 56 redhat.com


## dig command

1. displays the A record of redhat.com
 dig redhat.com

2. Query MX Records Using dig -t MX
dig redhat.com  MX +noall +answer

3. Query NS Records Using dig -t NS
 dig redhat.com NS +noall +answer
 dig -t NS redhat.com +noall +answer

4. View ALL DNS Records Types Using dig -t ANY
dig redhat.com ANY +noall +answer
dig -t ANY redhat.com  +noall +answer

5. QUERY any 
dig any linux.bogus

6. dig linux.bogus axfr

7. Query DNS Records using Specific dns server
dig redhat.com @8.8.8.8



## 参考资料

1. [DNS 理论篇](http://www.pandan.xyz/2017/02/02/dns%20%E7%90%86%E8%AE%BA%E7%AF%87/)
2. [CDN的基本工作过程](http://book.51cto.com/art/201205/338756.htm)
