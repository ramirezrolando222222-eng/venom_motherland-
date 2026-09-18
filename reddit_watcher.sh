#!/bin/bash

# --- BACKGROUND DAEMON CONFIG ---
SUBREDDIT="opensource"
KEYWORD="code"
LOG_FILE="$HOME/.reddit_matches.log"
USER_AGENT="Mozilla/5.0 (Android; Mobile; rv:120.0) Gecko/120.0 Firefox/120.0"

# Main execution loop optimized for absolute silence
while true; do
    DELAY=$(( (RANDOM % 15) + 30 )) # Highly aggressive yet variable jitter spacing (30-45s)
    PAYLOAD=$(curl -s -A "$USER_AGENT" "https://reddit.com")
    
    if echo "$PAYLOAD" | grep -q "Too Many Requests"; then
        echo "[$(date '+%F %T')] [LIMIT] Hit 429 wall. Throttling 10m." >> "$LOG_FILE"
        sleep 600
        continue
    fi

    echo "$PAYLOAD" | grep -oE '<title>[^<]+' | sed 's/<title>//' | while read -r TITLE; do
        if [[ "$TITLE" == *"Posts on r/"* || "$TITLE" == "reddit: the front page of the internet" ]]; then
            continue
        fi
        
        if echo "$TITLE" | grep -iq "$KEYWORD"; then
            # Verify if match was already logged to prevent duplicates
            if ! grep -qF "$TITLE" "$LOG_FILE" 2>/dev/null; then
                echo "[$(date '+%T')] [MATCH] r/$SUBREDDIT | $TITLE" >> "$LOG_FILE"
            fi
        fi
    done

    sleep $DELAY
done
