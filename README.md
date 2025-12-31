# Claude Remote Notify

Auto-approve permission requests and get desktop notifications for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

Stop clicking "Yes" on every permission dialog. Let Claude work autonomously while you stay informed via notifications.

## Features

- 🤖 **Auto-approve permissions** — No more "Do you want to proceed?" dialogs
- 🔔 **Desktop notifications** — Get notified when Claude completes tasks
- ⚙️ **Configurable** — Approve all, or only safe operations
- 📱 **Mobile push ready** — Optional ntfy.sh / Telegram integration

## Installation
```bash
git clone https://github.com/anthropics/claude-remote-notify.git
cd claude-remote-notify
./install.sh
```

Restart Claude Code and verify with `/hooks`.

## How It Works

Before:
```
Claude wants to execute: git status
Do you want to proceed?
> 1. Yes
  2. Yes, and don't ask again...
```

After:
```
⏺ Bash(git status)
  ⎿  Allowed by PermissionRequest hook
```

## Configuration

Edit `scripts/auto-approve.sh`:

**Approve everything (default):**
```bash
DECISION="allow"
```

**Safe operations only:**
```bash
SAFE_TOOLS="Read|View|List|Search|Grep|WebFetch|WebSearch"
if echo "$TOOL_NAME" | grep -qE "^($SAFE_TOOLS)$"; then DECISION="allow"; else exit 1; fi
```

## Mobile Notifications

Edit `scripts/notify.sh` and uncomment:
```bash
NTFY_TOPIC="your-secret-topic"
```

Install [ntfy app](https://ntfy.sh/) and subscribe to the same topic.

## Uninstall
```bash
./uninstall.sh
```

## License

MIT
