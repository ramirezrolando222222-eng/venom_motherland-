#!/bin/bash
echo "🔄 Running automated pre-commit sovereign encryption..."

for file in *.js; do
    if [ "$file" != "lion-engine.js" ] && [ "$file" != "init-sovereign-repo.sh" ] && [ "$file" != "lion-git-sync.sh" ]; then
        if ! grep -q "LION_CYPHER_X" "$file" 2>/dev/null; then
            node lion-engine.js encrypt "$file"
        fi
    fi
done

git add .
git commit -m "Sovereign auto-sync: Encrypted payload push $(date +%Y-%m-%d_%H:%M:%S)"
echo "🚀 Codebase successfully secured and committed as ciphertext."
