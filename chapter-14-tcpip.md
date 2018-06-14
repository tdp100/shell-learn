## VLAN

IEEE 802.1Q中定义的VLAN Tag域只有12比特，仅能表示4096个VLAN

## VXLAN

>>>一切万法，都由封包拆包始，名之为隧道。
>>>包大就切片，切片顺序有SeqID, 切片大小有MTU。

RFC7348定义了VXLAN扩展方案（Virtual eXtensible Local Area Network），采用MAC in UDP（User Datagram Protocol）封装方式，是NVO3（Network Virtualization over Layer 3）中的一种网络虚拟化技术。

1. [overlay网络技术之VXLAN详解](http://network.51cto.com/art/201312/425388.htm)
