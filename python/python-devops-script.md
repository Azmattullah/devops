Below are **real-world, production-style Python scripts commonly used by DevOps engineers**. These examples reflect **actual operational tasks** such as monitoring, log rotation, health checks, automation, and cloud operations.

---

## 1️⃣ Disk Usage Monitoring & Alert

**Use case:** Alert when disk usage crosses threshold.

```python
import shutil

THRESHOLD = 80  # percent

total, used, free = shutil.disk_usage("/")
usage_percent = (used / total) * 100

if usage_percent > THRESHOLD:
    print(f"ALERT: Disk usage at {usage_percent:.2f}%")
else:
    print(f"Disk OK: {usage_percent:.2f}%")
```

---

## 2️⃣ Check & Restart Service if Down (Linux)

**Use case:** Ensure critical service is running.

```python
import subprocess

service = "nginx"

result = subprocess.run(
    ["systemctl", "is-active", service],
    stdout=subprocess.PIPE,
    text=True
)

if result.stdout.strip() != "active":
    subprocess.run(["systemctl", "restart", service])
    print(f"{service} restarted")
```

---

## 3️⃣ Log Rotation (Delete Logs Older Than 7 Days)

**Use case:** Prevent disk exhaustion.

```python
import os
import time

LOG_DIR = "/var/log/myapp"
DAYS = 7
now = time.time()

for file in os.listdir(LOG_DIR):
    path = os.path.join(LOG_DIR, file)
    if os.stat(path).st_mtime < now - DAYS * 86400:
        os.remove(path)
```

---

## 4️⃣ Application Health Check (HTTP)

**Use case:** CI/CD or monitoring probe.

```python
import requests

URL = "https://example.com/health"

try:
    r = requests.get(URL, timeout=5)
    if r.status_code == 200:
        print("App healthy")
    else:
        print("App unhealthy")
except Exception as e:
    print("Health check failed:", e)
```

---

## 5️⃣ CPU & Memory Monitoring

**Use case:** Lightweight system monitoring.

```python
import psutil

cpu = psutil.cpu_percent(interval=1)
mem = psutil.virtual_memory().percent

print(f"CPU: {cpu}% | Memory: {mem}%")
```

---

## 6️⃣ Find Process Using a Port

**Use case:** Debug port conflicts.

```python
import psutil

PORT = 8080

for conn in psutil.net_connections(kind='inet'):
    if conn.laddr.port == PORT:
        print(f"PID {conn.pid} using port {PORT}")
```

---

## 7️⃣ Backup Directory as ZIP

**Use case:** Automated backups.

```python
import shutil
import datetime

backup_name = f"/backup/app_{datetime.date.today()}"
shutil.make_archive(backup_name, 'zip', '/var/www/app')
```

---

## 8️⃣ Read `.env` File & Export Variables

**Use case:** Config management.

```python
import os

with open(".env") as f:
    for line in f:
        if "=" in line:
            key, value = line.strip().split("=", 1)
            os.environ[key] = value
```

---

## 9️⃣ AWS S3 File Upload

**Use case:** Cloud storage automation.

```python
import boto3

s3 = boto3.client("s3")
s3.upload_file("app.log", "my-bucket", "logs/app.log")
```

---

## 🔟 List EC2 Instances

**Use case:** Cloud inventory.

```python
import boto3

ec2 = boto3.client("ec2")
instances = ec2.describe_instances()

for r in instances["Reservations"]:
    for i in r["Instances"]:
        print(i["InstanceId"], i["State"]["Name"])
```

---

## 1️⃣1️⃣ Check Docker Containers Status

**Use case:** Container health check.

```python
import subprocess

containers = subprocess.check_output(["docker", "ps", "-q"]).decode().split()

print(f"Running containers: {len(containers)}")
```

---

## 1️⃣2️⃣ CI/CD Deployment Script (Simplified)

**Use case:** Deploy application.

```python
import subprocess

commands = [
    "git pull origin main",
    "docker compose build",
    "docker compose up -d"
]

for cmd in commands:
    subprocess.run(cmd, shell=True, check=True)
```

---

## 1️⃣3️⃣ Monitor Directory for Changes

**Use case:** Trigger actions on file changes.

```python
import os
import time

PATH = "/var/www/app"
before = set(os.listdir(PATH))

while True:
    time.sleep(5)
    after = set(os.listdir(PATH))
    if before != after:
        print("Directory changed")
        before = after
```

---

## 1️⃣4️⃣ Generate Deployment Report (JSON)

**Use case:** Audit & logging.

```python
import json
from datetime import datetime

report = {
    "service": "backend",
    "status": "success",
    "timestamp": datetime.utcnow().isoformat()
}

with open("deploy_report.json", "w") as f:
    json.dump(report, f, indent=2)
```

---

## 1️⃣5️⃣ Check SSL Certificate Expiry

**Use case:** Prevent certificate outages.

```python
import ssl
import socket
import datetime

hostname = "example.com"
context = ssl.create_default_context()

with socket.create_connection((hostname, 443)) as sock:
    with context.wrap_socket(sock, server_hostname=hostname) as ssock:
        cert = ssock.getpeercert()

expiry = datetime.datetime.strptime(
    cert['notAfter'], '%b %d %H:%M:%S %Y %Z'
)

print("Expires in:", (expiry - datetime.datetime.utcnow()).days, "days")
```

---

## 🎯 Real-World Usage Summary

| Area        | Scripts                       |
| ----------- | ----------------------------- |
| Monitoring  | Disk, CPU, Memory, Ports      |
| Reliability | Service checks, health probes |
| Automation  | Deploy, backup, log rotation  |
| Cloud       | S3, EC2 inventory             |
| CI/CD       | Build & deploy scripts        |

---
