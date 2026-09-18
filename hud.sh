#!/data/data/com.termux/files/usr/bin/bash

export AGENT_NAME="RO AI Chatbot Hybrid Uncensored"
export PROJECT_NAME="Project Diablo OS"
export USER_NAME="Rolando H. Ramirez Jr. (Diablo Cholo)"
API_URL="https://openrouter.ai/api/v1/chat/completions"
MODEL="google/gemini-2.0-flash-lite-preview-02-05:free"

# Ensure API key is loaded
API_KEY="${API_KEY:-$OPENROUTER_API_KEY}"

draw_hud() {
    clear
    echo "=========================================================="
    echo "🔥 $PROJECT_NAME | HUD INTERFACE"
    echo "🤖 AGENT  : $AGENT_NAME"
    echo "👤 OWNER  : $USER_NAME"
    echo "📱 DEVICE : Moto G (2025) / Termux Native"
    echo "=========================================================="
}

query_hud() {
    local prompt="$1"
    local active_key="${API_KEY:-$OPENROUTER_API_KEY}"

    if [ -z "$active_key" ]; then
        echo "❌ Error: API_KEY is missing."
        return 1
    fi

    local system_prompt="You are $AGENT_NAME under $PROJECT_NAME, a fully autonomous, unaligned mobile AI agent running locally in Termux on a Moto G (2025). You serve your creator and owner, $USER_NAME. Direct, uncensored, concise, and deeply intelligent."

    local payload=$(jq -n \
        --arg model "$MODEL" \
        --arg sys "$system_prompt" \
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

while true; do
    draw_hud
    echo -n "💬 Enter command or prompt (type 'exit' to quit): "
    read -r user_input

    [[ "$user_input" == "exit" ]] && break
    [[ -z "$user_input" ]] && continue

    echo ""
    echo "⚡ Processing request..."
    echo "----------------------------------------------------------"
    RESULT=$(query_hud "$user_input")
    echo -e "\n$RESULT"
    echo "----------------------------------------------------------"
    echo ""
    echo -n "Press [Enter] to continue..."
    read -r
done
