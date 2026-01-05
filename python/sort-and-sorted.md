In Python, `sorted()` and `.sort()` are both used to sort elements, but they differ in how they work:

### 1. **`sorted()`**:

* **Returns**: A new sorted list.
* **Does not modify the original list**.
* **Works on any iterable** (not just lists). For example, it can be used on tuples, strings, and dictionaries.

**Example:**

```python
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
sorted_numbers = sorted(numbers)
print(sorted_numbers)  # Output: [1, 1, 2, 3, 4, 5, 6, 9]
print(numbers)  # Original list is unchanged: [3, 1, 4, 1, 5, 9, 2, 6]
```

### 2. **`.sort()`**:

* **Modifies the list in place** (does not return a new list).
* **Only works on lists** (not other iterables).

**Example:**

```python
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
numbers.sort()  # Sorts the list in place
print(numbers)  # Output: [1, 1, 2, 3, 4, 5, 6, 9]
```

### Key Differences:

* **Return Value**: `sorted()` returns a new sorted list, while `.sort()` modifies the list in place and returns `None`.
* **Type of Input**: `sorted()` can handle any iterable, while `.sort()` only works with lists.

### Which One to Use?

* If you **need to keep the original list unchanged**, use `sorted()`.
* If you **don't need the original list** and want to sort it in place, use `.sort()`.
