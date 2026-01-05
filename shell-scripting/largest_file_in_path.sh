#!/bin/bash

echo "Finding the largest files in the specified directory..."

DIR="/home/linux711/Desktop/Scripting/shell-scripting"

sudo find "$DIR" -type f -exec du -h {} + | sort -hr | head -n 5



