import sys
import os
import json

# Add current directory and parent directory to python path
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, current_dir)
sys.path.append(os.path.abspath(os.path.join(current_dir, '../soldiers')))

from venom_relay import VenomRelay
from seek_jr import SeekJr

if __name__ == "__main__":
    print("=== INITIALIZING VENOM RELAY & SOLDIER NETWORK TEST ===")
    relay = VenomRelay()
    seek_soldier = SeekJr()
    
    # Register SEEK-JR with the Relay
    relay.register_soldier("SEEK-JR", seek_soldier)
    
    # Dispatch an inventory command through the Relay
    response = relay.dispatch_command(
        sender="VENOM-CORE",
        recipient="SEEK-JR",
        operation="inventory",
        payload={"path": "."}
    )
    
    print("\n=== RELAY DISPATCH RESULT ===")
    print(json.dumps(response, indent=4))
