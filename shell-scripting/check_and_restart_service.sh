#!/bin/bash



SERVICE="apache2"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running."
else
    echo "$SERVICE is not running. Restarting..."
    sudo systemctl restart "$SERVICE"

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE restarted successfully."
    else
        echo "Failed to restart $SERVICE."
    fi
fi


# Direct way to do it in one line:
# systemctl is-active --quiet <service_name> || systemctl restart <service_name>



find /path/to/files -type f -mtime +30 -print0 | tar --null -czf old_files_$(date +%F).tar.gz --files-from=-
