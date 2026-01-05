
# Important Commands

<br>

## 1. Find top 5 largest files in /var/log.

```bash
sudo find /var/log -type f -exec du -h {} + | sort -hr | head -n 5
```

## 2. Write a one-liner to count failed SSH logins.

```bash
sudo grep "Failed password" /var/log/auth.log | wc -l
```

## 3. Check if a service is running; restart if stopped.

```bash
systemctl is-active --quiet <service_name> || systemctl restart <service_name>
```

## 4. Archive and compress files older than 30 days.

```bash
find /path/to/files -type f -mtime +30 -print0 | tar --null -czf old_files_$(date +%F).tar.gz --files-from=-
```

## 5. Find which process is using port 8080.

```bash
sudo lsof -i :8080
```

## 6. Check memory usage and print alert if above threshold.

```bash
free | awk '/Mem:/ {usage=$3/$2*100; if (usage>70) printf "ALERT: Memory usage %.2f%%\n", usage}'
```

## 7. Monitor a directory for file changes.

`sudo apt install inotify-tools`

```bash
inotifywait -m -r -e create,modify,delete,move /path/to/directory
```


