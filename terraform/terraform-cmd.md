# Core Terraform Workflow Commands

### 1. `terraform init`

**Purpose:** Initialize a Terraform working directory

* Downloads providers
* Configures backend (S3, etc.)
* Initializes modules

```bash
terraform init
terraform init -upgrade
terraform init -migrate-state
```

---

### 2. `terraform validate`

**Purpose:** Validate configuration syntax and internal consistency

```bash
terraform validate
```

Does **not** contact cloud providers.

---

### 3. `terraform plan`

**Purpose:** Preview infrastructure changes (execution plan)

```bash
terraform plan
terraform plan -out=tfplan
terraform plan -var="env=prod"
terraform plan -refresh-only
```

Used for **change review and approvals**.

---

### 4. `terraform apply`

**Purpose:** Apply planned changes to infrastructure

```bash
terraform apply
terraform apply tfplan
terraform apply -auto-approve
```

Creates, updates, or deletes resources.

---

### 5. `terraform destroy`

**Purpose:** Destroy all managed infrastructure

```bash
terraform destroy
terraform destroy -auto-approve
```

Used mainly for **non-production environments**.

---

## Formatting & Quality Commands

### 6. `terraform fmt`

**Purpose:** Format Terraform code to standard style

```bash
terraform fmt
terraform fmt -recursive
```

Mandatory in CI pipelines.

---

### 7. `terraform providers`

**Purpose:** Show providers required by the configuration

```bash
terraform providers
terraform providers lock
```

---

## State Management Commands (Very Important)

### 8. `terraform state list`

**Purpose:** List all resources in state

```bash
terraform state list
```

---

### 9. `terraform state show`

**Purpose:** Inspect a specific resource in state

```bash
terraform state show aws_instance.app
```

---

### 10. `terraform state mv`

**Purpose:** Move resources within state (refactoring-safe)

```bash
terraform state mv aws_instance.old aws_instance.new
```

---

### 11. `terraform state rm`

**Purpose:** Remove resource from state (does NOT destroy infra)

```bash
terraform state rm aws_instance.temp
```

Used during imports or recovery.

---

### 12. `terraform force-unlock`

**Purpose:** Unlock a stuck remote state lock

```bash
terraform force-unlock LOCK_ID
```

Use only when you are sure no other apply is running.

---

## Import & Inspection Commands

### 13. `terraform import`

**Purpose:** Import existing infrastructure into Terraform state

```bash
terraform import aws_s3_bucket.mybucket my-bucket-name
```

Does not generate `.tf` code.

---

### 14. `terraform show`

**Purpose:** Display state or plan in human-readable form

```bash
terraform show
terraform show tfplan
```

---

### 15. `terraform output`

**Purpose:** Read output values

```bash
terraform output
terraform output instance_ip
```

---

## Workspace & Environment Commands

### 16. `terraform workspace list`

```bash
terraform workspace list
```

---

### 17. `terraform workspace new`

```bash
terraform workspace new dev
```

---

### 18. `terraform workspace select`

```bash
terraform workspace select prod
```

Used for **small or non-critical environment separation**.

---

## Module & Dependency Commands

### 19. `terraform get`

**Purpose:** Download and update modules

```bash
terraform get
terraform get -update
```

---

### 20. `terraform graph`

**Purpose:** Generate dependency graph

```bash
terraform graph | dot -Tpng > graph.png
```

Mostly for visualization and debugging.

---

## Debugging & Advanced Commands

### 21. `terraform console`

**Purpose:** Interactive Terraform expression testing

```bash
terraform console
```

---

### 22. `terraform taint` (Deprecated)

**Purpose:** Mark resource for recreation
Replaced by:

```bash
terraform apply -replace=aws_instance.app
```

---

## Most Used Commands in Production (Top 6)

1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. `terraform validate`
5. `terraform fmt`
6. `terraform destroy`

---