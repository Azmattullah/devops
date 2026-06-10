# SSH Keys Reference Guide

SSH keys provide a secure way to log into servers and services (such as GitHub, GitLab, and AWS EC2) without using passwords.

## Key Directory & File Types

By default, SSH keys are stored in the `~/.ssh/` directory.

| File | Type | Description |
| :--- | :--- | :--- |
| `~/.ssh/id_ed25519` | Private | **Secret** private key (ED25519). Keep this secure and never share it. |
| `~/.ssh/id_ed25519.pub` | Public | Public key (ED25519). Shared with remote servers/services. |
| `~/.ssh/id_rsa` | Private | **Secret** legacy RSA private key. |
| `~/.ssh/id_rsa.pub` | Public | Legacy RSA public key. |
| `~/.ssh/authorized_keys` | Config | List of public keys authorized to log into this system. |
| `~/.ssh/known_hosts` | Config | Fingerprints of remote hosts you have successfully connected to. |
| `~/.ssh/config` | Config | Client configuration file for defining host aliases and settings. |

---

## Core Operations

### 1. Check Existing Keys
List files in your SSH directory to see if keys already exist:
```bash
ls -la ~/.ssh/
```

### 2. Generate a New SSH Key Pair
If you don't have a key pair, generate a secure ED25519 key (recommended):
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
*Press **Enter** to accept the default file location and optional passphrase prompts.*

### 3. Display the Public Key
Use this to copy your public key for GitHub or a remote server:
```bash
cat ~/.ssh/id_ed25519.pub
```

---

## Deploying Public Keys to Remote Servers (e.g., AWS EC2)

To connect to a remote server using SSH keys, your public key (`id_ed25519.pub`) must be added to the remote server's `~/.ssh/authorized_keys` file.

### Option A: Using `ssh-copy-id` (Recommended / Automated)
If you already have password-based or key-based access to the server, use:
```bash
# General usage (password access)
ssh-copy-id -i ~/.ssh/id_ed25519.pub ubuntu@<REMOTE_IP>

# If using an existing AWS PEM key for initial access
ssh-copy-id -i ~/.ssh/id_ed25519.pub -o "IdentityFile=my-aws-key.pem" ubuntu@<REMOTE_IP>
```

### Option B: Manual Installation
If automation tools are unavailable, manually add the key:

1. **Copy** your local public key (`cat ~/.ssh/id_ed25519.pub`).
2. **Log into** the remote server:
   ```bash
   ssh -i my-aws-key.pem ubuntu@<REMOTE_IP>
   ```
3. **Configure** the SSH directory and paste the public key into `authorized_keys`:
   ```bash
   mkdir -p ~/.ssh
   chmod 700 ~/.ssh
   nano ~/.ssh/authorized_keys # Paste your public key here, save and exit
   chmod 600 ~/.ssh/authorized_keys
   ```

---

## Simplifying Connections with SSH Config

Instead of typing long commands, you can define host aliases in `~/.ssh/config`.

1. Edit or create the file:
   ```bash
   nano ~/.ssh/config
   ```
2. Add your server configuration:
   ```text
   Host my-ec2
       HostName 13.234.xx.xx
       User ubuntu
       IdentityFile ~/.ssh/id_ed25519
   ```
3. Set the correct file permissions:
   ```bash
   chmod 600 ~/.ssh/config
   ```
4. Connect using the alias:
   ```bash
   ssh my-ec2
   ```

---

## Troubleshooting & Verification

### Correct File Permissions
SSH will reject keys with insecure permissions. Ensure they are set correctly:
* **Local Machine:**
  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_ed25519
  chmod 600 ~/.ssh/config
  ```
* **Remote Server:**
  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/authorized_keys
  ```

### Common Default Usernames
| Cloud OS / AMI | Default SSH Username |
| :--- | :--- |
| **Ubuntu** | `ubuntu` |
| **Amazon Linux** | `ec2-user` |
| **CentOS** | `centos` |
| **Debian** | `admin` or `debian` |

### Verbose Debugging
If a connection fails, run SSH in verbose mode to identify where the handshake or key exchange is failing:
```bash
ssh -vvv my-ec2
```

