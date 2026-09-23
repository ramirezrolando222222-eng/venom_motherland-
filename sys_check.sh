#!/bin/bash
echo "=== GEMINI AVATAR RESIDENT: SYSTEM HEALTH CHECK ==="

echo -e "\n[*] Checking Python Environment..."
python3 --version
pip list | grep -E "flask|google-api|requests"

echo -e "\n[*] Checking Google Cloud CLI & Auth Status..."
gcloud auth list
gcloud config get-value project 2>/dev/null || echo "No active gcloud project set."

echo -e "\n[*] Checking Active Ports (8080 / 5000)..."
netstat -tuln 2>/dev/null | grep -E "8080|5000" || ss -tuln 2>/dev/null | grep -E "8080|5000" || echo "No active listeners found on target ports."

echo -e "\n[*] Verifying Core Project Files..."
for file in main.py resident_brain.py workspace_bridge.py Dockerfile requirements.txt; do
    if [ -f "$file" ]; then
        echo "  [FOUND] $file"
    else
        echo "  [MISSING] $file"
    fi
done

echo -e "\n=== SYSTEM CHECK COMPLETE ==="
