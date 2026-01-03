# Python Methods

## 1. `print()`

Outputs data to the console.

```python
print("Hello, World")
```

---

## 2. `len()`

Returns the number of items in an object.

```python
len("Python")        # 6
len([1, 2, 3])       # 3
```

---

## 3. `type()`

Returns the data type of an object.

```python
type(10)             # <class 'int'>
```

---

## 4. `input()`

Takes user input (always returns a string).

```python
name = input("Enter name: ")
```

---

## 5. `int()`

Converts a value to an integer.

```python
int("10")            # 10
```

---

## 6. `float()`

Converts a value to a floating-point number.

```python
float("3.14")        # 3.14
```

---

## 7. `str()`

Converts a value to a string.

```python
str(100)             # "100"
```

---

## 8. `list()`

Creates a list.

```python
list("abc")          # ['a', 'b', 'c']
```

---

## 9. `tuple()`

Creates a tuple.

```python
tuple([1, 2, 3])     # (1, 2, 3)
```

---

## 10. `set()`

Creates a set (unique values).

```python
set([1, 1, 2, 3])    # {1, 2, 3}
```

---

## 11. `dict()`

Creates a dictionary.

```python
dict(a=1, b=2)       # {'a': 1, 'b': 2}
```

---

## 12. `sum()`

Returns the sum of iterable elements.

```python
sum([1, 2, 3])       # 6
```

---

## 13. `max()`

Returns the largest value.

```python
max([10, 20, 5])     # 20
```

---

## 14. `min()`

Returns the smallest value.

```python
min([10, 20, 5])     # 5
```

---

## 15. `sorted()`

Returns a sorted list.

```python
sorted([3, 1, 2])    # [1, 2, 3]
```

---

## 16. `range()`

Generates a sequence of numbers.

```python
list(range(1, 5))    # [1, 2, 3, 4]
```

---

## 17. `abs()`

Returns the absolute value.

```python
abs(-10)             # 10
```

---

## 18. `round()`

Rounds a number.

```python
round(3.14159, 2)    # 3.14
```

---

## 19. `enumerate()`

Returns index-value pairs.

```python
for i, v in enumerate(["a", "b", "c"]):
    print(i, v)
```

---

## 20. `zip()`

Combines multiple iterables.

```python
list(zip([1, 2], ["a", "b"]))
# [(1, 'a'), (2, 'b')]
```

---

### Summary (Interview-Friendly)

* **Conversion**: `int`, `float`, `str`
* **Collections**: `list`, `tuple`, `set`, `dict`
* **Utility**: `len`, `type`, `sum`, `max`, `min`, `sorted`
* **Iteration helpers**: `range`, `enumerate`, `zip`
