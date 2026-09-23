#!/bin/bash
LOG_FILE="$HOME/.identity_armor.log"

while true; do
    # Monitor the primary security daemon process status
    if ! pgrep -f "security_daemon.sh" > /dev/null; then
        echo "[$(date '+%T')] [SYSTEM] Alert: Primary daemon terminated. Re-initializing engine..." >> "$LOG_FILE"
        nohup ~/security_daemon.sh > /dev/null 2>&1 &
    fi
    sleep 10
done
