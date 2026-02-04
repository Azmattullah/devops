
## ✅ If you already cloned the repo

Go into your project folder:

```bash
cd path/to/bestcast_web_v3
```

### 1️⃣ Make sure you’re on the correct branch

```bash
git checkout quizApplication
```

If you’re not sure what branch you’re on:

```bash
git branch
```

The current one will have a `*` next to it.

---

### 2️⃣ Pull the latest changes from GitHub

```bash
git pull origin quizApplication
```

That command means:

* **origin** → the GitHub repo
* **quizApplication** → the branch you want updates from

---

## 🧠 If Git says you have local changes

You might see an error like *“Your local changes would be overwritten…”*

You have 2 options:

### ✔ Option A — Keep your changes (safe)

```bash
git stash
git pull origin quizApplication
git stash pop
```

This temporarily saves your work, updates the branch, then reapplies your changes.

---

### ❌ Option B — Discard local changes (only if you’re sure)

```bash
git reset --hard
git pull origin quizApplication
```

⚠️ This deletes your uncommitted local changes.

---

## 🔍 Confirm you’re up to date

```bash
git log --oneline -5
```

You should see the latest commits from GitHub at the top.

<br><br>

## ✅ If You have local edits SAFEST FIX (Recommended)

We’ll **back up everything**, then pull cleanly.

### 1️⃣ Save your local changes safely

```bash
git stash push -u -m "backup before pull"
```

`-u` = includes untracked files like `.env`

---

### 2️⃣ Pull the latest code

```bash
git pull origin quizApplication
```

Now it should update successfully.

---

### 3️⃣ Restore your old files (carefully)

```bash
git stash pop
```

Now Git will try to reapply your server changes **on top of the new code**.

You might get **merge conflicts** — that’s normal. If so, Git will tell you which files need fixing.


