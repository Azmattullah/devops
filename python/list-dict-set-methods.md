# Top list/dict/set methods
 
<br>
 
## ✅ Top **List** Methods (Most Used)

| Method      | Purpose              | Example              |
| ----------- | -------------------- | -------------------- |
| `append()`  | Add item at end      | `lst.append(10)`     |
| `extend()`  | Add multiple items   | `lst.extend([4, 5])` |
| `insert()`  | Insert at index      | `lst.insert(1, "a")` |
| `remove()`  | Remove first match   | `lst.remove(3)`      |
| `pop()`     | Remove & return item | `lst.pop()`          |
| `clear()`   | Remove all items     | `lst.clear()`        |
| `index()`   | Get index of value   | `lst.index(5)`       |
| `count()`   | Count occurrences    | `lst.count(2)`       |
| `sort()`    | Sort in place        | `lst.sort()`         |
| `reverse()` | Reverse list         | `lst.reverse()`      |
| `copy()`    | Shallow copy         | `lst.copy()`         |

### Example

```python
lst = [3, 1, 2]
lst.append(4)
lst.sort()
print(lst)  # [1, 2, 3, 4]
```

---

## ✅ Top **Dictionary** Methods (Critical)

| Method         | Purpose            | Example                |
| -------------- | ------------------ | ---------------------- |
| `get()`        | Safe value access  | `d.get("a", 0)`        |
| `keys()`       | All keys           | `d.keys()`             |
| `values()`     | All values         | `d.values()`           |
| `items()`      | Key-value pairs    | `d.items()`            |
| `update()`     | Merge dictionaries | `d.update({"c":3})`    |
| `pop()`        | Remove key         | `d.pop("a")`           |
| `popitem()`    | Remove last item   | `d.popitem()`          |
| `setdefault()` | Get or set default | `d.setdefault("x", 0)` |
| `clear()`      | Remove all items   | `d.clear()`            |
| `copy()`       | Shallow copy       | `d.copy()`             |

### Example

```python
d = {"a": 1, "b": 2}
d.update({"c": 3})
print(d.get("d", 0))  # 0
```

---

## ✅ Top **Set** Methods (Unique Data Handling)

| Method           | Purpose                        | Example             |
| ---------------- | ------------------------------ | ------------------- |
| `add()`          | Add item                       | `s.add(5)`          |
| `update()`       | Add multiple items             | `s.update([6,7])`   |
| `remove()`       | Remove item (error if missing) | `s.remove(3)`       |
| `discard()`      | Remove item safely             | `s.discard(3)`      |
| `pop()`          | Remove random item             | `s.pop()`           |
| `clear()`        | Remove all                     | `s.clear()`         |
| `union()`        | Combine sets                   | `a.union(b)`        |
| `intersection()` | Common elements                | `a.intersection(b)` |
| `difference()`   | Elements in A not B            | `a.difference(b)`   |
| `issubset()`     | Subset check                   | `a.issubset(b)`     |
| `issuperset()`   | Superset check                 | `a.issuperset(b)`   |

### Example

```python
a = {1, 2, 3}
b = {3, 4}
print(a.intersection(b))  # {3}
```

---

# 🔍 Quick Interview Notes

### List

* Ordered
* Allows duplicates
* Mutable

### Dictionary

* Key-value pairs
* Keys must be immutable
* Fast lookups (hash-based)

### Set

* Unordered
* Unique values only
* Very fast membership checks

