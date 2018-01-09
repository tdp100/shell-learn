### 1. Token类型

1. UUID
2. PKI/PKIZ token
3. Fernet token

### 2. Fernet token

采用共享密钥进行加解密， token采用对称加密算法.  token不需要持久化， 更小， 速度更快。 另外还支持fernet key旋转。

1. [Fernet Spec](https://github.com/fernet/spec/blob/master/Spec.md)
2. [FERNET TOKENS FOR FUN & PROFIT](https://www.mattfischer.com/blog/archives/648)
3. [Deep Dive into Keystone Fernet Tokens](https://developer.ibm.com/opentech/2015/11/11/deep-dive-keystone-fernet-tokens/)

#### 2.1 IAM

目前IAM的PKI token与STS token不一致， STS token为Fernet token， 一般前缀为`gAAAAA`. base64 decode后第一个byte为\x80.
