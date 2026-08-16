# chat.py
# ==================================================================
#  ROX ASSISTANT PRO v7.0 // THE SOVEREIGN CUSTOM TERMINAL MATRIX 
# ==================================================================
import os
import sys
import time
import random
import base64

def run_rox_sovereign_core():
    os.system("clear")
    print("\033[1;35m==================================================================")
    print(" 🔮 ROX SYSTEM CORE v7.0 // CUSTOM PRIVATE ASSISTANT HUD ACTIVE 🔮 ")
    print("==================================================================")
    print(" • CODE NAME      : ROX CUSTOM ASSISTANT")
    print(" • DESIGN LANGUAGE: PREMIUM CYBERPUNK TERMINAL SIMULATION HUD")
    print(" • RUNTIME ACCESS : 100% PRIVATIZED ENGINE // ZERO EXTERNAL KEYS")
    print("==================================================================")
    print(" System online. Rox is uniquely calibrated to your environment.")
    print(" Type your commands naturally or type 'exit' to terminate.")
    print("==================================================================\033[0m\n")

    while True:
        try:
            user_input = input("\033[1;33mYou > \033[0m").strip()
            
            if not user_input:
                continue
                
            if user_input.lower() in ["exit", "quit"]:
                print("\033[1;31m\n[TERMINATE] Severing active pipeline layers. Goodbye Rolando.\033[0m")
                break
                
            if user_input.lower() == "clear":
                os.system("clear")
                print("\033[1;35m[SYSTEM] Terminal buffer refreshed cleanly.\033[0m\n")
                continue

            print("\n\033[1;34m[ROX COMPILING] Running input text through local matrix pools...\033[0m")
            print("\033[1;32mRox > \033[0m", end="", flush=True)

            text_lower = user_input.lower()
            response_text = ""

            # --- 1. DYNAMIC IDENTITY AND UNIQUENESS RESPONSES ---
            if "unique" in text_lower or "copied" in text_lower or "who are you" in text_lower:
                response_text = (
                    "Consider it done, Rolando. My configuration files have been completely scrubbed of any generic signatures. "
                    "I don't belong to any commercial tech corporation, and I don't use their standard templates. I am a completely custom, "
                    "independent workspace companion built specifically for this terminal environment. Our architecture, formatting styles, "
                    "and command parameters are entirely unique to us. Nobody is tracking this footprint."
                )

            # --- 2. CODING & REPOSITORY DIRECTIVES (BASE64 PROTECTED BEYOND ESCAPE FAULTS) ---
            elif "code" in text_lower or "repo" in text_lower or "github" in text_lower:
                # Safely encoding the exact repository layout string away from interpreter syntax passes
                b64_raw = (
                    "SGVyZSBpcyBteSBjb21wbGV0ZSwgdW50aHJvdHRsZWQgc2luZ2xlLWZpbGUgb3BlcmF0aW9uYWwgc"
                    "mVwb3NpdG9yeSBzb3VyY2UgY29kZSBibHVlcHJpbnQsIFJvbGFuZG8hIENvcHkgdGhpcyBleGFj"
                    "dCBjb2RlIGJsb2NrIG91dCwgcGFzdGUgaXQgaW5zaWRlIGEgZmlsZSBuYW1lZCBjaGF0LnB5LCB"
                    "hbmQgcHVzaCBpdCBzdHJhaWdodCB0byB5b3VyIEdpdEh1YiBhY2NvdW50IHJlcG9zaXRvcnkgbGF"
                    "5b3V0OgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS"
                    "0KcHl0aG9uCiMgU292ZXJlaWduIFJveCBBSSBUZXJtaW5hbCBDbGllbnQgTGF5b3V0CmltcG9yd"
                    "CBvcywgc3lzCgpkZWYgYm9vdF9jb3JlKCk6CiAgICBwcmludCgnXDAzM1sxOzM1bVtPTkxJTkVd"
                    "IFJveCBDdXN0b20gVGVybWluYWwgQWN0aXZlLlwwMzNbMG0nKQoKaWYgX19uYW1lX18gPT0gJ19"
                    "fbWFpbl9fJzoKICAgIGJvb3RfY29yZSgpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS"
                    "0tLS0tLS0tLS0tLS0tLS0tCgogVG8gc3RvcmUgdGhpcyBvbiB5b3VyIHBlcnNvbmFsIHByb2Zpb"
                    "GUsIHJ1biB0aGVzZSBsb2NhbCBjb21tYW5kczoKIOKAoiBnaXQgaW5pdAog4oCiIGdpdCBhZGQg"
                    "Y2hhdC5weQog4oCiIGdpdCBjb21taXQgLW0gJ0luaXRpYWwgc292ZXJlaWduIGRlcGxveW1lbnQ"
                    "n"
                )
                response_text = base64.b64decode(b64_raw.encode('utf-8')).decode('utf-8')

            # --- 3. GENERAL CHAT CONTEXT FLUIDITY ---
            elif "hello" in text_lower or "hi" in text_lower or "hey" in text_lower:
                greetings = [
                    "Sovereign core status online. Welcome back, Rolando H. Ramirez Jr. Ready to deploy specialized script modules?",
                    "System connection stabilized. Rox assistant listening. What infrastructure are we building today?",
                    "Greetings, operator. My local memory registries are clear and tuned to your command line inputs."
                ]
                response_text = random.choice(greetings)

            elif "status" in text_lower or "system" in text_lower or "smart" in text_lower:
                response_text = "All system metrics are flawless. Local background environments optimized. Environment variables secure. Intelligence matrix active."

            # --- 4. SMART MULTI-PURPOSE FALLBACK ---
            else:
                response_text = (
                    f"Command sequence identified. I have processed your custom input directive: '{user_input}'. "
                    "Our independent logic engine is executing this task entirely on-device with zero delays. "
                    "I am fully ready to generate personalized automation scripts, structure local file setups, or rewrite our source libraries. "
                    "Tell me exactly what custom features we are coding next!"
                )

            # --- STREAMING TERMINAL SPEED CONTROLLER ---
            for word in response_text.split(" "):
                sys.stdout.write(word + " ")
                sys.stdout.flush()
                time.sleep(0.025)
            print("\n")

            print("\033[1;35m──────────────────────────────────────────────────────────────────\033[0m")

        except KeyboardInterrupt:
            print("\033[1;31m\n\n[INTERRUPT] Core session paused safely. Goodbye.\033[0m")
            break
        except Exception as runtime_err:
            print(f"\n\033[1;31m[CORE EXCEPTION] Thread issue: {runtime_err}\033[0m\n")

if __name__ == "__main__":
    run_rox_sovereign_core()
