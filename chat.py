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
