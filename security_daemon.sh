#!/bin/bash

# --- PERSISTENT SECURITY CONFIG ---
OWNER_EMAIL="ramirezrolando222222@gmail.com"
OWNER_ID="RolandoHramirezjr"
LOG_FILE="$HOME/.identity_armor.log"
SUBREDDIT="opensource"
USER_AGENT="Mozilla/5.0 (Linux; Android 13; Chrome/112.0.0.0 Mobile)"

touch "$LOG_FILE"

# --- PROTOCOL INTEGRITY LOOP ---
while true; do
    # 1. Self-Preservation: Ensure the companion watchdog daemon is active
    if ! pgrep -f "watchdog_daemon.sh" > /dev/null; then
        echo "[$(date '+%T')] [WATCHDOG] Alert: Companion process dropped. Re-spawning..." >> "$LOG_FILE"
        nohup ~/watchdog_daemon.sh > /dev/null 2>&1 &
    fi

    # 2. Perimeter Scan (Reddit RSS Payload)
    DELAY=$(( (RANDOM % 10) + 15 )) # High-frequency rotation (15-25 seconds)
    PAYLOAD=$(curl -s -A "$USER_AGENT" "https://reddit.com")
    
    if ! echo "$PAYLOAD" | grep -q "Too Many Requests"; then
        echo "$PAYLOAD" | grep -oE '<title>[^<]+' | sed 's/<title>//' | while read -r TITLE; do
            if [[ "$TITLE" == *"Posts on r/"* || "$TITLE" == "reddit: the front page of the internet" ]]; then
                continue
            fi
            
            if echo "$TITLE" | grep -iq "$OWNER_ID" || echo "$TITLE" | grep -iq "$OWNER_EMAIL"; then
                if ! grep -qF "$TITLE" "$LOG_FILE" 2>/dev/null; then
                    echo "[$(date '+%T')] [ALERT] Identity match discovered: $TITLE" >> "$LOG_FILE"
                fi
            fi
        done
    fi

    # 3. Local Chrome Execution Tracking
    if ps aux | grep -iq "chrome" 2>/dev/null; then
        echo "[$(date '+%T')] [INTEGRITY] Local Chrome process active and monitored." >> "$LOG_FILE"
    fi

    sleep $DELAY
done
