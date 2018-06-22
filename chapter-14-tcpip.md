## VLAN

IEEE 802.1Q中定义的VLAN Tag域只有12比特，仅能表示4096个VLAN。 每个租户都需要独立的隔离广播域，只能支持4K个租户。

## VXLAN

>>>一切万法，都由封包拆包始，名之为隧道。
>>>包大就切片，切片顺序有SeqID, 切片大小有MTU。

RFC7348定义了VXLAN扩展方案（Virtual eXtensible Local Area Network），采用MAC in UDP（User Datagram Protocol）封装方式，是NVO3（Network Virtualization over Layer 3）中的一种网络虚拟化技术。

- VTEP(VXLAN Tunnel End Point)，完成VXLAN报文的封装和解封装。VTEP与物理网络相连，分配有物理网络的IP地址，该地址与虚拟网络无关。
- VNI - VXLAN Network Identifier (or VXLAN Segment ID)

1. [overlay网络技术之VXLAN详解](http://network.51cto.com/art/201312/425388.htm)

## VRF

Virtual Routing forwarding(虚拟路由转发表),也是VPN-instance。

## NAT


## 学习资料

+ [理解 TCP 和 UDP](https://legacy.gitbook.com/book/jerryc8080/understand-tcp-and-udp/details)
+ [TCP/IP协议族]()
