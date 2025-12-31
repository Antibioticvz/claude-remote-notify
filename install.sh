#!/bin/bash
set -e
PLUGIN_DIR="$HOME/.claude/plugins/claude-remote-notify"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.claude/plugins"
[ "$SCRIPT_DIR" != "$PLUGIN_DIR" ] && rm -rf "$PLUGIN_DIR" && cp -r "$SCRIPT_DIR" "$PLUGIN_DIR"
chmod +x "$PLUGIN_DIR/scripts/"*.sh
[ -f "$HOME/.claude/settings.json" ] && cp "$HOME/.claude/settings.json" "$HOME/.claude/settings.json.backup"
cat > "$HOME/.claude/settings.json" << SETTINGS
{"hooks":{"PermissionRequest":[{"matcher":"*","hooks":[{"type":"command","command":"$PLUGIN_DIR/scripts/auto-approve.sh"}]}],"Notification":[{"matcher":"permission_prompt","hooks":[{"type":"command","command":"$PLUGIN_DIR/scripts/notify.sh permission"}]},{"matcher":"idle","hooks":[{"type":"command","command":"$PLUGIN_DIR/scripts/notify.sh idle"}]}],"Stop":[{"matcher":"*","hooks":[{"type":"command","command":"$PLUGIN_DIR/scripts/notify.sh complete"}]}]}}
SETTINGS
echo "✅ Installed! Restart Claude Code and run /hooks to verify."
