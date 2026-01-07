


# 🧪 Mock Interview Structure

* **Difficulty:** Easy → Medium
* **Focus:** Automation, logs, monitoring, reliability
* **Evaluation:** Correctness, complexity, clarity, edge cases

---

## Question 1: Log Error Counter (Warm-up)

### Problem

Given a list of log lines, count how many times each **ERROR code** appears.

```python
logs = [
  "INFO 200 service started",
  "ERROR 500 database down",
  "ERROR 404 not found",
  "ERROR 500 timeout",
]
```

### Expected Output

```python
{500: 2, 404: 1}
```

### What the interviewer looks for

* String parsing
* Dictionary usage
* Clean iteration

### Solution

```python
from collections import Counter

def count_errors(logs):
    errors = []
    for line in logs:
        if line.startswith("ERROR"):
            errors.append(int(line.split()[1]))
    return Counter(errors)
```

**Time Complexity:** O(n)

---

## Question 2: Check Duplicate Requests (Set Logic)

### Problem

Given a list of request IDs, return `True` if duplicates exist.

```python
requests = ["req1", "req2", "req3", "req1"]
```

### Follow-up

* Can you do it in **O(n)** time?

### Solution

```python
def has_duplicate(requests):
    return len(requests) != len(set(requests))
```

**Why this matters in DevOps:**
Detect replayed requests or duplicate job execution.

---

## Question 3: Merge Downtime Windows (Intervals)

### Problem

Merge overlapping downtime intervals.

```python
downtime = [[1,4], [2,6], [8,10]]
```

### Expected Output

```python
[[1,6], [8,10]]
```

### Solution

```python
def merge_intervals(intervals):
    intervals.sort()
    merged = [intervals[0]]

    for start, end in intervals[1:]:
        last_end = merged[-1][1]
        if start <= last_end:
            merged[-1][1] = max(last_end, end)
        else:
            merged.append([start, end])
    return merged
```

**Time Complexity:** O(n log n)

**DevOps relevance:**
Used in SLA reporting and incident timelines.

---

## Question 4: Validate Config Brackets (Stack)

### Problem

Check if a configuration string has balanced brackets.

```python
config = "{ service: [ app (v1) ] }"
```

### Solution

```python
def is_balanced(s):
    stack = []
    pairs = {')':'(', ']':'[', '}':'{'}

    for ch in s:
        if ch in pairs.values():
            stack.append(ch)
        elif ch in pairs:
            if not stack or stack.pop() != pairs[ch]:
                return False
    return not stack
```

**Why interviewers ask this:**
Tests stack understanding and config validation logic.

---

## Question 5: Top K Frequent Errors (Heap)

### Problem

Return the **top K most frequent error codes**.

```python
errors = [500, 500, 404, 403, 500, 404]
k = 2
```

### Expected Output

```python
[500, 404]
```

### Solution

```python
from collections import Counter
import heapq

def top_k_errors(errors, k):
    freq = Counter(errors)
    return heapq.nlargest(k, freq.keys(), key=freq.get)
```

**Time Complexity:** O(n log k)

**Real use:**
Alert prioritization and dashboard metrics.

---

# 🎯 Common Follow-up Questions

Interviewers may ask:

* Can you reduce memory usage?
* What happens with empty input?
* How would this work on **large log files**?
* How would you make this **streaming-friendly**?

---

# ✅ How to Answer Like a DevOps Engineer

Always explain:

1. **Why this problem exists in production**
2. **Time & space complexity**
3. **Edge cases**
4. **How you’d productionize it**

---


<br><br><br>



## 1️⃣ Find the First Non-Repeating Character (Log Parsing)

**Problem**
Given a string (log ID, request ID), find the **first non-repeating character**.

**Why DevOps?**
Used in log correlation, request tracing, and unique identifier analysis.

### Solution (O(n))

```python
from collections import Counter

def first_unique_char(s):
    freq = Counter(s)
    for ch in s:
        if freq[ch] == 1:
            return ch
    return None
```

**Example**

```python
print(first_unique_char("aabbcddee"))  # c
```

---

## 2️⃣ Top K Frequent Elements (Error Frequency)

**Problem**
Given a list of error codes, return the **top K most frequent**.

**Why DevOps?**
Used in alerting systems and error prioritization.

### Solution (O(n log k))

```python
from collections import Counter
import heapq

def top_k_frequent(nums, k):
    count = Counter(nums)
    return heapq.nlargest(k, count.keys(), key=count.get)
```

**Example**

```python
errors = [500, 404, 500, 200, 500, 404]
print(top_k_frequent(errors, 2))  # [500, 404]
```

---

## 3️⃣ Detect Duplicate Process IDs (PID Monitoring)

**Problem**
Check if duplicate PIDs exist in a list.

**Why DevOps?**
Detect zombie or duplicate processes.

### Solution (O(n))

```python
def has_duplicate(nums):
    return len(nums) != len(set(nums))
```

**Example**

```python
pids = [101, 202, 303, 101]
print(has_duplicate(pids))  # True
```

---

## 4️⃣ Merge Overlapping Time Intervals (Downtime Windows)

**Problem**
Merge overlapping intervals.

**Why DevOps?**
Used in outage timelines, maintenance windows, and monitoring reports.

### Solution (O(n log n))

```python
def merge_intervals(intervals):
    intervals.sort()
    merged = [intervals[0]]

    for start, end in intervals[1:]:
        last_end = merged[-1][1]
        if start <= last_end:
            merged[-1][1] = max(last_end, end)
        else:
            merged.append([start, end])
    return merged
```

**Example**

```python
intervals = [[1,3], [2,6], [8,10]]
print(merge_intervals(intervals))
# [[1,6], [8,10]]
```

---

## 5️⃣ Check Balanced Brackets (Config Validation)

**Problem**
Validate if brackets are balanced.

**Why DevOps?**
Used to validate YAML/JSON/templated configs.

### Solution (Stack, O(n))

```python
def is_balanced(s):
    stack = []
    pairs = {')':'(', '}':'{', ']':'['}

    for ch in s:
        if ch in pairs.values():
            stack.append(ch)
        elif ch in pairs:
            if not stack or stack.pop() != pairs[ch]:
                return False
    return not stack
```

**Example**

```python
print(is_balanced("{[()]}"))  # True
print(is_balanced("{[(])}"))  # False
```

---

## 🎯 Interview Summary (DevOps Focus)

| Problem             | Key Concept    | Complexity |
| ------------------- | -------------- | ---------- |
| First unique char   | Hash map       | O(n)       |
| Top K frequent      | Heap + Counter | O(n log k) |
| Duplicate detection | Set            | O(n)       |
| Interval merge      | Sorting        | O(n log n) |
| Balanced brackets   | Stack          | O(n)       |

---

### What interviewers expect from DevOps candidates:

* **Clean code**
* **Optimal time complexity**
* **Real-world applicability**
* **Ability to explain trade-offs**
