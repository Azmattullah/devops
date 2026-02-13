# MySQL & MariaDB database dump

### **1. Prerequisites**

Make sure:

* MySQL client (`mysql` and `mysqldump`) is installed on your local machine.
* You have database credentials:

  * **Hostname** (e.g., `localhost` or `example.com`)
  * **Username** (e.g., `root`)
  * **Password**
  * **Database name**

You can check if `mysqldump` is available:

```bash
mysqldump --version
```

---

## **(DANGER please read once)
### **2. Dump a Local MySQL Database**

If the database is on your **local system**:

```bash
mysqldump -u root -p database_name > database_name.sql
```

* `-u root` → username
* `-p` → prompts for password
* `database_name.sql` → output file (dump file)

You’ll be prompted for the MySQL password.

---

### **3. Dump a Remote Database to Your Local Machine**

If the database is **on a remote server**, run this **from your local terminal**:

```bash
mysqldump -h remote_host -u username -p database_name > database_name.sql
```

Example:

```bash
mysqldump -h 192.168.1.100 -u admin -p mydb > mydb_backup.sql
```

---

### **4. Compress the Dump (Optional)**

To save space:

```bash
mysqldump -u root -p database_name | gzip > database_name.sql.gz
```

---

### **5. Dump Only Specific Tables**

```bash
mysqldump -u root -p database_name table1 table2 > partial_dump.sql
```

---

### **6. Dump All Databases**

To back up everything on the server:

```bash
mysqldump -u root -p --all-databases > all_databases.sql
```

---

### **7. Restore the Dump to MySQL**

To import the dump back:

```bash
mysql -u root -p database_name < database_name.sql
```

