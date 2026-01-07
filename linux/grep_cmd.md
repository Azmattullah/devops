## 1. What `grep` Does

`grep` searches for **text patterns** inside files or command output and prints the matching lines.

Basic syntax:

```
grep [OPTIONS] "PATTERN" FILE
```

---

## 2. Basic Usage

### Search for a word in a file

```
grep "error" app.log
```

Displays all lines in `app.log` containing `error`.

---

### Case-insensitive search

```
grep -i "error" app.log
```

---

### Search multiple files

```
grep "failed" *.log
```

---

## 3. Commonly Used Options (Very Important)

| Option         | Meaning                        |
| -------------- | ------------------------------ |
| `-i`           | Ignore case                    |
| `-n`           | Show line numbers              |
| `-v`           | Invert match (exclude pattern) |
| `-r` / `-R`    | Recursive search               |
| `-l`           | Show file names only           |
| `-c`           | Count matching lines           |
| `-w`           | Match whole word               |
| `-E`           | Extended regex                 |
| `-o`           | Print only matched text        |
| `--color=auto` | Highlight matches              |

---

## 4. Practical Examples (Real-World)

### Show line numbers

```
grep -n "Exception" server.log
```

---

### Exclude lines containing a word

```
grep -v "DEBUG" app.log
```

---

### Count matches

```
grep -c "ERROR" app.log
```

---

### Search recursively in a directory

```
grep -r "password" /etc/
```

---

### Show only file names with matches

```
grep -l "DB_HOST" *.env
```

---

### Whole-word match

```
grep -w "root" /etc/passwd
```

---

## 5. Using `grep` with Pipes (Very Important)

`grep` is most powerful when combined with other commands.

### Check running process

```
ps aux | grep nginx
```

---

### Find listening port

```
netstat -tulnp | grep 8080
```

---

### Filter Docker containers

```
docker ps | grep api
```

---

## 6. Regular Expressions with `grep`

### Match multiple words

```
grep -E "error|failed|denied" app.log
```

---

### Lines starting with a word

```
grep "^ERROR" app.log
```

---

### Lines ending with a word

```
grep "completed$" app.log
```

---

### Match digits

```
grep "[0-9]\{3\}" file.txt
```

---

## 7. Advanced & DevOps Use Cases

### Find failed SSH login attempts

```
grep "Failed password" /var/log/auth.log
```

---

### Find TODO comments in code

```
grep -R "TODO" .
```

---

### Search environment variables

```
env | grep JAVA
```

---

### Monitor logs in real time

```
tail -f app.log | grep ERROR
```

---

## 8. Silent Mode (Exit Code Check)

Useful in scripts and CI/CD pipelines.

```
grep -q "SUCCESS" output.log
echo $?
```

* `0` → Found
* `1` → Not found

---

## 9. Best Practices

* Use `-r` carefully on large directories
* Combine with `less` for readability:

  ```
  grep "error" app.log | less
  ```
* Always quote patterns
* Prefer `grep -E` for complex expressions

---

## 10. Quick Reference Cheat Sheet

```
grep "text" file
grep -i "text" file
grep -n "text" file
grep -r "text" dir/
grep -v "text" file
command | grep "text"
```


<br><br><br>

---

## 1. Why Combine `grep` and `awk`

* **`grep`** → filters *which lines* you want
* **`awk`** → processes *what parts* of those lines you want

> In practice: **filter first, then extract or calculate**

---

## 2. Basic Syntax

```
grep "PATTERN" file | awk 'AWK_LOGIC'
```

---

## 3. Simple Examples

### Filter lines, print specific columns

```
grep "ERROR" app.log | awk '{print $1, $2, $NF}'
```

* `$1` → first column
* `$2` → second column
* `$NF` → last column

---

### Case-insensitive filtering + column extraction

```
grep -i "failed" auth.log | awk '{print $1, $9}'
```

---

## 4. Real-World DevOps Examples

### 1️⃣ Get PIDs of a running process

```
ps aux | grep nginx | awk '{print $2}'
```

---

### 2️⃣ Show disk partitions above 80% usage

```
df -h | grep -v Filesystem | awk '$5+0 > 80 {print $1, $5}'
```

---

### 3️⃣ Extract IP addresses from access logs

```
grep "200" access.log | awk '{print $1}'
```

---

### 4️⃣ Failed SSH login attempts with username

```
grep "Failed password" /var/log/auth.log | awk '{print $(NF-5), $(NF-3)}'
```

---

## 5. Using Regex with `grep` + `awk`

### Multiple keywords

```
grep -E "ERROR|WARN" app.log | awk '{print $1, $NF}'
```

---

### Lines starting with a date

```
grep "^2026-" app.log | awk '{print $1, $3}'
```

---

## 6. Using Conditions in `awk` After `grep`

### Count matching lines

```
grep "ERROR" app.log | awk 'END {print NR}'
```

---

### Sum values from filtered lines

```
grep "PRICE" data.log | awk '{sum += $3} END {print sum}'
```

---

## 7. Best Practice: Let `awk` Do Both When Possible

This:

```
grep "ERROR" app.log | awk '{print $1, $NF}'
```

Can be optimized to:

```
awk '/ERROR/ {print $1, $NF}' app.log
```

✅ Faster
✅ Cleaner
✅ Preferred in scripts

---

## 8. Avoid Common Mistakes

❌ Useless use of `grep`

```
grep "ERROR" file | awk '/ERROR/ {print}'
```

✅ Correct

```
awk '/ERROR/ {print}' file
```

---

## 9. One-Line Production Examples

### Kill all nginx processes

```
ps aux | grep nginx | awk '{print $2}' | xargs kill -9
```

---

### Count HTTP 500 errors

```
grep " 500 " access.log | awk 'END {print NR}'
```

---

### Extract environment variables

```
env | grep JAVA | awk -F= '{print $1, $2}'
```

---

## 10. Interview-Ready Summary

* Use **`grep`** to filter lines
* Use **`awk`** to process fields
* Prefer **`awk` alone** when possible
* Combine both for clarity in pipelines

> **grep selects, awk extracts**

---