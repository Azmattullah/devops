Below is a **practical, DevOps-focused list of Python methods and modules** that are **most commonly used in automation, system administration, CI/CD, cloud operations, and monitoring**. Examples are concise and production-oriented.

---

## 🖥️ System & OS Automation (`os`, `sys`, `pathlib`)

### 1. `os.system()`

Run shell commands.

```python
import os
os.system("df -h")
```

---

### 2. `os.popen()`

Capture command output.

```python
os.popen("uptime").read()
```

---

### 3. `os.getenv()`

Read environment variables.

```python
os.getenv("HOME")
```

---

### 4. `os.listdir()`

List directory contents.

```python
os.listdir("/var/log")
```

---

### 5. `os.makedirs()`

Create directories recursively.

```python
os.makedirs("/tmp/app/logs", exist_ok=True)
```

---

### 6. `pathlib.Path.exists()`

Check file existence.

```python
from pathlib import Path
Path("/etc/passwd").exists()
```

---

## ⚙️ Process & Command Execution (`subprocess`)

### 7. `subprocess.run()`

Run commands safely (recommended).

```python
import subprocess
subprocess.run(["docker", "ps"], check=True)
```

---

### 8. `subprocess.Popen()`

Long-running/background processes.

```python
subprocess.Popen(["tail", "-f", "/var/log/syslog"])
```

---

### 9. `subprocess.check_output()`

Get command output.

```python
subprocess.check_output(["hostname"]).decode()
```

---

## 📂 Files, Logs & Archives (`shutil`, `glob`, `zipfile`)

### 10. `shutil.copy()`

Copy files.

```python
import shutil
shutil.copy("app.log", "/backup/")
```

---

### 11. `shutil.move()`

Move or rename files.

```python
shutil.move("old.log", "archive.log")
```

---

### 12. `glob.glob()`

Pattern-based file search.

```python
import glob
glob.glob("/var/log/*.log")
```

---

### 13. `zipfile.ZipFile()`

Compress files.

```python
import zipfile
with zipfile.ZipFile("logs.zip", "w") as z:
    z.write("app.log")
```

---

## ⏱️ Scheduling & Timing (`time`, `datetime`)

### 14. `time.sleep()`

Pause execution.

```python
import time
time.sleep(5)
```

---

### 15. `datetime.now()`

Timestamps.

```python
from datetime import datetime
datetime.now()
```

---

## 🌐 Networking & APIs (`requests`, `socket`)

### 16. `requests.get()`

Health checks / API calls.

```python
import requests
requests.get("https://example.com").status_code
```

---

### 17. `socket.gethostbyname()`

DNS resolution.

```python
import socket
socket.gethostbyname("google.com")
```

---

## 📊 Monitoring & Metrics (`psutil`)

### 18. `psutil.cpu_percent()`

CPU usage.

```python
import psutil
psutil.cpu_percent(interval=1)
```

---

### 19. `psutil.disk_usage()`

Disk usage.

```python
psutil.disk_usage("/")
```

---

### 20. `psutil.process_iter()`

Process inspection.

```python
for p in psutil.process_iter(['pid', 'name']):
    print(p.info)
```

---

## ☁️ Cloud & Configuration (`json`, `yaml`, `boto3`)

### 21. `json.load()`

Read JSON config.

```python
import json
json.load(open("config.json"))
```

---

### 22. `yaml.safe_load()`

Read YAML (Ansible/K8s).

```python
import yaml
yaml.safe_load(open("deploy.yml"))
```

---

### 23. `boto3.client()`

AWS automation.

```python
import boto3
s3 = boto3.client("s3")
s3.list_buckets()
```

---

## 🔐 Security & Secrets (`base64`, `hashlib`)

### 24. `base64.b64encode()`

Encode secrets.

```python
import base64
base64.b64encode(b"secret")
```

---

### 25. `hashlib.sha256()`

Hashing.

```python
import hashlib
hashlib.sha256(b"password").hexdigest()
```

---

## 🚀 CI/CD Utilities

### 26. `argparse.ArgumentParser()`

CLI tools.

```python
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--env")
args = parser.parse_args()
```

---

### 27. `logging.basicConfig()`

Structured logs.

```python
import logging
logging.basicConfig(level=logging.INFO)
logging.info("Deploy started")
```

---

## 🎯 DevOps Summary (Must-Know)

| Category     | Core Methods                     |
| ------------ | -------------------------------- |
| Command Exec | `subprocess.run`, `check_output` |
| File Ops     | `shutil`, `glob`, `zipfile`      |
| Monitoring   | `psutil.*`                       |
| Cloud        | `boto3`, `yaml`, `json`          |
| CI/CD        | `argparse`, `logging`            |

---
