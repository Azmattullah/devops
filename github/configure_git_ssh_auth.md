# Connecting to GitHub with SSH

Setting up SSH authentication allows you to securely connect and authenticate to GitHub repositories **without entering your username and password** (or Personal Access Token) for every Git operation.

---

## 1. Check for Existing SSH Keys

Before generating a new key, check if you already have one on your local system:

```bash
ls -la ~/.ssh/
```

Look for files ending in `.pub` (e.g., `id_ed25519.pub` or `id_rsa.pub`). If you already have a key you want to use, skip to [Step 3](#3-add-your-ssh-key-to-your-github-account).

---

## 2. Generate a New SSH Key Pair

If you do not have an SSH key, generate a secure ED25519 key (recommended by GitHub):

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
*Note: If your system doesn't support ED25519, use the RSA fallback:*
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

**When prompted:**
1. *Enter a file in which to save the key:* Press **Enter** to accept the default location (`~/.ssh/id_ed25519` or `~/.ssh/id_rsa`).
2. *Enter passphrase:* Enter a secure passphrase (optional but recommended for local security), or press **Enter** to leave it empty.

---

## 3. Add Your SSH Key to Your GitHub Account

### Step 3.1: Copy the Public Key
Display and copy the contents of your **public** key:

```bash
# If you generated an ED25519 key (recommended)
cat ~/.ssh/id_ed25519.pub

# If you generated an RSA key
cat ~/.ssh/id_rsa.pub
```
Select and copy the entire output line (starts with `ssh-ed25519` or `ssh-rsa` and ends with your email).

### Step 3.2: Add to GitHub Settings
1. Go to [GitHub](https://github.com) and sign in.
2. Click your profile photo in the upper-right corner and select **Settings**.
3. In the left sidebar, click **SSH and GPG keys**.
4. Click the green **New SSH key** (or **Add SSH key**) button.
5. In the **Title** field, add a descriptive label for the new key (e.g., "Personal Linux Laptop").
6. Keep the **Key type** as *Authentication Key*.
7. Paste your public key into the **Key** field.
8. Click **Add SSH key**.

---

## 4. Test the SSH Connection

Verify that your SSH connection to GitHub works:

```bash
ssh -T git@github.com
```

*If this is your first time connecting, you will see a message like:*
> The authenticity of host 'github.com (...)' can't be established.
> Are you sure you want to continue connecting (yes/no/[fingerprint])?

Type **`yes`** and press **Enter**.

**Expected output upon successful connection:**
```text
Hi <your-github-username>! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## 5. Configure Your Git Repositories to Use SSH

If you cloned your repository using an HTTPS URL (e.g., `https://github.com/...`), you must update it to use the SSH URL.

### Step 5.1: Check Current Remote URL
Inside your local repository directory, run:
```bash
git remote -v
```

### Step 5.2: Switch to SSH URL
If the URL starts with `https://`, update it using:
```bash
git remote set-url origin git@github.com:username/repository.git
```
*(Replace `username/repository.git` with your actual GitHub username and repository name.)*

---

## 6. Troubleshooting & Tips

### Issue: "Permission denied (publickey)"

If GitHub rejects your connection, ensure your SSH agent is running and has loaded your private key:

1. Start the SSH agent in the background:
   ```bash
   eval "$(ssh-agent -s)"
   ```
2. Add your private key to the agent:
   ```bash
   # For ED25519
   ssh-add ~/.ssh/id_ed25519

   # For RSA
   ssh-add ~/.ssh/id_rsa
   ```

### Managing Multiple GitHub Accounts (Optional)
If you use multiple GitHub accounts, define them in the SSH config file (`~/.ssh/config`):

```text
# Personal Account
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519

# Work Account
Host github-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_work
```
When cloning a repository with the work account, use the alias:
```bash
git clone git@github-work:work-org/repo.git
```

