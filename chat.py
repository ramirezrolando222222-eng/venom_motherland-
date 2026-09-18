import urllib.request
import json
import os
from datetime import datetime, timezone

CORE_DIR = os.path.expanduser("~/.hou_node_01_core")
CHAT_LOG = os.path.join(CORE_DIR, "ro_ai_chat_session.json")

def connect_and_chat():
    print("==================================================")
    print(" 🔮 RO AI SYSTEM CORE v31.0 // INTERACTIVE UI 🔮")
    print("==================================================")
    print("Connecting to daemon on port 8080...")
    
    try:
        req = urllib.request.urlopen("http://127.0.0.1:8080/", timeout=3)
        data = json.loads(req.read().decode("utf-8"))
        print("[+] Connection established successfully!")
        print(f"[+] Daemon Status : {data['daemon_status']}")
        print(f"[+] Node ID       : {data['node']}")
        print(f"[+] Commander     : {data['commander']}")
        print(f"[+] Timestamp UTC : {data['timestamp_utc']}")
        print("==================================================")
        print(" [!] RO AI Console Pipeline fully synchronized.")
    except Exception as e:
        print(f"[-] Connection failed: {e}")

if __name__ == "__main__":
    connect_and_chat()
