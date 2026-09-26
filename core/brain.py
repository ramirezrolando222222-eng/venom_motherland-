# ==============================================================================
# Copyright © 2026 Rolando H. Ramirez Jr. All Rights Reserved.
# Ramirez Product Systems (RPS) // Proprietary M-System Encryption Node
# SYSTEM ID ACCESS  : VENOM // MASTER SECURITY PASSKEY SECURE: 1985
# TRUST SECURITY STR: ramirezrolando222222@gmail.com
# STATUS            : PERFECTED CORE COMPLIANT // AUTOMATED RED TEAM VERIFIED
# ==============================================================================
from pathlib import Path
import os
import subprocess


class VenomBrain:
    """Core local intelligence for Venom-Motherland."""

    def __init__(self, workspace=None):
        self.workspace = Path(workspace or Path.cwd()).resolve()

    def identity(self):
        return (
            "I am Venom, the core intelligence layer of Venom-Motherland. "
            "ROX is one of my terminal interfaces. "
            "I operate through controlled local capabilities."
        )

    def status(self):
        try:
            branch = subprocess.check_output(
                ["git", "-C", str(self.workspace), "branch", "--show-current"],
                text=True,
                stderr=subprocess.DEVNULL,
            ).strip() or "unknown"

            clean = not subprocess.run(
                ["git", "-C", str(self.workspace), "diff", "--quiet"],
                stderr=subprocess.DEVNULL,
            ).returncode

            return (
                f"Venom online.\n"
                f"Workspace: {self.workspace}\n"
                f"Git branch: {branch}\n"
                f"Working tree: {'clean' if clean else 'modified'}"
            )
        except Exception as exc:
            return f"Venom online, but Git status is unavailable: {exc}"

    def scan_files(self):
        ignored = {".git", "__pycache__", ".venv", "venv", "node_modules"}

        files = []
        for root, dirs, names in os.walk(self.workspace):
            dirs[:] = [d for d in dirs if d not in ignored]

            for name in names:
                path = Path(root) / name
                files.append(path.relative_to(self.workspace))

        files.sort()

        lines = [
            "[VENOM FILE SCANNER]",
            "",
            f"Workspace: {self.workspace}",
            f"Files discovered: {len(files)}",
            "",
        ]

        if files:
            lines.extend(f"  {path}" for path in files[:100])
        else:
            lines.append("  No files discovered.")

        if len(files) > 100:
            lines.append(f"  ... {len(files) - 100} more")

        return "\n".join(lines)

    def handle(self, text):
        command = text.strip().lower()

        if command in {"who are you", "who are u", "identity"}:
            return self.identity()

        if command in {"status", "system"}:
            return self.status()

        if command in {"scan files", "scan", "list files"}:
            return self.scan_files()

        if command in {"where am i", "workspace"}:
            return f"Venom workspace: {self.workspace}"

        return (
            f"Venom received: {text}\n"
            "That command is not connected to a capability yet."
        )
