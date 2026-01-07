## 1. High-Level Purpose

| Tool     | Primary Role                             |
| -------- | ---------------------------------------- |
| **grep** | Search and filter lines                  |
| **awk**  | Process structured text (columns/fields) |
| **sed**  | Edit and transform text streams          |

Think of them as a pipeline trio:

> **grep → awk → sed**

---

## 2. Core Differences (At a Glance)

| Feature            | grep             | awk                    | sed                       |
| ------------------ | ---------------- | ---------------------- | ------------------------- |
| Main use           | Pattern matching | Field-based processing | Text editing              |
| Line-based         | Yes              | Yes                    | Yes                       |
| Column-based       | No               | Yes                    | Limited                   |
| Supports variables | No               | Yes                    | Limited                   |
| Arithmetic         | No               | Yes                    | No                        |
| Conditional logic  | No               | Yes                    | Limited                   |
| Modify text        | No               | Yes                    | Yes                       |
| Best for           | Filtering        | Reporting & logic      | Substitution & formatting |

---

## 3. `grep` – Pattern Finder

### What it does best

* Searches for **matching lines**
* Fast, simple, and ideal for filtering logs

### Example

```
grep "ERROR" app.log
```

### Use cases

* Log filtering
* Process lookup
* Quick text search

### When NOT to use `grep`

* When you need to modify text
* When you need column-level processing

---

## 4. `awk` – Text Processor (Most Powerful)

### What it does best

* Works with **fields/columns**
* Supports variables, conditions, loops, math

### Example (print 1st and 3rd column)

```
awk '{print $1, $3}' file.txt
```

### Example (sum a column)

```
awk '{sum += $5} END {print sum}' data.txt
```

### Real DevOps example

```
df -h | awk '$5 > 80 {print $1, $5}'
```

### Use cases

* CSV/log analysis
* Reports
* Data transformation
* Conditional logic

---

## 5. `sed` – Stream Editor

### What it does best

* **Modify text** line-by-line
* Replace, delete, insert text

### Example (replace text)

```
sed 's/http/https/g' file.txt
```

### Delete lines

```
sed '/DEBUG/d' app.log
```

### Edit file in place

```
sed -i 's/old/new/g' config.conf
```

### Use cases

* Config updates
* Log cleanup
* Text rewriting

---

## 6. Side-by-Side Example (Same Problem)

### Problem: Extract ERROR lines and print timestamp + message

**grep**

```
grep "ERROR" app.log
```

**awk**

```
awk '/ERROR/ {print $1, $2, $NF}' app.log
```

**sed**

```
sed -n '/ERROR/p' app.log
```

---

## 7. When to Use Which (Decision Guide)

### Use `grep` if:

* You only need to **find/filter**
* Speed and simplicity matter

### Use `awk` if:

* You need **columns**
* You need calculations or conditions
* You are generating reports

### Use `sed` if:

* You need to **modify text**
* You need find/replace or deletion
* You are editing configs or logs

---

## 8. Combined Power (Very Common in DevOps)

```
ps aux | grep nginx | awk '{print $2}' | sed 's/^/PID: /'
```

What happens:

1. `grep` → filter
2. `awk` → extract column
3. `sed` → format output

---

## 9. Interview-Ready Summary

> **grep finds, awk processes, sed modifies**

* `grep` → search
* `awk` → logic + data
* `sed` → transformation

---

## 10. Quick Cheat Sheet

```
grep "text" file
awk '{print $1}' file
sed 's/a/b/g' file
```

