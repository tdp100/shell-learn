install kernel on ubuntu

## download kernel

wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.2.tar.xz

## extract tar(.tar.xz) file

```shell
tar xjvf linux-4.2.tar.xz
```

## config

1. set config from old kernel

```shell
cp /boot/config-`uname -r` .config
```

2. make menuconfig

```shell
make menuconfig

#then load from .config
```

## compile

```shell
$ sudo -s

$ make

$ make modules_install

$ make install
```

## update grub

```shell
$ cd /boot
$ sudo update-grub
```

## remove old image

```shell
sudo apt-get autoremove linux-image-2.6.32-22-generic linux-image-2.6.32-21-generic
# clear all unused kernel
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
```
