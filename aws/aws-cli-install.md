# Install AWS CLI

<br><br>

## Step 1: Install AWS CLI v2 on Ubuntu

Update system packages:

```bash
sudo apt update
sudo apt install -y unzip curl
```

Download AWS CLI v2:

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
```

Unzip and install:

```bash
unzip awscliv2.zip
sudo ./aws/install
```

Verify installation:

```bash
aws --version
```

Expected output:

```text
aws-cli/2.x.x Python/3.x Linux/x86_64
```

---

## Step 2: Generate AWS Access Keys (IAM)

1. Log in to **Amazon Web Services Management Console**
2. Navigate to **IAM**
3. Select your IAM User
4. Go to **Security credentials**
5. Create **Access key** → Use case: *CLI*
6. Download or copy:

   * **Access Key ID**
   * **Secret Access Key**

---

## Step 3: Configure AWS CLI (`aws configure`)

Run:

```bash
aws configure
```

Enter the values when prompted:

```text
AWS Access Key ID [None]: AKIA************
AWS Secret Access Key [None]: ********************
Default region name [None]: ap-south-1
Default output format [None]: json
```

Recommended regions:

* `ap-south-1` – Mumbai
* `us-east-1` – N. Virginia
* `eu-west-1` – Ireland

---

## Step 4: Verify Configuration

Check identity:

```bash
aws sts get-caller-identity
```

Successful output example:

```json
{
  "UserId": "AID************",
  "Account": "123456789012",
  "Arn": "arn:aws:iam::123456789012:user/devops-user"
}
```

---

## Step 5: Understand Configuration Files

AWS CLI stores credentials locally:

| File                 | Purpose                |
| -------------------- | ---------------------- |
| `~/.aws/credentials` | Access keys            |
| `~/.aws/config`      | Region & output format |

View files:

```bash
cat ~/.aws/credentials
cat ~/.aws/config
```

---

## Step 6: Configure Multiple Profiles (Best Practice)

Create named profile:

```bash
aws configure --profile prod
```

Use profile:

```bash
aws s3 ls --profile prod
```

Set default profile (optional):

```bash
export AWS_PROFILE=prod
```

---

## Step 7: Test with Common AWS Commands

List S3 buckets:

```bash
aws s3 ls
```

List EC2 instances:

```bash
aws ec2 describe-instances --region ap-south-1
```

---

## Security Best Practices

* Never use **root account** access keys
* Use **least-privilege IAM policies**
* Rotate keys periodically
* Prefer **IAM Roles** on EC2/ECS instead of static keys
* Never commit `~/.aws/credentials` to Git

---

## Optional: Enable Bash Auto-Completion

```bash
sudo apt install -y bash-completion
echo 'complete -C aws_completer aws' >> ~/.bashrc
source ~/.bashrc
```