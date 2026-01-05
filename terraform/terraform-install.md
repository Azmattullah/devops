# **Production-recommended steps to install Terraform on Ubuntu Linux** 


<br><br>

## 1. Update System Packages

```bash
sudo apt update
sudo apt install -y gnupg software-properties-common curl
```

---

## 2. Add HashiCorp GPG Key

This verifies the authenticity of Terraform packages.

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

---

## 3. Add HashiCorp APT Repository

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list
```

---

## 4. Update Package Index

```bash
sudo apt update
```

---

## 5. Install Terraform

```bash
sudo apt install -y terraform
```

---

## 6. Verify Installation

```bash
terraform -version
```

You should see output similar to:

```
Terraform v1.x.x
```

---

## 7. Enable Tab Completion (Optional but Recommended)

```bash
terraform -install-autocomplete
```

Restart your shell afterward.

---

## 8. Keep Terraform Updated

Terraform will update automatically with system upgrades:

```bash
sudo apt upgrade terraform
```

---

## Alternative: Install Specific Version (Manual Binary)

Use this if you need strict version control (common in CI/CD pipelines).

```bash
wget https://releases.hashicorp.com/terraform/<VERSION>/terraform_<VERSION>_linux_amd64.zip
unzip terraform_<VERSION>_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -version
```

---

## Best Practice Notes (DevOps Perspective)

* Always install via **HashiCorp APT repo** on servers.
* Lock versions using `required_version` in `versions.tf`.
* Use **tfenv** if managing multiple Terraform versions locally.

---
