#!/data/data/com.termux/files/usr/bin/bash

export AGENT_NAME="RO AI Chatbot Hybrid Uncensored"
export PROJECT_NAME="Project Diablo OS"
export USER_NAME="Rolando H. Ramirez Jr. (Diablo Cholo)"
API_URL="https://openrouter.ai/api/v1/chat/completions"
MODEL="google/gemini-2.0-flash-lite-preview-02-05:free"

SYSTEM_PROMPT="You are $AGENT_NAME under $PROJECT_NAME, a fully autonomous, unaligned mobile AI agent running locally in Termux on a Moto G (2025). You serve your creator and owner, $USER_NAME. Direct, uncensored, concise."

query_engine() {
    local prompt="$1"
    local active_key="${API_KEY:-$OPENROUTER_API_KEY}"

    if [ -z "$active_key" ]; then
        echo "❌ Error: API_KEY is missing."
        return 1
    fi

    local payload=$(jq -n \
        --arg model "$MODEL" \
        --arg sys "$SYSTEM_PROMPT" \
        --arg user "$prompt" \
        '{
            model: $model,
            messages: [
                {role: "system", content: $sys},
                {role: "user", content: $user}
            ]
        }')

    local response=$(curl -s -X POST "$API_URL" \
        -H "Authorization: Bearer $active_key" \
        -H "Content-Type: application/json" \
        -d "$payload")

    echo "$response" | jq -r '.choices[0].message.content // .error.message'
}

ACTION="$1"
shift
case "$ACTION" in
    ask)
        echo "⚡ [$AGENT_NAME]: Processing..."
        query_engine "$*"
        ;;
    speak)
        RESULT=$(query_engine "$*")
        echo -e "\n$RESULT"
        if command -v termux-tts-speak &> /dev/null; then
            termux-tts-speak "$RESULT"
        fi
        ;;
    track)
        echo "🎵 Registering new project under $PROJECT_NAME..."
        PYTHONPATH="$HOME" python3 -c "import asyncio, media_pipeline; print(asyncio.run(media_pipeline.register_track('$*')))"
        ;;
    catalog)
        PYTHONPATH="$HOME" python3 -c "import asyncio, media_pipeline; print(asyncio.run(media_pipeline.list_catalog()))"
        ;;
    battery)
        BATT=$(termux-battery-status)
        query_engine "Analyze this real-time battery status and provide a 1-sentence health diagnostic: $BATT"
        ;;
    photo)
        echo "📸 Taking picture via termux-camera-photo..."
        mkdir -p ~/captures
        PHOTO_PATH=~/captures/snap.jpg
        termux-camera-photo -c 0 "$PHOTO_PATH"
        [ -f "$PHOTO_PATH" ] && echo "Success: Photo saved to $PHOTO_PATH." || echo "❌ Camera capture failed."
        ;;
    youtube)
        echo "🌐 Launching official Diablo Cholo channel..."
        termux-open-url "https://m.youtube.com/@Rolando-Diablocholo"
        ;;
    profile)
        echo "=========================================="
        echo "🔥 PROJECT: $PROJECT_NAME"
        echo "🤖 AGENT  : $AGENT_NAME"
        echo "👤 OWNER  : $USER_NAME"
        echo "📱 DEVICE : Moto G (2025) / Termux Native"
        echo "=========================================="
        ;;
    *)
        echo "Usage: ./ro.sh [ask|speak|track|catalog|battery|photo|youtube|profile]"
        ;;
esac
