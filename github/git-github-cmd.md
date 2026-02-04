# Git and GitHub Documentation:
<br>

## Git Common used Commands

### Install Git

```bash
sudo apt install git -y
```

### Check Git version

```bash
git --version
```

### Configure Git user details

```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```


### Clone a remote repository

```bash
git clone <repository_url>
```

**Example:**

```bash
git clone https://github.com/azmat711/myproject.git
```

### Shallow Cloning remote repository

```bash
# Speeds up cloning by fetching only the latest commits.

git clone --depth=1 <repository-url>
```

### Initialize a new Git repository in local directory

```bash
git init
```


### Connect local repository to remote GitHub repo

```bash
git remote add origin <repository_url>
```

**Example:**

```bash
git remote add origin https://github.com/azmat711/myproject.git
```


### Verify remote connection

```bash
git remote -v
```


### Check current status of your repo

```bash
git status
```

### Stage files for commit

```bash
git add <file_name>
```

**Add all files:**

```bash
git add .
```

### Commit changes with a message

```bash
git commit -m "Initial commit"
```

### Use multi-line commits for more details
```bash
git commit -m "Improve password hashing" -m "Uses bcrypt instead of SHA-256 for stronger security"
```
### Push local changes to GitHub

```bash
git push origin main
```

**If first time:**

```bash
git push -u origin main
```


### Pull updates from GitHub to local

```bash
git pull origin main
```

<br><br>

## Create and use branches

### List all branches

```bash
git branch
```

### Create a new branch

```bash
git branch <branch_name>
```

### Switch to another branch

```bash
git checkout <branch_name>
```

### Create and switch in one command

```bash
git checkout -b <branch_name>
```

### Merge a branch into main

```bash
git checkout main
git merge <branch_name>
```

### Delete a branch

```bash
git branch -d <branch_name>
```

<br><br>

## Create and use .gitignore file

Create a `.gitignore` file in the root directory

```bash
touch .gitignore
```

### Add files or folders to ignore (example)

```
# Ignore node_modules folder
node_modules/

# Ignore environment files
.env

# Ignore log files
*.log

# Ignore system files
.DS_Store
```

### Check what Git is ignoring

```bash
git status --ignored
```

<br><br>

## Manage git logs

### View commit history

```bash
git log
```

### View summarized commit history

```bash
git log --oneline
```

### Undo last commit (without deleting changes)

```bash
git reset --soft HEAD~1
```

### To undo the last commit from the github
```bash
git revert HEAD

# then 
git add .
git commit -m "reverted"
git push origin main
```