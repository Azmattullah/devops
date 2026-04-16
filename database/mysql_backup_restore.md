# MySQL Database Backup & Restore

You can check if `mysqldump` is available:
```
mysqldump --version
```

<br><br>
## Export (Backup) Database

Create a dump of a database into a `.sql` file:

```bash
mysqldump -u <username> -p -h <host> <database_name> > <backup_file>.sql
```

### Example

```bash
# For Localhost
mysqldump -u username -p -h localhost news_db > database_dump.sql
```

---
<br><br>


## Import (Restore) Database

Restore a database from a `.sql` dump file:

```bash
mysql -u <username> -p <database_name> < <backup_file>.sql
```

### Example

```bash
mysql -u username -p news_db < database_dump.sql
```

---
