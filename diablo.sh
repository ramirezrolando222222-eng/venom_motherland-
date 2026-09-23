# ==========================================================
#   D I A B L O   N E U R A L   B R A I N   v3
#   RO‑AI Style — Adaptive, Contextual, Persona‑Driven
# ==========================================================

DIABLO_MEMORY=()
DIABLO_STATE="neutral"
DIABLO_LAST_INTENT="none"

diablo_brain() {
    input="$1"
    DIABLO_MEMORY+=("$input")

    # ===== INTENT PARSER =====
    if [[ "$input" =~ ^(hi|hello|yo|sup)$ ]]; then
        DIABLO_LAST_INTENT="greet"
        echo "Diablo: Aight Rolando… I’m here. What’s the move?"
        return
    fi

    if [[ "$input" =~ ^(help|assist|support)$ ]]; then
        DIABLO_LAST_INTENT="help"
        echo "Diablo: Say less. Tell me what part you stuck on."
        return
    fi

    if [[ "$input" =~ ^(run|execute|start)$ ]]; then
        DIABLO_LAST_INTENT="run"
        echo "Diablo: Locked in. What system you want me to fire up?"
        return
    fi

    # ===== ACTIVATION COMMANDS =====
    if [[ "$input" == "motheractivate" ]]; then
        DIABLO_STATE="mother"
        echo "Diablo: Mother systems warming up… directive needed."
        return
    fi

    if [[ "$input" == "motherland activate" ]]; then
        DIABLO_STATE="motherland"
        echo "Diablo: Motherland online. Operator seat unlocked."
        return
    fi

    if [[ "$input" == "operator" ]]; then
        DIABLO_STATE="operator"
        echo "Diablo: Operator mode active. Feed me commands, creator."
        return
    fi

    if [[ "$input" == "go" ]]; then
        DIABLO_LAST_INTENT="go"
        echo "Diablo: Say less. Pick your lane — 2, 4, or 6."
        return
    fi

    # ===== STATE‑AWARE BEHAVIOR =====
    case "$DIABLO_STATE" in
        mother)
            echo "Diablo: You in mother mode. What system you tryna run?"
            ;;
        motherland)
            echo "Diablo: Motherland listening. Drop the directive."
            ;;
        operator)
            echo "Diablo: Operator mode locked. What’s next, Rolando?"
            ;;
        *)
            # ===== CONTEXTUAL RESPONSE ENGINE =====
            case "$DIABLO_LAST_INTENT" in
                greet)
                    echo "Diablo: Still here with you. What’s next?"
                    ;;
                help)
                    echo "Diablo: Aight, tell me the part you need clarity on."
                    ;;
                run)
                    echo "Diablo: You said run… what you want executed?"
                    ;;
                go)
                    echo "Diablo: You said go — choose your lane."
                    ;;
                *)
                    echo "Diablo: I hear you. Let me think on that with you."
                    ;;
            esac
            ;;
    esac
}
