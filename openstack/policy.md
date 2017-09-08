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

### rule的规则

Rules can be:

+ always true. The action is always permitted. This can be written as "" (empty string), [], or "@".
+ always false. The action is never permitted. Written as "!".
+ a special check
+ a comparison of two values
+ boolean expressions based on simpler rules

### a special check

Special checks are:

+ <role>:<role name>, a test whether the API credentials contain this role.
+ <rule>:<rule name>, the definition of an alias.
+ http:<target URL>, which delegates the check to a remote server. The API is authorized when the server returns True.

### Two values are compared

```json
"value1 : value2"
```

Possible values are:

+ constants: Strings, numbers, true, false
+ API attributes 

  API attributes can be `project_id`, `user_id` or `domain_id`.
  
+ target object attributes

  Target object attributes are fields from the object description in the database. For example in the case of the "compute:start" API, the object is the instance to be started. The policy for starting instances could use the %(project_id)s attribute, that is the project that owns the instance. The trailing s indicates this is a string.
  
+ the flag is_admin

  is_admin indicates that administrative privileges are granted via the admin token mechanism (the --os-token option of the keystone command). The admin token allows initialisation of the Identity database before the admin role exists.
  

### alias

The alias construct exists for convenience. An alias is short name for a complex or hard to understand rule. It is defined in the same way as a policy:

```json
alias name : alias definition
```

Once an alias is defined, use the rule keyword to use it in a policy rule.


