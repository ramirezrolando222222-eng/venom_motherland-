#!/bin/bash
# Start Ollama server in the background
ollama serve > /dev/null 2>&1 &
echo "Ana is now online."

# Optional: Run the organizer automatically
# python3 ~/organizer.py

