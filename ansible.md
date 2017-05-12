#### ansible 最佳实践

1. 使用vault-file来保存密码

定义vault_file，里面放置敏感变量，然后使用`ansible-vault encrypt vault_file`，将key保存到./key.txt文件中

在playbook中引入vault_file中的变量，执行playbook时，使用`ansible-playbook xxx --vault-password-file ./key.txt`

#### 参考

1. [Ansible (Real Life) Good Practices](https://reinteractive.com/posts/167-ansible-real-life-good-practices)
