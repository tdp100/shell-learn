# ECMP

ECMP

---

## 1. ECMP

+ 全称： Equal Cost Multi-Path， 等价路由, 是网络链路中从source to destination 的path存在多条weight相等的路径。
+ 优势： 提高网络带宽
+ 配置：

    ```config
    set static-route <network> nexthop gateway address <gw ip address> on
    ```
https://sc1.checkpoint.com/documents/R76SP/CP_R76SP_Security_System_WebAdminGuide/105231.htm


## 2. confi

see the ima

![image](http://code.huawei.com/cloud-service-dev-team-devops/common-components/uploads/05df95b6dcf155bbc17a976eeab7496e/image.png)

### 2.1 config DNAT，SNAT and ECMP

```shell
## each vip related to a public ip
iptables -t nat -A PREROUTING -d 205.254.211.17 -j DNAT --to-destination 10.44.32.87
iptables -t nat -A POSTROUTING -s 10.44.32.87 -j SNAT --to-destination 205.254.211.17
echo 1 > /proc/sys/net/ipv4/ip_forward

## ecmp
set static-route 10.44.32.0/24 nexthop gateway address 192.168.0.11 on
set static-route 10.44.32.0/24 nexthop gateway address 192.168.0.12 on
```

## 3 config keepalived

keepalived use linkwatch to config netlink vip.

see vip:

```shell
ip addr
```
