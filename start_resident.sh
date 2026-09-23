#!/bin/bash
# Stop any lingering processes
pkill -f ollama
pkill -f main.py

# Launch Ollama in the background
nohup ollama serve > ollama.log 2>&1 &
echo "Ollama Engine started..."

# Wait for the engine to initialize
sleep 5

# Launch the Resident in a tmux session
tmux new-session -d -s resident 'python3 ~/GeminiAvatarResident/main.py'
echo "Resident HUD is live in tmux session 'resident'"
