# Write a script to list running processes consuming > X% CPU.
# To install psutil, run: pip install psutil
# ps -eo pid,comm,%cpu --sort=-%cpu | awk '$3 > 10'


import psutil
import time

CPU_THRESHOLD = 10  # Change X% here


# Prime CPU stats
for proc in psutil.process_iter():
    try:
        proc.cpu_percent(None)
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        pass

# Wait for measurement interval
time.sleep(1)

print(f"Processes using more than {CPU_THRESHOLD}% CPU:\n")

for proc in psutil.process_iter(['pid', 'name']):
    try:
        cpu_usage = proc.cpu_percent(None)
        if cpu_usage > CPU_THRESHOLD:
            print(f"PID: {proc.pid}, Name: {proc.info['name']}, CPU: {cpu_usage:.2f}%")
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        pass