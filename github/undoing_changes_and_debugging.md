# Undoing Changes and Debugging in Git

Git provides a rich set of commands to undo changes, fix mistakes, and debug issues efficiently. This document organizes the most commonly used commands by **use case**, with clear explanations and examples.

---

## 1. Undoing Local Changes

These commands help you discard or modify changes **before they are committed**.

---

### 1.1 Discarding Unstaged Changes (`git restore`)

If you modified files but **have not staged them** (`git add` not run yet):

```bash
git restore <file>
```

Discard **all unstaged changes** in the working directory:

```bash
git restore .
```

**Important:**

* Changes are permanently lost
* Only affects **unstaged** files

---

### 1.2 Reverting Staged Changes (`git reset`)

If you already staged changes using `git add` but want to **unstage them**:

```bash
git reset <file>
```

To unstage **all staged files**:

```bash
git reset
```

**Notes:**

* Does NOT delete file changes
* Moves changes from *staging area* back to *working directory*

---

## 2. Undoing Commits

These commands help undo changes that were **already committed**.

---

### 2.1 Reverting a Commit (`git revert`)

Use this when you want to undo a commit **without rewriting history** (safe for shared branches):

```bash
git revert <commit-hash>
```

**What it does:**

* Creates a **new commit** that reverses the specified commit
* Preserves commit history

**Best for:**

* Production branches
* Shared repositories

---

### 2.2 Resetting Commits (`git reset`)

`git reset` moves the HEAD pointer and optionally affects staging and files.

#### a) Soft Reset (`--soft`)

```bash
git reset --soft HEAD~1
```

* Removes last commit
* Keeps changes **staged**

Use case: Fix commit message or combine commits.

---

#### b) Mixed Reset (`--mixed`) – Default

```bash
git reset --mixed HEAD~1
```

* Removes last commit
* Keeps changes **unstaged**

Use case: Rework changes before recommitting.

---

#### c) Hard Reset (`--hard`)

```bash
git reset --hard HEAD~1
```

* Removes commit
* Deletes all changes permanently

**Warning:** This action is irreversible.

---

## 3. Stashing Changes (`git stash`)

Stashing allows you to temporarily save work without committing.

---

### 3.1 Create a Stash

```bash
git stash
```

Saves:

* Modified tracked files
* Staged and unstaged changes

---

### 3.2 Apply Stashed Changes

Apply and remove the latest stash:

```bash
git stash pop
```

Apply a specific stash without removing it:

```bash
git stash apply stash@{1}
```

---

### 3.3 View All Stashes

```bash
git stash list
```

---

## 4. Debugging and Finding Issues in History

These tools help identify **who**, **when**, and **where** issues were introduced.

---

### 4.1 Finding Who Changed Code (`git blame`)

```bash
git blame <file>
```

Shows:

* Author of each line
* Commit hash
* Timestamp

Use case: Understand why a line exists or who introduced a change.

---

### 4.2 Finding a Bug Using Binary Search (`git bisect`)

Git bisect helps locate the exact commit that introduced a bug.

Start bisect:

```bash
git bisect start
git bisect bad
git bisect good <commit-hash>
```

Git will:

* Checkout commits automatically
* Ask you to test each version

Mark results during testing:

```bash
git bisect good
git bisect bad
```

End bisect:

```bash
git bisect reset
```

---

### 4.3 Recovering Lost Commits (`git reflog`)

```bash
git reflog
```

Shows:

* History of HEAD movements
* Resets, checkouts, rebases

Use case:

* Recover deleted commits
* Debug accidental resets

---

## 5. Quick Decision Guide

| Scenario                 | Recommended Command           |
| ------------------------ | ----------------------------- |
| Discard unstaged changes | `git restore`                 |
| Unstage files            | `git reset`                   |
| Undo commit safely       | `git revert`                  |
| Rewrite local history    | `git reset --soft/mixed/hard` |
| Temporarily save work    | `git stash`                   |
| Find who changed code    | `git blame`                   |
| Find bug origin          | `git bisect`                  |
| Recover lost commits     | `git reflog`                  |

---

## Conclusion

Understanding these Git commands allows you to:

* Confidently undo mistakes
* Debug issues efficiently
* Maintain clean and reliable Git history

Mastering these tools is essential for professional Git usage in real-world projects.
