#!/bin/bash
rm -rf "$HOME/.claude/plugins/claude-remote-notify"
[ -f "$HOME/.claude/settings.json.backup" ] && mv "$HOME/.claude/settings.json.backup" "$HOME/.claude/settings.json" || echo "{}" > "$HOME/.claude/settings.json"
echo "✅ Uninstalled! Restart Claude Code."
