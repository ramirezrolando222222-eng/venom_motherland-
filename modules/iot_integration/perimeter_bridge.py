import json
from datetime import datetime

class IoTPerimeterBridge:
    def __init__(self):
        self.mandate = "Nothing is Free"
        self.gateway_status = "Connected to Smart-Environment Mesh"
        self.endpoints = ["Google Home Hub", "Perimeter Optical Sensor", "Biometric Access Gate"]

    def scan_perimeter(self):
        print("==================================================")
        print(" VENOM FRAMEWORK 6.0: IOT PERIMETER BRIDGE ")
        print("==================================================")
        print(f" Gateway Status : {self.gateway_status}")
        print(f" Active Nodes   : {', '.join(self.endpoints)}")
        print(f" Security State : SECURE / LOCKDOWN ACTIVE ({self.mandate})")
        print(f" Scan Timestamp : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print("==================================================")
        return True

if __name__ == "__main__":
    bridge = IoTPerimeterBridge()
    bridge.scan_perimeter()
