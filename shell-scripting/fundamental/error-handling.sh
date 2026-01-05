#!/bin/bash

ls /nonexit-directory
if [ $? -eq 0 ]; then
    echo "Directory Exit"
else
    echo "Directory does not exit"
fi

# ----- Error Messages -----
file="nonexistent-file.txt"
if [ ! -f "$file" ]; then
echo "Error: File '$file' does not exist."
exit 1
fi
echo "File '$file' exists."