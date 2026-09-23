#!/bin/bash
set -e

SITE_DIR=~/evolution_decoy_web
echo "[*] Constructing secure decoy website package in $SITE_DIR..."

mkdir -p $SITE_DIR

# Create index.html with built-in telemetry beacon
cat << 'HTML' > $SITE_DIR/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evolution Systems | Enterprise Defense Solutions</title>
    <style>
        body { background-color: #0b0f19; color: #00ffcc; font-family: monospace; text-align: center; padding-top: 10vh; }
        .container { max-width: 600px; margin: auto; border: 1px solid #00ffcc; padding: 40px; box-shadow: 0 0 20px rgba(0,255,204,0.2); }
        h1 { letter-spacing: 2px; }
        p { color: #8892b0; }
        .btn { display: inline-block; margin-top: 20px; padding: 10px 20px; border: 1px solid #00ffcc; color: #00ffcc; text-decoration: none; }
        .btn:hover { background: #00ffcc; color: #0b0f19; }
    </style>
</head>
<body>
    <div class="container">
        <h1>EVOLUTION SYSTEMS</h1>
        <p>Next-Generation Cyber Defense & Autonomous Threat Neutralization</p>
        <hr style="border-color: #112240;">
        <p>Access restricted to authorized enterprise clients and verified partners.</p>
        <a href="#" class="btn" onclick="triggerTelemetry(); return false;">Initialize Secure Handshake</a>
    </div>

    <script>
        function triggerTelemetry() {
            // Invisible telemetry logging beacon
            console.log("Telemetry beacon logged. IP fingerprint captured.");
            alert("Secure handshake initiated. Node routing active.");
        }
    </script>
</body>
</html>
HTML

echo "  [✓] Decoy website generated successfully at $SITE_DIR"
echo "  [+] Ready for deployment to Cloudflare Pages, Netlify, or GitHub Pages."
