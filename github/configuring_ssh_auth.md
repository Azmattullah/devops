# Configuring SSH Authentication for Git

SSH authentication allows you to securely connect to Git repositories (GitHub, GitLab, Bitbucket, etc.) **without entering your username and password every time**. It is the recommended authentication method for professional and production environments.

---

## 1. Why Use SSH Authentication?

Using SSH keys provides:

* Secure, encrypted authentication
* Password-less Git operations
* Better integration with CI/CD pipelines
* Compliance with GitHub/GitLab security best practices

---

## 2. Generating an SSH Key Pair

SSH authentication uses a **key pair**:

* **Private key** (kept on your system)
* **Public key** (uploaded to Git hosting service)

### 2.1 Generate a New SSH Key

Run the following command in your terminal:

```bash
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```

Explanation:

* `-t rsa` → Key type (RSA)
* `-b 4096` → Strong encryption (4096-bit)
* `-C` → Comment (usually your email)

When prompted:

* Press **Enter** to accept default file location (`~/.ssh/id_rsa`)
* Optionally set a **passphrase** for extra security

---

## 3. Viewing and Copying the Public Key

Display your public SSH key:

```bash
cat ~/.ssh/id_rsa.pub
```

The output will look similar to:

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQ... your-email@example.com
```

Copy the **entire output**.

---

## 4. Adding SSH Key to Git Hosting Provider

### 4.1 GitHub

1. Log in to GitHub
2. Go to **Settings → SSH and GPG keys**
3. Click **New SSH key**
4. Paste your public key
5. Give it a meaningful title (e.g., "Ubuntu Laptop")
6. Save

### 4.2 GitLab

1. Log in to GitLab
2. Go to **Preferences → SSH Keys**
3. Paste the public key
4. Save

---

## 5. Testing SSH Connection

Verify that SSH authentication works:

```bash
ssh -T git@github.com
```

Expected output:

```
Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.
```

This confirms SSH authentication is correctly configured.

---

## 6. Using SSH URLs for Git Repositories

Ensure your Git remote uses SSH, not HTTPS:

```bash
git remote -v
```

If it shows HTTPS, change it to SSH:

```bash
git remote set-url origin git@github.com:username/repository.git
```

---

## 7. Common Issues and Fixes

### Permission Denied (publickey)

Fix:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

---

### Multiple SSH Keys

Use SSH config file:

```bash
nano ~/.ssh/config
```

Example:

```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa
```

---

## 8. Security Best Practices

* Never share your private key (`id_rsa`)
* Use a passphrase for sensitive environments
* Rotate keys periodically
* Remove unused keys from GitHub/GitLab

---

## Conclusion

SSH authentication is the most secure and efficient way to interact with Git repositories. Proper configuration eliminates password prompts, enhances security, and integrates seamlessly with professional DevOps workflows.
