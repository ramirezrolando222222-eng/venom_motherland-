#!/bin/bash
echo "=================================================="
echo "   MOTHERLAND CLI TOOL NAVIGATION SUITE"
echo "=================================================="

# Create an interactive Python-based CLI Navigation Assistant
cat << 'NAV_PY' > nav_tool.py
import os
import json
import sys

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def show_menu():
    clear_screen()
    print("==========================================")
    print("      MOTHERLAND NAVIGATOR v1.0           ")
    print("==========================================")
    print(" [1] View Current Workspace & Vaults")
    print(" [2] Inspect Node Config (motherland_master_status.json)")
    print(" [3] Jump to Shared Storage (~/storage/shared)")
    print(" [4] Run System Integrity Diagnostic")
    print(" [5] Exit Navigator")
    print("==========================================")

def main():
    while True:
        show_menu()
        choice = input("\n[+] Select Navigation Index (1-5): ").strip()
        
        if choice == '1':
            clear_screen()
            print("=== LOCAL DIRECTORY CONTENTS ===")
            for item in os.listdir('.'):
                print(f" - {item}")
            input("\nPress Enter to return...")
            
        elif choice == '2':
            clear_screen()
            print("=== NODE CONFIGURATION INSPECTION ===")
            try:
                with open('motherland_master_status.json', 'r') as f:
                    data = json.load(f)
                print(json.dumps(data, indent=4))
            except FileNotFoundError:
                print("[!] Error: 'motherland_master_status.json' not found. Run master upgrade first.")
            input("\nPress Enter to return...")
            
        elif choice == '3':
            clear_screen()
            target_dir = os.path.expanduser('~/storage/shared')
            if os.path.exists(target_dir):
                print(f"[+] Navigating to Shared Storage: {target_dir}")
                print("Contents sample:")
                try:
                    print(os.listdir(target_dir)[:10])
                except Exception as e:
                    print(f"[!] Access restriction or empty: {e}")
            else:
                print("[!] Shared storage link not found. Run 'termux-setup-storage' first.")
            input("\nPress Enter to return...")
            
        elif choice == '4':
            clear_screen()
            print("=== SYSTEM INTEGRITY CHECK ===")
            print("Node: HOU_NODE_01 -> ONLINE")
            print("Override Code: 1985 -> SECURED")
            print("Target Channel: @Rolando-Diablocholo -> SYNCHRONIZED")
            input("\nPress Enter to return...")
            
        elif choice == '5':
            print("\n[+] Exiting Motherland Navigator. Stay tuned to the stars.")
            sys.exit(0)
        else:
            input("\n[!] Invalid selection. Press Enter to retry...")

if __name__ == '__main__':
    main()
NAV_PY

chmod +x nav_tool.py
echo "[+] CLI Navigation Tool built successfully -> 'nav_tool.py'"
echo "=================================================="
