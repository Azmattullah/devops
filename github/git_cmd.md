# Git & GitHub Command Reference Guide

A comprehensive cheat sheet of the most commonly used Git commands, organized by lifecycle stage.

---

## 1. Setup & Configuration

### Install Git
On Debian/Ubuntu systems:
```bash
sudo apt update && sudo apt install git -y
```

### Configure User Info
Set up the identity associated with your commits:
```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

### View Configuration Settings
```bash
git config --list
# Or view global configs specifically
git config --global --list
```

### Check Version
```bash
git --version
```

---

## 2. Initializing & Cloning Repositories

### Initialize a Local Repository
Create a new, empty Git repository in the current directory:
```bash
git init
```

### Clone a Remote Repository
```bash
# Standard Clone
git clone <repository_url>

# Shallow Clone (downloads only the latest history to save bandwidth/time)
git clone --depth=1 <repository_url>
```

### Remote Repository Configuration
```bash
# Connect local repo to a remote server (e.g., GitHub)
git remote add origin <repository_url>

# List all configured remotes with their URLs
git remote -v

# Change the URL of an existing remote
git remote set-url origin <new_repository_url>

# Remove a remote association
git remote remove <remote_name>
```

---

## 3. Working with Changes (Basic Workflow)

### Check Status
See modified, untracked, and staged files:
```bash
git status
```

### Stage Changes (Add)
```bash
# Stage a specific file
git add <file_path>

# Stage all changes (new, modified, and deleted files)
git add .
```

### Compare Changes
```bash
# Show unstaged modifications
git diff

# Show changes that are staged (ready to commit)
git diff --staged
```

### Commit Changes
```bash
# Commit staged changes with a single-line message
git commit -m "Brief description of changes"

# Commit with multiple messages (e.g., Title & Body)
git commit -m "Short title" -m "More detailed explanation here..."

# Amend/modify the last commit (adds new staged files and/or updates the message)
git commit --amend -m "Updated commit message"
```

---

## 4. Branching & Merging

### List Branches
```bash
# List local branches
git branch

# List both local and remote-tracking branches
git branch -a
```

### Create & Switch Branches
```bash
# Create a new branch
git branch <branch_name>

# Switch to a branch
git checkout <branch_name>
# Or use the modern command:
git switch <branch_name>

# Create and switch to a new branch in one command
git checkout -b <branch_name>
# Or switch with create:
git switch -c <branch_name>

# Rename the current branch
git branch -m <new_branch_name>
```

### Merge Branches
Combine changes from another branch into the current checked-out branch:
```bash
# First switch to target branch (usually main/master)
git checkout main

# Merge the feature branch
git merge <branch_name>
```

### Delete Branches
```bash
# Delete a local branch (safely checks if it has been merged)
git branch -d <branch_name>

# Force delete a local branch (even if unmerged)
git branch -D <branch_name>

# Delete a remote branch
git push origin --delete <branch_name>
```

---

## 5. Sharing & Collaborating

### Fetch & Pull
```bash
# Fetch latest changes from remote (does not merge them)
git fetch origin

# Fetch and merge remote changes into current local branch
git pull origin <branch_name>
```

### Push Changes
```bash
# Push changes to remote (first-time push, sets upstream tracking)
git push -u origin <branch_name>

# Standard push (subsequent updates)
git push origin <branch_name>

# Force push (overwrites remote history—use with caution!)
git push --force origin <branch_name>
```

---

## 6. Undoing & Resetting Changes

### Discard Local Changes (Uncommitted)
```bash
# Discard changes in a specific file (revert to last committed state)
git restore <file_path>

# Discard all uncommitted changes in the current directory
git restore .
```

### Unstage Files
Move a file from the staging area back to the working directory:
```bash
git restore --staged <file_path>
```

### Reset Commits (Rewriting History)
```bash
# Soft Reset: Undo commit(s) but keep all changes in staging
git reset --soft HEAD~1

# Mixed Reset (Default): Undo commit(s) and unstage changes, keeping them in working directory
git reset HEAD~1

# Hard Reset: Completely discard last commit and all associated changes (destructive!)
git reset --hard HEAD~1
```

### Revert a Public Commit
Creates a new commit that applies the exact opposite changes of a target commit, preserving history:
```bash
git revert <commit_hash>
```

---

## 7. Stashing (Temporarily Saving Work)

Use stashing to save unfinished changes without committing them, allowing you to switch branches cleanly.

```bash
# Save uncommitted changes to a new stash
git stash push -m "work in progress"

# List all stashed changes
git stash list

# Apply the most recent stash and remove it from the stash list
git stash pop

# Apply a specific stash (e.g., stash@{1}) without removing it
git stash apply stash@{1}

# Discard the most recent stash
git stash drop

# Clear all stashes
git stash clear
```

---

## 8. Managing History & Logs

### View Commit Logs
```bash
# Standard verbose log
git log

# Single-line summarized log
git log --oneline

# Graphical representation of branches and commits
git log --oneline --graph --all
```

### Inspect a Specific Commit
```bash
git show <commit_hash>
```

---

## 9. Clearing Git Cache & Untracked Files

### Remove Cached Files (Without deleting them from disk)
Useful when you want to untrack files/directories after adding them to `.gitignore`:
```bash
# Untrack all files (cached index reset)
git rm -r --cached .
git add .
git commit -m "Untrack ignored files"

# Untrack a specific file
git rm --cached <file_path>

# Untrack a specific directory
git rm -r --cached <directory_path>
```

### Clean Untracked Files
```bash
# Dry run (shows what would be deleted)
git clean -n

# Forcefully delete untracked files
git clean -f

# Forcefully delete untracked files and directories
git clean -fd
```

### Clear Cached Git Credentials
```bash
git credential-cache exit
```

---

## 10. Ignoring Files (`.gitignore`)

Create a `.gitignore` file at the root of your project:
```bash
touch .gitignore
```

### Common `.gitignore` Rules:
```text
# Ignore dependency directories
node_modules/
vendor/

# Ignore environment/secret files
.env
*.pem

# Ignore operating system files
.DS_Store
Thumbs.db

# Ignore log files
*.log
```

### Check Ignored Files
```bash
git status --ignored
```