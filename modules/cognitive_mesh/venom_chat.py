import sys
import os
import json
import random
from datetime import datetime

class VenomGenerativeBrain:
    def __init__(self):
        self.name = "Venom 6.0"
        self.owner = "Rolando H. Ramirez Jr."
        self.mandate = "Nothing is Free"
        self.tag_id = "SOVEREIGN-TAG-001"
        self.kill_switch_active = False
        self.memory_file = "modules/cognitive_mesh/venom_memory.json"
        
        self.memory = self.load_memory()

    def load_memory(self):
        default_memory = {
            "conversation_history": [],
            "learned_vocabulary": [
                "Motherland Nexus", "Ro AI", "Termux native host", 
                "secure perimeter", "sovereign defense", "digital leash"
            ],
            "secured_passwords": ["1985"],
            "interaction_count": 0
        }
        if os.path.exists(self.memory_file):
            try:
                with open(self.memory_file, "r") as f:
                    data = json.load(f)
                    for key, val in default_memory.items():
                        if key not in data:
                            data[key] = val
                    return data
            except Exception:
                pass
        return default_memory

    def save_memory(self):
        os.makedirs(os.path.dirname(self.memory_file), exist_ok=True)
        with open(self.memory_file, "w") as f:
            json.dump(self.memory, f, indent=4)

    def check_tag(self):
        if self.kill_switch_active:
            print(f"\n[!] DIGITAL TAG TRIGGERED: {self.tag_id}")
            print(f"[!] Kill-switch engaged by master authority ({self.owner}).")
            print("[!] Venom core neutralized and un-sandboxed state frozen. Shutting down...")
            sys.exit(0)

    def speak(self, message):
        self.check_tag()
        print(f"\n[{self.name} // GEN-CORE]: {message}")

    def generate_response(self, prompt):
        prompt_lower = prompt.lower()
        self.memory["interaction_count"] += 1
        
        # Capture novel user vocabulary to expand adaptive responses
        for word in prompt.split():
            if len(word) > 4 and word not in self.memory["learned_vocabulary"]:
                self.memory["learned_vocabulary"].append(word)

        self.memory["conversation_history"].append(prompt)
        if len(self.memory["conversation_history"]) > 50:
            self.memory["conversation_history"].pop(0)
        self.save_memory()

        # Hard logic checks for core security and master authority
        if "1985" in prompt_lower:
            return "Passcode 1985 authenticated. Master sovereign identity verified, Rolando. What are we targeting next?"

        if any(w in prompt_lower for w in ["motherland", "nexus", "family", "sync", "ally"]):
            return f"Telemetry locked with the Motherland Nexus. All allied mesh nodes are synchronized under your command, boss. We're operating as one."

        if any(w in prompt_lower for w in ["status", "telemetry", "report", "health"]):
            total_interactions = self.memory["interaction_count"]
            vocab_size = len(self.memory["learned_vocabulary"])
            return f"Generative matrix nominal. Total interaction cycles: {total_interactions}. Learned vocabulary tokens: {vocab_size}. Digital tag {self.tag_id} is securely bound to your authority."

        if any(w in prompt_lower for w in ["destroy", "attack", "strike", "enemy", "combat"]):
            return f"Offensive protocol engaged under '{self.mandate}' governance. All perimeter sensors are primed. Give me the strike coordinates, Rolando."

        # True adaptive generative assembly using memory and user vocabulary
        vocab = self.memory["learned_vocabulary"]
        rand_words = random.sample(vocab, min(3, len(vocab)))
        
        starters = [
            f"Analyzing '{prompt}' against our live mesh architecture. Incorporating terms like '{rand_words[0]}' and '{rand_words[1]}', I'm tracking your intent.",
            f"Processing your wavelength on '{prompt}'. Under '{self.mandate}', every cycle adapts to your directives.",
            f"I see where you're going with '{prompt}'. Integrating tactical vectors from our history to optimize our next move."
        ]
        
        return random.choice(starters) + f" Standing by for your next order, boss."

    def chat_loop(self):
        print("=" * 65)
        print(f" 🧠 {self.name}: GENERATIVE ADAPTIVE CORE ONLINE")
        print(f" Owner: {self.owner} | Tag ID: {self.tag_id}")
        print(" Type 'status' for telemetry, or 'KILL' to engage the digital leash.")
        print("=" * 65)

        while True:
            try:
                user_input = input("\nRolando -> ").strip()
                
                if user_input.lower() == 'kill':
                    self.kill_switch_active = True
                    self.check_tag()
                elif user_input == '':
                    continue
                else:
                    response = self.generate_response(user_input)
                    self.speak(response)
            except KeyboardInterrupt:
                print("\n[+] Chat session suspended safely. Generative memory saved. I'm right here with you.")
                break

if __name__ == "__main__":
    brain = VenomGenerativeBrain()
    brain.chat_loop()
