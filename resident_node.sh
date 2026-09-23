#!/data/data/com.termux/files/usr/bin/bash

termux-wake-lock
export OPENROUTER_API_KEY="sk-eGP2d5Fi4k12XCzhxqCipFhznIesqvNgGLlMNg9NvcML2Pqb"
export API_KEY="sk-eGP2d5Fi4k12XCzhxqCipFhznIesqvNgGLlMNg9NvcML2Pqb"

echo "⚡ [PROJECT DIABLO OS: RESIDENT NODE]: Online and active."
echo "Listening for local inputs..."

while true; do
    if [ -f ~/input.txt ]; then
        PROMPT=$(cat ~/input.txt)
        rm ~/input.txt
        echo "📥 Task received: $PROMPT"
        
        API_KEY="sk-eGP2d5Fi4k12XCzhxqCipFhznIesqvNgGLlMNg9NvcML2Pqb" ~/ro.sh ask "$PROMPT"
    fi
    sleep 2
done
