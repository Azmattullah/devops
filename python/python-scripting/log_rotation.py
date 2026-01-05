import os
import time
import shutil

LOG_DIR = "/var/log/myapp"
ARCHIVE_DIR = "/var/log/myapp/archive"
DAYS = 7

os.makedirs(ARCHIVE_DIR, exist_ok=True)
now = time.time()

for file in os.listdir(LOG_DIR):
    file_path = os.path.join(LOG_DIR, file)
    if os.path.isfile(file_path):
        if now - os.path.getmtime(file_path) > DAYS * 86400:
            shutil.move(file_path, os.path.join(ARCHIVE_DIR, file))
