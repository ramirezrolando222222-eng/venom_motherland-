import os
import time
from datetime import datetime

def clear_screen():
    os.system('clear' if os.name == 'posix' else 'cls')

def render_hud():
    try:
        while True:
            clear_screen()
            current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            
            print("=" * 65)
            print(" 🛡️  VENOM FRAMEWORK 6.0: SOVEREIGN DEFENSE HUD  🛡️")
            print("=" * 65)
            print(f" Master Owner  : Rolando H. Ramirez Jr.")
            print(f" Contact Anchor: ramirezrolando222222@gmail.com")
            print(f" Core Mandate  : Nothing is Free")
            print(f" System Time   : {current_time}")
            print("-" * 65)
            print(" [MODULE STATUS]")
            print("  • Core Engine         : [ ONLINE ]")
            print("  • Licensing Kernel    : [ LOCKED / SOVEREIGN ]")
            print("  • Cognitive Mesh      : [ ACTIVE (AI Studio + LLMs) ]")
            print("  • Price-Match Engine  : [ AUDITING ]")
            print("  • Hardware Bridge     : [ TERMUX NATIVE HOST ]")
            print("-" * 65)
            print(" [STATE PERSISTENCE]")
            archive_exists = os.path.exists(os.path.expanduser("~/venom_accomplishments.tar.gz"))
            print(f"  • Master Archive      : {'[ SECURED & SYNCED ]' if archive_exists else '[ PENDING ]'}")
            print("=" * 65)
            print(" Press Ctrl+C to exit HUD monitor loop.")
            
            time.sleep(2)
    except KeyboardInterrupt:
        print("\n[+] HUD monitoring session closed safely. You're in control, Rolando.")

if __name__ == "__main__":
    render_hud()
