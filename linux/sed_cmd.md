
## 1. What is `sed`

`sed` (Stream EDitor) processes text **line by line** and performs:

* Search & replace
* Delete
* Insert / append
* Transform text streams

It does **not modify files by default** (safe behavior).

---

## 2. Basic Syntax

```
sed 'command' file
command | sed 'command'
```

---

## 3. Most Important `sed` Commands

| Command | Purpose            |
| ------- | ------------------ |
| `s`     | Substitute         |
| `d`     | Delete             |
| `p`     | Print              |
| `i`     | Insert before line |
| `a`     | Append after line  |
| `c`     | Change entire line |
| `q`     | Quit early         |

---

## 4. Search & Replace (Most Used)

### Replace first occurrence in each line

```
sed 's/old/new/' file.txt
```

---

### Replace all occurrences (global)

```
sed 's/old/new/g' file.txt
```

---

### Case-insensitive replace

```
sed 's/error/ERROR/gi' file.txt
```

---

### Replace and save to file (in-place)

```
sed -i 's/8080/9090/g' app.conf
```

📌 Backup before change:

```
sed -i.bak 's/8080/9090/g' app.conf
```

---

## 5. Deleting Lines

### Delete lines containing a word

```
sed '/DEBUG/d' app.log
```

---

### Delete empty lines

```
sed '/^$/d' file.txt
```

---

### Delete a specific line number

```
sed '5d' file.txt
```

---

### Delete a range of lines

```
sed '10,20d' file.txt
```

---

## 6. Printing Selected Lines

### Print only matching lines

```
sed -n '/ERROR/p' app.log
```

---

### Print a line range

```
sed -n '5,10p' file.txt
```

---

## 7. Insert, Append, Change

### Insert line BEFORE match

```
sed '/ERROR/i\--- Error Found ---' app.log
```

---

### Append line AFTER match

```
sed '/ERROR/a\--- End Error ---' app.log
```

---

### Replace entire line

```
sed '/ERROR/c\This line was replaced' app.log
```

---

## 8. Using Line Numbers

### Replace text only on line 3

```
sed '3s/foo/bar/' file.txt
```

---

### Replace in range

```
sed '2,5s/foo/bar/g' file.txt
```

---

## 9. Working with Delimiters

Useful for paths and URLs.

```
sed 's|/var/www/html|/opt/app|g' config.conf
```

---

## 10. Multiple Commands

### Using semicolon

```
sed 's/foo/bar/g; s/baz/qux/g' file.txt
```

---

### Using `-e`

```
sed -e 's/foo/bar/g' -e 's/baz/qux/g' file.txt
```

---

## 11. Regex Power in `sed`

### Match beginning of line

```
sed 's/^ERROR/CRITICAL/' app.log
```

---

### Match end of line

```
sed 's/completed$/done/' file.txt
```

---

### Match digits

```
sed 's/[0-9]\+/NUM/g' file.txt
```

---

## 12. Real DevOps Use Cases

### Comment out a config line

```
sed -i 's/^Listen 80/#Listen 80/' httpd.conf
```

---

### Remove comments and blank lines

```
sed '/^#/d; /^$/d' config.conf
```

---

### Mask sensitive data

```
sed 's/password=.*/password=****/' .env
```

---

### Replace environment variable

```
sed -i 's/DB_HOST=.*/DB_HOST=prod-db/' .env
```

---

## 13. Combine with Other Commands

### With `grep`

```
grep ERROR app.log | sed 's/ERROR/CRITICAL/'
```

---

### With `awk`

```
awk '{print $1, $3}' file.txt | sed 's/,//g'
```

---

## 14. Common Mistakes

❌ Forgetting `-n` with `p`

```
sed '/ERROR/p' file
```

✅ Correct

```
sed -n '/ERROR/p' file
```

---

## 15. Interview-Ready Summary

* `sed` edits text streams
* Non-destructive by default
* Extremely fast for one-liners
* Best for automation and CI/CD

> **grep finds, awk processes, sed modifies**

---

## 16. Quick Cheat Sheet

```
sed 's/a/b/g' file
sed '/text/d' file
sed -n '1,5p' file
sed -i 's/old/new/g' file
```

<br><br>


## Use the following **`sed` command** to replace **`apple` with `burberry`** in `file.txt`.


### Replace `apple` with `burberry` (print output only)

```
sed 's/apple/burberry/g' file.txt
```

---

### Replace and **save changes to the file**

```
sed -i 's/apple/burberry/g' file.txt
```

---

### Replace whole word only (recommended)

This avoids replacing partial matches like `pineapple`.

```
sed -i 's/\bapple\b/burberry/g' file.txt
```

---

### Output after replacement

```
burberry
banana
mango
burberry
guava
mango
grapes
cherry
lichi
burberry
```

---

### Interview Tip

* `s` → substitute
* `g` → replace **all occurrences in a line**
* `-i` → edit file in place
