import os
import hashlib

class SeekJr:
    def __init__(self):
        self.soldier_id = "SEEK-JR"
        self.role = "Reconnaissance & File Integrity Auditor"

    def acknowledge(self, message):
        msg_id = message.get("command_id")
        print(f"[{self.soldier_id}] Message received ({msg_id}). Acknowledging: 'Executing task, Boss.'")
        return "Message received, Boss. Executing task."

    def execute(self, message):
        operation = message.get("operation")
        payload = message.get("payload", {})
        
        if operation == "inventory":
            target_dir = payload.get("path", "venom_framework")
            print(f"[{self.soldier_id}] Scanning directory tree: {target_dir}")
            inventory = []
            file_count = 0
            
            if os.path.exists(target_dir):
                for root, dirs, files in os.walk(target_dir):
                    for file in files:
                        full_path = os.path.join(root, file)
                        file_count += 1
                        inventory.append(full_path)
            
            return {
                "status": "COMPLETED",
                "files_scanned": file_count,
                "inventory_sample": inventory[:10]
            }
        else:
            return {
                "status": "UNKNOWN_OPERATION",
                "details": f"Operation '{operation}' not supported by {self.soldier_id}."
            }

if __name__ == "__main__":
    soldier = SeekJr()
    print(f"{soldier.soldier_id} ({soldier.role}) ready.")
