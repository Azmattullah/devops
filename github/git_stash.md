# Mastering Git Stash

`git stash` is a powerful tool that temporarily shelves (or "stashes") changes you've made to your working copy so you can work on something else, and then reapply them later.

This is especially useful when you need to switch branches, pull remote updates, or perform emergency hotfixes without committing incomplete work.

---

## 1. Core Git Stash Commands

### Save Your Changes
Stash your modified tracked files:
```bash
git stash
```

To stash your changes with a descriptive label (highly recommended):
```bash
git stash push -m "Describe your changes here"
```

To include **new, untracked files** (files not yet added to Git) or ignored files:
```bash
# Include untracked files (-u)
git stash push -u -m "My backup with new files"

# Include untracked and ignored files (-a)
git stash push -a -m "Full backup including ignored files"
```

---

### List Saved Stashes
View all stashes you have saved. They are stored as a stack, where `stash@{0}` is the most recent:
```bash
git stash list
```
*Example Output:*
```text
stash@{0}: On main: Work in progress on homepage layout
stash@{1}: On feature-login: Backup before pull
```

---

### Inspect a Stash
View the changes inside a stash before applying it:
```bash
# View summary of changed files
git stash show stash@{0}

# View the full diff (differences) of the changes
git stash show -p stash@{0}
```

---

### Apply Stashed Changes
There are two ways to restore stashed changes:

1. **Pop (Reapply & Delete):** Applies the changes and removes them from your stash list.
   ```bash
   git stash pop
   
   # Pop a specific stash index
   git stash pop stash@{1}
   ```
2. **Apply (Reapply & Keep):** Applies the changes but keeps them in the stash list (safe if you want to apply changes to multiple branches).
   ```bash
   git stash apply
   
   # Apply a specific stash index
   git stash apply stash@{1}
   ```

---

### Delete Stashes
```bash
# Delete a specific stash from the stack
git stash drop stash@{0}

# Delete all stashes on your system (caution!)
git stash clear
```

---

## 2. Common Workflow: Safely Pulling Remote Changes

If you try to run `git pull` but Git blocked it with:
> *“Your local changes to the following files would be overwritten by merge…”*

Use the stash-and-pull workflow to safely fetch updates without losing your work:

### Step 1: Save local edits (including new files)
```bash
git stash push -u -m "Backup before pulling updates"
```

### Step 2: Pull the remote changes
```bash
git pull origin <branch_name>
```

### Step 3: Reapply your local edits
```bash
git stash pop
```

---

## 3. Resolving Conflicts During `git stash pop`

When you pop or apply a stash, Git attempts to merge your stashed changes with the updated codebase. 

### What Happens During a Conflict:
1. Git will print a warning: `CONFLICT (content): Merge conflict in <file_name>`.
2. The stash **will not be deleted** from the stash list (to protect your code from data loss).
3. The conflicting files will contain conflict markers:
   ```text
   <<<<<<< Updated upstream
   Code from the remote repository (updated)
   =======
   Your stashed changes (local edits)
   >>>>>>> Stashed changes
   ```

### How to Fix Conflicts:
1. Open the conflicting files and decide which code to keep, then remove the markers (`<<<<<<<`, `=======`, `>>>>>>>`).
2. Stage the resolved files:
   ```bash
   git add <resolved_file_path>
   ```
3. Since the stash wasn't deleted automatically, manually drop it after you have resolved all conflicts:
   ```bash
   git stash drop
   ```
