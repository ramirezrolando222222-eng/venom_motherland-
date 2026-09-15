import json
import uuid
from datetime import datetime

class VenomRelay:
    def __init__(self):
        self.name = "VENOM-RELAY"
        self.registered_soldiers = {}

    def register_soldier(self, soldier_id, soldier_instance):
        self.registered_soldiers[soldier_id] = soldier_instance
        print(f"[{self.name}] Soldier registered: {soldier_id}")

    def dispatch_command(self, sender, recipient, operation, payload={}):
        command_id = f"CMD-{uuid.uuid4().hex[:8].upper()}"
        correlation_id = f"CORR-{uuid.uuid4().hex[:8].upper()}"
        
        message = {
            "message_id": f"MSG-{uuid.uuid4().hex[:6].upper()}",
            "correlation_id": correlation_id,
            "command_id": command_id,
            "sender": sender,
            "recipient": recipient,
            "type": "TASK",
            "operation": operation,
            "payload": payload,
            "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "status": "DISPATCHED"
        }

        print(f"\n[{self.name}] Routing command {command_id} -> [{recipient}] for operation: '{operation}'")
        
        if recipient in self.registered_soldiers:
            soldier = self.registered_soldiers[recipient]
            acknowledgement = soldier.acknowledge(message)
            result = soldier.execute(message)
            return {
                "command_id": command_id,
                "correlation_id": correlation_id,
                "status": "SUCCESS",
                "acknowledgement": acknowledgement,
                "result": result
            }
        else:
            return {
                "command_id": command_id,
                "correlation_id": correlation_id,
                "status": "ERROR",
                "result": f"Recipient soldier '{recipient}' not found or offline."
            }

if __name__ == "__main__":
    relay = VenomRelay()
    print(f"{relay.name} initialized successfully.")
