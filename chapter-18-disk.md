1. [linux上使用mdadm工具制作并挂载RAID磁盘阵列](http://www.linuxidc.com/Linux/2015-10/124391.htm)
   
2. 查看被检测到的硬盘

`# fdisk -l | grep '^Disk'`
Disk /dev/sda: 251.0 GB, 251000193024 bytes
Disk /dev/sdb: 251.0 GB, 251000193024 bytes

3. [对要挂载的硬盘创建磁盘分区](http://www.cyberciti.biz/faq/linux-disk-format/)

`# fdisk /dev/xvde n p p w`

4. 格式化磁盘

```shell
mkfs -t ext3 /dev/xvde1
mkfs -t ext3 /dev/xvde2
mkfs -t ext3 /dev/xvde3
```

5. 挂载磁盘

```shell
# mkdir /disk1
# mount /dev/sdb1 /disk1

mount /dev/xvde1/ /home
mount /dev/xvde2 /opt
mount /dev/xvde3 /var/log
```

6. 更新/etc/fstab文件

```sh
echo "/dev/xvde1 /home ext3 defaults 1 2" >> /etc/fstab
echo "/dev/xvde2 /opt ext3 defaults 1 2" >> /etc/fstab
echo "/dev/xvde3 /var/log ext3 defaults 1 2" >> /etc/fstab
```

7. 取消挂载

```sh
umount /dev/xvde1
```

8. 强制取消挂载

```sh
umount -l /dev/xvde1
```

9. 查看磁盘信息
`# df -H`

查看分区
`vim /etc/fstab`
