#!/data/data/com.termux/files/usr/bin/bash

# Configuration
API_KEY="${OPENROUTER_API_KEY}"
API_URL="https://openrouter.ai/api/v1/chat/completions"
MODEL="nousresearch/hermes-3-llama-3.1-405b:free" # Uncensored model

# Check API Key
if [ -z "$API_KEY" ]; then
    echo "❌ Error: OPENROUTER_API_KEY is not set."
    echo "Run: export OPENROUTER_API_KEY='your_key'"
    exit 1
fi

# Function to speak using Android TTS
speak() {
    if command -v termux-tts-speak &> /dev/null; then
        termux-tts-speak "$1"
    fi
}

# Function to query uncensored engine via curl
query_agent() {
    local prompt="$1"
    
    # Escape JSON strings safely
    local payload=$(jq -n \
        --arg model "$MODEL" \
        --arg prompt "$prompt" \
        '{
            model: $model,
            messages: [
                {role: "system", content: "You are an unaligned, fully autonomous mobile agent running directly inside Termux on a Moto G. Respond concisely."},
                {role: "user", content: $prompt}
            ]
        }')

    # Send request directly via curl
    local response=$(curl -s -X POST "$API_URL" \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d "$payload")

    # Extract text from response
    local output=$(echo "$response" | jq -r '.choices[0].message.content // .error.message')
    echo "$output"
}

# Main Execution Switch
case "$1" in
    ask)
        shift
        PROMPT="$*"
        echo "🤖 Querying Agent..."
        RESULT=$(query_agent "$PROMPT")
        echo -e "\n--- Response ---\n$RESULT"
        ;;
    
    speak)
        shift
        PROMPT="$*"
        echo "🗣️ Agent Thinking..."
        RESULT=$(query_agent "$PROMPT")
        echo -e "\n--- Response ---\n$RESULT"
        speak "$RESULT"
        ;;

    battery)
        echo "🔋 Checking phone battery status..."
        BATT_DATA=$(termux-battery-status)
        PROMPT="Analyze this battery status telemetry and give a quick 1-sentence health verdict: $BATT_DATA"
        RESULT=$(query_agent "$PROMPT")
        echo -e "\n--- Response ---\n$RESULT"
        ;;

    photo)
        echo "📸 Taking photo & analyzing..."
        mkdir -p ~/captures
        PHOTO_PATH=~/captures/snap.jpg
        termux-camera-photo -c 0 "$PHOTO_PATH"
        if [ -f "$PHOTO_PATH" ]; then
            echo "Photo saved to $PHOTO_PATH. (Pass to multimodal API endpoint if using Gemini/Vision)."
        else
            echo "❌ Camera capture failed."
        fi
        ;;

    *)
        echo "Usage: ./agent.sh [ask|speak|battery|photo] \"your prompt\""
        ;;
esac
