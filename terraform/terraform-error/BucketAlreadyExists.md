# ERROR:
```

aws_s3_bucket.media-bucket: Creating...
╷
│ Error: creating S3 Bucket (azmat-bucket): operation error S3: CreateBucket, https response error StatusCode: 409, RequestID: 08YNSSEZ43RJBCE5, HostID: UXGoDycflOyGsDsPdJjWV14yvHihwA/5AUvJ2Sxrhqsts9h9U95lvq2oGw5rucTDh7K0zbAvWvywCKB5WXLdKtUV9rEBU3Q66EnDyFuIVbU=, BucketAlreadyExists: 
│ 
│   with aws_s3_bucket.media-bucket,
│   on main.tf line 1, in resource "aws_s3_bucket" "media-bucket":
│    1: resource "aws_s3_bucket" "media-bucket" {
│ 
╵
```

<br><br>

# SOLUTION:

This error happens because **S3 bucket names are globally unique across all AWS accounts**.
Someone (maybe you, maybe another account) already owns `azmat-bucket`, so AWS returns `BucketAlreadyExists (409)`.

Here are the **correct Terraform ways to fix it**, depending on what you want.

---

## ✅ Option 1: Use a globally unique bucket name (most common fix)

Add a unique suffix (project, env, random string).

### Example with a variable

```hcl
resource "aws_s3_bucket" "media_bucket" {
  bucket = "azmat-bucket-dev-12345"
}
```

### Better: use a random suffix (recommended)

```hcl
resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "media_bucket" {
  bucket = "azmat-bucket-${random_id.suffix.hex}"
}
```

This guarantees uniqueness every time.

---

## ✅ Option 2: You already own the bucket → import it into Terraform

If **the bucket already exists in your AWS account**, Terraform is trying to recreate it instead of managing it.

### Import the bucket

```bash
terraform import aws_s3_bucket.media-bucket azmat-bucket
```

Then run:

```bash
terraform plan
terraform apply
```

✔ This is the **correct fix if the bucket already exists**

---

## ✅ Option 3: Use an existing bucket (do NOT create it)

If the bucket is created outside Terraform and you just want to reference it:

```hcl
data "aws_s3_bucket" "media_bucket" {
  bucket = "azmat-bucket"
}
```

Use `data.aws_s3_bucket.media_bucket.id` instead of a resource.

---

## ❌ What will NOT fix it

* Changing AWS region ❌
* Re-running `terraform apply` ❌
* Deleting `.terraform` folder ❌

S3 bucket names are **global**, not regional.

---

## 🔍 How to decide which fix you need

* **Bucket exists & you own it** → **Import it**
* **Bucket exists & you don’t own it** → **Rename it**
* **Bucket created manually** → **Use a data source**

---
