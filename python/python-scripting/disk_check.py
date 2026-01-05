# Write a Python script to check disk usage and alert if usage > 80%.

import shutil

THRESHOLD = 80  # percentage
PATH = "/"

def check_disk_usage(path):
    total, used, free = shutil.disk_usage(path)
    usage_percent = (used / total) * 100
    return usage_percent

usage = check_disk_usage(PATH)

if usage >= THRESHOLD:
    print(f"ALERT: Disk usage is high: {usage:.2f}%")
else:
    print(f"OK: Disk usage is normal: {usage:.2f}%")
