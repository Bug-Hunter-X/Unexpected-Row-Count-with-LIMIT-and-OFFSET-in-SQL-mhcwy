In SQL, a common but subtle error arises when using `LIMIT` clauses with `OFFSET`.  Consider this scenario: you have a large table and want to retrieve pages of 100 rows each, starting from a particular offset.

```sql
SELECT * FROM large_table LIMIT 100 OFFSET 1000;
```

This seems straightforward, but if `large_table` doesn't have enough rows beyond the offset (e.g., fewer than 100 rows after row 1000), the query might not return an error but will simply return fewer than 100 rows. This can be problematic if your application assumes a constant number of rows per page, leading to unexpected behavior or incomplete data retrieval.  The problem is exacerbated if you don't have a way to detect whether you received a full page of data.

Another issue related to `LIMIT` and `OFFSET` is performance.  For large tables, using `OFFSET` can be extremely inefficient as the database must skip over the offset rows before retrieving the desired data. This can lead to significant query performance degradation.