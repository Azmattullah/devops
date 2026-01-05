# Copy files from Local System to (S3 Bucket)

## 1. Prerequisites

Ensure you have:

* An active AWS account
* An existing S3 bucket
* IAM user or role with **PutObject** permission on the target bucket
* Ubuntu system with sudo access

---

## 2. Install AWS CLI on Ubuntu

Update packages and install AWS CLI:

```bash
sudo apt update
sudo apt install awscli -y
```

Verify installation:

```bash
aws --version
```

---

## 3. Configure AWS Credentials

Configure credentials for **Amazon Web Services**:

```bash
aws configure
```

You will be prompted to enter:

* **AWS Access Key ID**
* **AWS Secret Access Key**
* **Default region name** (e.g., `ap-south-1`)
* **Default output format** (press Enter for `json`)

Credentials are stored securely at:

```
~/.aws/credentials
~/.aws/config
```

---

## 4. Copy a File from Local to S3 Bucket

### Basic file upload

```bash
aws s3 cp /local/path/file.txt s3://your-bucket-name/file.txt
```

Example:

```bash
aws s3 cp ~/Downloads/report.pdf s3://my-backup-bucket/report.pdf
```

---

## 5. Upload a File to a Specific Folder in S3

```bash
aws s3 cp file.txt s3://your-bucket-name/folder-name/file.txt
```

Example:

```bash
aws s3 cp image.png s3://my-backup-bucket/uploads/image.png
```

---

## 6. Upload an Entire Directory (Optional)

```bash
aws s3 cp /local/folder s3://your-bucket-name/folder --recursive
```

Example:

```bash
aws s3 cp ~/logs s3://my-backup-bucket/logs --recursive
```

---

## 7. Verify Upload

List files in the S3 bucket:

```bash
aws s3 ls s3://your-bucket-name/
```

Or inside a folder:

```bash
aws s3 ls s3://your-bucket-name/uploads/
```

---

## 8. Common Useful Flags

| Flag                          | Purpose                |
| ----------------------------- | ---------------------- |
| `--recursive`                 | Upload directories     |
| `--storage-class STANDARD_IA` | Lower-cost storage     |
| `--acl private`               | Explicit ACL           |
| `--dryrun`                    | Test without uploading |

Example:

```bash
aws s3 cp file.txt s3://bucket/file.txt --storage-class STANDARD_IA
```

---

## 9. Typical Errors and Fixes

**Access Denied**

* Verify IAM policy includes `s3:PutObject`

**Invalid Region**

* Ensure region matches bucket region

**Command Not Found**

* Reinstall awscli or check PATH


<br><br><br>

# Copy S3 Bucket files to (Local System)

## 1. Prerequisites

Confirm the following are already in place:

* AWS CLI installed on Ubuntu
* AWS credentials configured (`aws configure`)
* IAM permission: **s3:GetObject** on the target bucket/object
* Correct AWS region configured

---

## 2. Verify AWS CLI Configuration (Optional but Recommended)

```bash
aws sts get-caller-identity
```

This confirms that your local system is authenticated with **Amazon Web Services**.

---

## 3. Copy a File from S3 to Local System

### Basic command

```bash
aws s3 cp s3://your-bucket-name/file.txt /local/path/file.txt
```

### Example

```bash
aws s3 cp s3://my-backup-bucket/report.pdf ~/Downloads/report.pdf
```

If the local path is omitted, the file will be downloaded to the current directory:

```bash
aws s3 cp s3://my-backup-bucket/report.pdf .
```

---

## 4. Download a File from an S3 Folder

```bash
aws s3 cp s3://your-bucket-name/folder/file.txt /local/folder/file.txt
```

Example:

```bash
aws s3 cp s3://my-backup-bucket/uploads/image.png ~/images/image.png
```

---

## 5. Download an Entire Folder (Recursive)

```bash
aws s3 cp s3://your-bucket-name/folder /local/folder --recursive
```

Example:

```bash
aws s3 cp s3://my-backup-bucket/logs ~/logs --recursive
```

---

## 6. Verify Download

Check the file locally:

```bash
ls -lh /local/path/
```

---

## 7. Common Useful Flags

| Flag                              | Purpose                           |
| --------------------------------- | --------------------------------- |
| `--recursive`                     | Download directories              |
| `--exclude "*" --include "*.log"` | Download specific file types      |
| `--dryrun`                        | Preview files without downloading |
| `--quiet`                         | Suppress output                   |

Example:

```bash
aws s3 cp s3://my-backup-bucket/logs ~/logs --recursive --exclude "*" --include "*.log"
```

---

## 8. Typical Errors and Fixes

### AccessDenied

* Ensure IAM policy includes:

```json
"s3:GetObject"
```

### NoSuchKey

* Verify exact file path and name in S3

### Wrong Region

* Ensure AWS CLI region matches the bucket region

---

## 9. Alternative: Sync Instead of Copy (Recommended for Folders)

```bash
aws s3 sync s3://your-bucket-name/folder /local/folder
```

This downloads only new or changed files.
---