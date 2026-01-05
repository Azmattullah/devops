# ✅ Script: Monitor a Directory for Changes

```bash
#!/bin/bash

DIR="/home/linux711/Desktop/Scripting"

echo "Monitoring directory: $DIR"
echo "Press Ctrl+C to stop."

inotifywait -m -r -e create,modify,delete,move "$DIR"
```

### 🔧 Requirements

You need `inotify-tools` installed:

```bash
sudo apt install inotify-tools     # Debian/Ubuntu
sudo yum install inotify-tools     # CentOS/RHEL
```

### 📝 How it works

* `-m` → monitor continuously
* `-r` → watch subdirectories
* `-e` → specify events:

  * `create` – new file created
  * `modify` – file modified
  * `delete` – file removed
  * `move` – file renamed or moved

### 📌 Example Output

```
/home/linux711/Desktop/Scripting/ CREATE test.txt
/home/linux711/Desktop/Scripting/ MODIFY test.txt
/home/linux711/Desktop/Scripting/ DELETE test.txt
```

### ⭐ Optional: Log changes to a file

```bash
inotifywait -m -r -e create,modify,delete,move "$DIR" >> changes.log
```

If you want:

* email notifications
* auto-backups on change
* real-time alerts with timestamps

I can help you extend this script 👍
