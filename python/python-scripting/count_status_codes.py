# Parse a log file and count HTTP status codes.

from collections import Counter

log_file = "access.log"
status_counts = Counter()

with open(log_file, "r") as file:
    for line in file:
        parts = line.split()
        if len(parts) > 8:
            status_code = parts[-2]
            if status_code.isdigit():
                status_counts[status_code] += 1

for code, count in status_counts.items():
    print(f"HTTP {code}: {count}")
