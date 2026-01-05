#!/bin/bash

DIR="/home/linux711/Desktop/Scripting"

echo "Monitoring directory: $DIR"
echo "Press Ctrl+C to stop."

inotifywait -m -r -e create,modify,delete,move "$DIR"