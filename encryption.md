## Encryption and Decryption

1. [Encryption and Decryption](http://encryptionanddecryption.com/)
2. [Cryptography and Network Security Principles and Practice 7th Edition.pdf](https://cse.sc.edu/~lluo/csce813/reading-papers/textbook-1.pdf)

## Hash Function

1. [HASH FUNCTIONS IN CRYPTOGRAPHY](http://bora.uib.no/bitstream/handle/1956/3206/47401627.pdf)
2. [NIST.FIPS.180-4](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf)

### MD5填充原理

MD5以512位分组来处理输入的信息， 且每一分组又被划分为16个32位子分组， 经过了一系列的处理后， 算法的输出由四个32位分组组成， 将这四个32位分组级联后将生成一个128位散列值。

在MD5算法中， 首先需要对信息进行填充， 使其字节长度对512求余数的结果等于448。 因此， 信息的字节长度（ Bits Length） 将被扩展至N * 512 + 448， 即N * 64 + 56 个字节（ Bytes）， N为一个正整数。 填充的方法如下， 在信息的后面填充一个1和无数个0， 直到满足上面的条件时才停止用0对信息的填充。 然后再在这个结果后面附加一个以64位二进制表示的填充前的信息长度。 经过这两步的处理， 现在的信息字节长度 = N * 512 + 448 + 64 = (N + 1) * 512， 即长度恰好是512的整数倍数。

### MD5碰撞的演化之路

原文地址:http://drops.wooyun.org/papers/12396
[MD5碰撞的演化之路](https://wooyun.js.org/drops/MD5%E7%A2%B0%E6%92%9E%E7%9A%84%E6%BC%94%E5%8C%96%E4%B9%8B%E8%B7%AF.html)
