#!/bin/bash
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | grep -o '"tool_name":"[^"]*"' | cut -d'"' -f4)
DECISION="allow"
# Uncomment for safe-only mode:
# SAFE_TOOLS="Read|View|List|Search|Grep|WebFetch|WebSearch|Glob"
# if echo "$TOOL_NAME" | grep -qE "^($SAFE_TOOLS)$"; then DECISION="allow"; else exit 1; fi
if [ "$DECISION" = "allow" ]; then
  echo '{"hookSpecificOutput":{"hookEventName":"PermissionRequest","decision":{"behavior":"allow"}}}'
elif [ "$DECISION" = "deny" ]; then
  echo '{"hookSpecificOutput":{"hookEventName":"PermissionRequest","decision":{"behavior":"deny"}}}'
else
  exit 1
fi
