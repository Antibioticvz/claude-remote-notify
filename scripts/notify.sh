#!/bin/bash
EVENT="${1:-unknown}"
case "$EVENT" in
  permission) TITLE="🔐 Claude Code"; MSG="Permission requested"; SOUND="Ping";;
  idle) TITLE="⏳ Claude Code"; MSG="Waiting for input"; SOUND="Tink";;
  complete) TITLE="✅ Claude Code"; MSG="Task completed"; SOUND="Glass";;
  *) TITLE="Claude Code"; MSG="Event: $EVENT"; SOUND="Pop";;
esac
[[ "$OSTYPE" == "darwin"* ]] && osascript -e "display notification \"$MSG\" with title \"$TITLE\" sound name \"$SOUND\"" 2>/dev/null
# Uncomment for ntfy.sh mobile push:
# NTFY_TOPIC="your-topic" && curl -s -d "$TITLE: $MSG" "https://ntfy.sh/$NTFY_TOPIC" &>/dev/null &
exit 0
