### 使用golang 访问数据库的实践建议

1. struct中的字段类型最好是sql中的Null类型，比如：sql.NullString， 避免DB中的已有数据是null，在进行转化时出现错误。
2. 如果是自定义的类型，需要实现Scaner接口。 如果执行Exec，自定义类型必须实现Value接口类型。
3. 自定义类型，如果在生成JSON上有特殊要求，建议实现MarshalJSON和UnmarshalJSON接口
4. 如果是rows或者row，应该defer rows.Close()
5. 如果是事务,比如：`transaction, err := manager.db.Begin()`, 一定要在错误的地方调用Rollback(), 在正常情况下提交事务Commit()，只有这两个方法中才会去close掉资源。
6. Exec返回的`sql.Result()` Interface提供了两个函数`LastInsertId()`和`RowsAffected()`，注意，PG Driver不支持LastInsertId()。 通常会使用`RowsAffected()`来判断语句是否生效。

### 参考：

1. https://golang.org/pkg/database/sql/#Rows.Scan
2. https://www.alexedwards.net/blog/practical-persistence-sql
