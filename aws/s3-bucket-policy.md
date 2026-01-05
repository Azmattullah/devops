Below is a **fully open AWS S3 bucket policy** that grants **all permissions on the bucket and all objects to everyone**.

⚠ **Important warning (read first):**
This policy makes your bucket **completely public** — anyone on the internet can **read, write, delete, upload, and modify** objects. This is **strongly discouraged for production** and can lead to **data loss, security breaches, and high AWS bills**.

---

## ⚠ Full Public Access S3 Bucket Policy (ALL ACTIONS)

Replace **`YOUR_BUCKET_NAME`** with your actual bucket name.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAllS3ActionsToEveryone",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::YOUR_BUCKET_NAME",
        "arn:aws:s3:::YOUR_BUCKET_NAME/*"
      ]
    }
  ]
}
```

---

## What this policy allows

| Capability             | Status  |
| ---------------------- | ------- |
| List bucket            | Allowed |
| Read objects           | Allowed |
| Upload objects         | Allowed |
| Delete objects         | Allowed |
| Change ACLs            | Allowed |
| Change bucket settings | Allowed |

This is **full admin-level access for everyone**.

---

## Required additional settings (VERY IMPORTANT)

Even with the policy above, AWS will still block access unless you do this:

### 1. Disable Block Public Access

Go to:

```
S3 → Bucket → Permissions → Block public access
```

Uncheck **all** options:

* ❌ Block public ACLs
* ❌ Block public bucket policies
* ❌ Ignore public ACLs
* ❌ Restrict public buckets

Then **Save changes**.

---
