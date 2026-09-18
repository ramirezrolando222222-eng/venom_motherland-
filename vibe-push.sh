#!/bin/bash
echo "⚡ [VIBE CODE] Locking down & pushing sovereign code..."

# Run encryption on all raw JS files using the native ES module engine
for file in *.js; do
    if [ "$file" != "vibe-push.sh" ] && [ "$file" != "lion-git-sync.sh" ]; then
        if ! grep -q "LION_CYPHER_X" "$file" 2>/dev/null; then
            node lion-engine.mjs encrypt "$file"
        fi
    fi
done

# Safe staging: Stage only tracked extensions, encrypted artifacts, and core files, avoiding nested repos
git add -u
git add *.enc.js *.mjs *.sh package.json .gitignore 2>/dev/null

git commit -m "Vibe sync: Ciphertext payload push $(date +%H:%M:%S)"
git push origin main || git push origin master
echo "🚀 Done. Code secured and pushed cleanly."
