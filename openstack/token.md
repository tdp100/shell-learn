### 1. Token类型

1. UUID
2. PKI/PKIZ token
3. Fernet token

### 2. Fernet token

采用共享密钥进行加解密， token采用对称加密算法.  token不需要持久化， 更小， 速度更快。

1. [Fernet Spec](https://github.com/fernet/spec/blob/master/Spec.md)
2. [FERNET TOKENS FOR FUN & PROFIT](https://www.mattfischer.com/blog/archives/648)

#### 2.1 密钥旋转
