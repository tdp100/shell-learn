sed

find by regex

```shell
CONSOLE1:~ # sed -rn '/^\#\*(.+)soft(.+)core/p' /etc/security/limits.conf 
#*               soft    core            0
#*               soft    core            0
```
