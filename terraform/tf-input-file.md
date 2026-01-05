In Terraform, an **input file** usually means a **variables file (`.tfvars`)** that provides values for variables defined in your configuration.

Here’s the **clear, correct way** to write and use it 👇

---

## 1️⃣ Define variables (in `variables.tf`)

```hcl
variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}
```

---

## 2️⃣ Create an input file (`terraform.tfvars`)

This is the **default input file** Terraform automatically loads.

```hcl
region      = "us-east-1"
bucket_name = "azmat-media-bucket"
env         = "dev"
```

✔ No quotes around variable names
✔ Quotes required for strings

---

## 3️⃣ Use variables in your Terraform code

```hcl
provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "media" {
  bucket = var.bucket_name
}
```

---

## 4️⃣ Use multiple input files (env-based)

### Example

```bash
dev.tfvars
prod.tfvars
```

**dev.tfvars**

```hcl
region      = "us-east-1"
bucket_name = "azmat-media-dev"
env         = "dev"
```

**prod.tfvars**

```hcl
region      = "us-east-1"
bucket_name = "azmat-media-prod"
env         = "prod"
```

Apply with:

```bash
terraform apply -var-file=dev.tfvars
```

---

## 5️⃣ Other ways to pass input values

### Command line

```bash
terraform apply -var="region=us-east-1"
```

### Environment variables

```bash
export TF_VAR_region=us-east-1
```

---

## 6️⃣ Input file for complex values

### List

```hcl
subnet_ids = ["subnet-123", "subnet-456"]
```

### Map

```hcl
tags = {
  Project = "Media"
  Owner   = "Azmat"
}
```

---

## 🧠 Best Practices

✔ Use `terraform.tfvars` for defaults
✔ Use `*.tfvars` for environments
✔ Never commit secrets (use env vars or secret manager)
✔ Keep variables typed (`string`, `list`, `map`)

---

## 📌 Summary

| File               | Purpose                  |
| ------------------ | ------------------------ |
| `variables.tf`     | Declare inputs           |
| `terraform.tfvars` | Default values           |
| `dev.tfvars`       | Environment values       |
| `-var-file`        | Load specific input file |

---
