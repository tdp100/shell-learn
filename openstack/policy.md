openstack 每一个服务都有role-based access policies， 这些policies定义在policy.json文件中

### [policy.json](https://docs.openstack.org/ocata/config-reference/policy-json-file.html)

每一个policy由一行语句：`"<target>":"<rule>"`构成， policy的target 也称为action, 表示一个API调用。

+ 空 规则

```json
"compute:get_all" : ""
```
当rule为空，表示"always"，这条policy表示任何人都可以列举instance

+ 禁止 规则

```json
"compute:shelve" : "!"
```

当rule为!，表示“never” or “nobody”，这条policy表示不允许任何人shelve an instance

+ 指定role

```json
"identity:create_user" : "role:admin"
```

表示只有administrator才允许创建用户

+ 在rule中可以使用`not`,`and`,`or`操作符

```json
"deny_stack_user": "not role:heat_stack_user"
```

+ 定义rules别名

```json
"stacks:create": "rule:deny_stack_user"
"deny_stack_user": "not role:heat_stack_user"
```
这里先定义了一个`rule:deny_stack_user`别名，然后给这个action增加了rule规则`"not role:heat_stack_user"`
