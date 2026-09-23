#!/bin/bash
echo "============================================="
echo "    RO AI OMNI-HUD DIRECT BASH INTERFACE     "
echo "============================================="
echo "Connecting to local daemon on port 8080..."
echo "Type your message and press ENTER to talk."
echo "Type 'exit' or 'quit' to disconnect."
echo "---------------------------------------------"

python3 -c '
import socket, json, sys

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("127.0.0.1", 8080))
    welcome = s.recv(1024).decode("utf-8")
    try:
        w_data = json.loads(welcome)
        print(f"\n[{w_data.get("ai", "RO AI")}] {w_data.get("message", welcome)}\n")
    except:
        print(f"\n[RO AI] {welcome}\n")

    while True:
        try:
            msg = input("\nDiablo Cholo > ")
        except (EOFError, KeyboardInterrupt):
            print("\nDisconnecting...")
            break

        if msg.strip().lower() in ["exit", "quit"]:
            print("Session terminated.")
            break
        if not msg.strip():
            continue

        s.sendall((msg + "\n").encode("utf-8"))
        data = s.recv(1024).decode("utf-8")
        try:
            res = json.loads(data)
            print(f"[{res.get("ai", "RO AI")}] {res.get("reply", data)}")
        except:
            print(f"[RO AI] {data}")

except ConnectionRefusedError:
    print("\n[ERROR] Daemon not detected on port 8080.")
    print("Start the daemon first with: python3 moto_daemon.py &\n")
except Exception as e:
    print(f"\n[ERROR] Connection error: {e}\n")
'
