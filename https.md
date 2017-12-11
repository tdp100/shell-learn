
## 1. HTTPS 的原理

参考： https://security.stackexchange.com/questions/56389/ssl-certificate-framework-101-how-does-the-browser-actually-verify-the-validity

## 2. Client如何验证服务端证书

## 3. 服务端证书的种类？

## 4. Root Cert, Intermediate Cert and SSL Cert的区别

参考：https://devcentral.f5.com/questions/difference-between-root-cert-intermediate-cert-and-ssl-cert

## 5. 什么是信任链

参考： https://www.fir3net.com/Security/Concepts-and-Terminology/pki-chain-of-trust.html

#### SIGNING

***During the signing process the Root CA digitally signs the intermediate certificate using its private key***. This provides authenticity that the intermediate certificate is trusted by the Root CA.
Next the Sub CA (intermediate CA) signs the identity Certificate using its private key. This provides authenticity that the identity certificate is trusted by the Intermediate CA.

#### EXAMPLE

Using a typical scenario of a user connecting to an SSL web-page, we will walk through the steps required to provide a ‘Chain of Trust’.

[!image](https://www.fir3net.com/images/legacy/PKI_ChainofTrust-Chain.png)
 
The client wants to view an SSL website. For this he will use a web browser. By default each browser is preloaded with a number Root CA (public) certificates.
+ The client connects to the SSL website.
+ The website responds with the Identity and Intermediate certificates.
+ The client confirms authenticity of the Intermediate certificate by decrypting the digital signature using the Root CA`s public key.
+ Next the client confirms the authenticity of the identity certificate by decrypting the digital signature using the intermediates public key.
+ The client then clarifies that the URL that is being requested by matching the DN (Distinguished Name) within the Identity Certificate. If this does not match the browser displays a warning.
+ Traffic is then encrypted/decrypted by a) the 'client' using the public key b) the 'server' using the private key.

#### 如何生成证书链

http://ldapwiki.com/wiki/Certificate%20Chain

```sh
$ cat www.example.com.crt intermediate.crt > www.example.com.chained.crt
```

## 6. openssl工具

SSL证书格式转换工具：https://csr.chinassl.net/convert-ssl.html
SSL证书格式转换工具 https://csr.chinassl.net/convert-ssl-commands.html
