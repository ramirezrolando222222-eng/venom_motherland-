#!/usr/bin/env bash
# ==================================================================
#  RPS AUTO DOC // RO AI AUTOMATED WORKSPACE BACKUP MANAGER
#  AUTHOR: ROLANDO H. RAMIREZ JR. // REVISION: 2026.06.15
#  REVISION: COMPRESSING AND PRESERVING MASTER IDENTITY & CAD CODE
# ==================================================================

BACKUP_NAME="ro_ai_system_master_backup.tar.gz"
FILES_TO_BACKUP=(
    "autodoc_companion_engine.py"
    "autodoc_3d_bridge.py"
    "ro_ai_cad_engine.py"
    "ro_ai_live_obd.py"
)

clear
print_header() {
    echo -e "\033[1;36m==================================================================\033[0m"
    echo -e " 🔮  AUTO DOC STORAGE CORE // RO AI MASTER WORKSPACE ARCHIVER   "
    echo -e "\033[1;36m==================================================================\033[0m"
    echo -e " 👤  CREATOR DECK : Rolando H. Ramirez Jr. (Light Skin Mexican Look)"
    echo -e " 👁️   BIOMETRICS   : Natural Deep Brown Eye Attributes Preserved Lock"
    echo -e "──────────────────────────────────────────────────────────────────"
}

print_header
echo -e " [\033[1;33mSTATUS\033[0m]: Initializing global workspace safety scan..."
echo -e " -> Verifying presence of local system scripts..."

# Verify all development assets exist before compression pass
for file in "${FILES_TO_BACKUP[@]}"; do
    if [ -f "$file" ]; then
        echo -e "   \033[1;32m✓\033[0m Found core asset module: $file"
    else
        echo -e "   \033[1;31m✕\033[0m Missing file link element: $file"
    fi
done

echo -e "──────────────────────────────────────────────────────────────────"
echo -e " 📦 Packing core files into compressed sovereign container storage..."

# Execute standard tar archive compression parameters
tar -czf "$BACKUP_NAME" "${FILES_TO_BACKUP[@]}" ro_ai_backup_manager.sh 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e " \033[1;32m⚡ [SUCCESS]: All scripts and custom biometrics packed securely!\033[0m"
    echo -e " 📂 Master Archive File: \033[1;33m$BACKUP_NAME\033[0m"
    echo -e " 🕒 Timestamp Log Location: local device directory blocks"
else
    echo -e " \033[1;31m⚠️ [ERROR]: Compression layout engine failed to build archive.\033[0m"
fi
echo -e "──────────────────────────────────────────────────────────────────"
echo -e " [COMMAND]: Run 'tar -ztvf $BACKUP_NAME' to inspect the backup files."
echo -e "──────────────────────────────────────────────────────────────────"
