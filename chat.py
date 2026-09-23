<<<<<<< HEAD
import os
import sys
import time

from core.brain import VenomBrain


def print_stream(text):
    for word in text.split(" "):
        sys.stdout.write(word + " ")
        sys.stdout.flush()
        time.sleep(0.015)
    print("\n")


def run_rox_terminal():
    os.system("clear")

    venom = VenomBrain()

    print("\033[1;35m==============================================")
    print(" 🔮 ROX TERMINAL // VENOM BRAIN CONNECTED 🔮 ")
    print("==============================================")
    print(" • INTERFACE : ROX")
    print(" • CORE      : VENOM")
    print(" • MODE      : LOCAL")
    print(" • WORKSPACE : " + str(venom.workspace))
    print("==============================================")
    print(" Venom intelligence layer online.")
    print(" Type 'help' for commands or 'exit' to terminate.")
    print("==============================================\033[0m\n")

    while True:
        try:
            user_input = input("\033[1;33mYou > \033[0m").strip()

            if not user_input:
                continue

            command = user_input.lower()

            if command in {"exit", "quit"}:
                print(
                    "\033[1;31m\n[TERMINATE] "
                    "ROX interface disconnected. Venom core remains offline-safe.\033[0m"
                )
                break

            if command == "clear":
                os.system("clear")
                continue

            if command == "help":
                print(
                    "\n\033[1;36mVENOM CAPABILITIES\033[0m\n"
                    "  who are you\n"
                    "  status\n"
                    "  scan files\n"
                    "  list files\n"
                    "  where am i\n"
                    "  clear\n"
                    "  exit\n"
                )
                continue

            print(
                "\n\033[1;34m[VENOM] "
                "Processing through local intelligence layer...\033[0m"
            )
            print("\033[1;32mVenom > \033[0m", end="", flush=True)

            response = venom.handle(user_input)
            print_stream(response)

            print(
                "\033[1;35m"
                "──────────────────────────────────────────────"
                "\033[0m"
            )

        except KeyboardInterrupt:
            print("\n\033[1;31m[INTERRUPT] ROX interface stopped safely.\033[0m")
            break

        except Exception as exc:
            print(
                f"\n\033[1;31m[VENOM ERROR] {exc}\033[0m\n"
            )


if __name__ == "__main__":
    run_rox_terminal()
=======
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
>>>>>>> 4e34f3a5cc4b1cc56d23268f8a022583686206e9
