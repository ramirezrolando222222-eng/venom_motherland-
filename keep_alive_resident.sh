#!/bin/bash
echo "=================================================="
echo " 🛡️ INITIALIZING PERSISTENT RESIDENT KEEPALIVE 🛡️"
echo "=================================================="

# Ensure termux wake lock is requested if available
if command -v termux-wake-lock &> /dev/null; then
    termux-wake-lock
    echo "[+] Termux wake lock acquired."
fi

# Start ollama if not running
if ! pgrep -x "ollama" > /dev/null; then
    echo "[+] Starting Ollama background engine..."
    ollama serve &
    sleep 3
else
    echo "[+] Ollama engine already active."
fi

echo "[+] Launching direct resident chat portal..."
python3 direct_resident_chat.py
