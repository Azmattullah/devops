# Shallow Copy And Deep Copy

### Imagine a **lemon** with **two parts**:

* The **outer skin** (the surface of the lemon).
* The **inside pulp** (the juicy part inside the lemon).

Now, think of a **list** in Python as something like this lemon. The **outer skin** is the **list itself**, and the **inside pulp** is the **objects or values** inside that list (could be numbers, strings, or other lists).

### Shallow Copy 🍋

A **shallow copy** is like getting another **lemon** with the **same skin** but **sharing** the **same inside pulp** (the juicy part).

* **What happens?**: When you create a shallow copy, you're just copying the outer skin of the lemon (the list), but **the inside pulp (the elements)** are **not copied**, they are just **referenced**. So if you change the pulp inside one lemon, it will affect both lemons, because they share the same pulp!

#### Example of Shallow Copy:

```python
lemon1 = [1, 2, [3, 4]]
lemon2 = lemon1.copy()  # Shallow copy

lemon1[2][0] = 99
print(lemon1)  # [1, 2, [99, 4]]
print(lemon2)  # [1, 2, [99, 4]]  <- Shared pulp, so both lemons change!
```

In this example, **lemon1** and **lemon2** both have the same pulp, so if you change the pulp in one, it affects the other.

### Deep Copy 🍋🍋

A **deep copy** is like getting another **lemon** with **both a new skin and new pulp** inside. Each part is completely copied, so if you change something inside one lemon, the other lemon stays **totally unchanged**.

* **What happens?**: When you create a deep copy, everything inside the original list gets **completely copied**, so no part is shared. Even the inside pulp (objects inside the list) gets its own separate copy.

#### Example of Deep Copy:

```python
import copy

lemon1 = [1, 2, [3, 4]]
lemon2 = copy.deepcopy(lemon1)  # Deep copy

lemon1[2][0] = 99
print(lemon1)  # [1, 2, [99, 4]]
print(lemon2)  # [1, 2, [3, 4]]  <- Pulp is independent, so lemon2 stays the same!
```

Here, **lemon1** and **lemon2** are completely independent, even though they started off looking the same. Changing the inside pulp of **lemon1** doesn’t affect **lemon2**.

### Summary:

* **Shallow copy**: Copies the outer skin but **shares the inside pulp** (so changes to pulp affect both lemons).
* **Deep copy**: Copies both the outer skin **and** the inside pulp (no sharing, so changes in one lemon don’t affect the other).

So, **shallow copy** is like getting a lemon with a shared inside, and **deep copy** is like getting a completely fresh lemon! 🍋
