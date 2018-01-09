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

查看分区
```sh
[root@localhost ~]# lsblk --output NAME,FSTYPE,TYPE,LOG-SEC,PHY-SEC,SIZE,MOUNTPOINT
NAME             FSTYPE      TYPE LOG-SEC PHY-SEC  SIZE MOUNTPOINT
sr0                          rom      512     512 1024M 
xvda                         disk     512     512   40G 
├─xvda1          ext3        part     512     512  512M /boot
└─xvda2          LVM2_member part     512     512 39.5G 
  └─euleros-root ext3        lvm      512     512 39.5G /
```


### NTFS挂载遇到的问题

1. GDB分区，可以采用lsblk查看磁盘分区，可以使用`parted -l`查看设备的分区表和文件系统类型
2. 对于一个磁盘没有任何分区时，直接使用`mount.ntfs-3g /dev/sda /mnt`会出错(如：The device '/dev/sda' doesn't seem to have a valid NTFS.)， 解决的办法：

+ 挂载到本地: `mount /dev/sda /mnt`
+ 修改ntfs配置文件： `vim /etc/exports` 输入共享挂载点`/mnt 10.44.xx.xx(rw,anonuid=0,anongid=0)`
+ 执行生效命令: `exportfs -r`
+ 在客户机上使用ntfs进行挂载:`mount.nfs4 10.44.xx.xx:/mnt /local-mnt`

3. 启动RPC进程

```sh
service rpcbind restart 
service nfs restart
```
