#!/usr/bin/env bash
#
# mct - Mission Control Task Logger
#
# Usage: mct 'task description'
# Logs mission task updates to Mission Control state
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATE_FILE="$REPO_ROOT/mission-control/state.json"
DAILY_LOG="$REPO_ROOT/logs/$(date +%Y-%m-%d).md"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

if [[ $# -eq 0 ]]; then
    echo "Usage: mct 'task description'"
    echo ""
    echo "Examples:"
    echo "  mct 'Created CURRENT_STATUS.md foundation file'"
    echo "  mct 'AGENT-00001 clock-in successful'"
    echo "  mct 'Mission Alpha complete - foundation engineering done'"
    exit 1
fi

TASK="$1"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Log to Mission Control state (add to info flash messages)
if [[ -f "$STATE_FILE" ]]; then
    # Update last_updated timestamp
    jq --arg ts "$TIMESTAMP" '.last_updated = $ts' "$STATE_FILE" > "$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"

    # Add task to flash messages (keep last 10)
    jq --arg task "$TASK" '.flash_messages.info += [$task] | .flash_messages.info = .flash_messages.info[-10:]' "$STATE_FILE" > "$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"
fi

# Log to daily log
if [[ -f "$DAILY_LOG" ]]; then
    echo "" >> "$DAILY_LOG"
    echo "**[$TIMESTAMP]** - $TASK" >> "$DAILY_LOG"
fi

echo -e "${GREEN}✓ Task logged to Mission Control${NC}"
echo -e "  Task: ${CYAN}$TASK${NC}"
echo -e "  Time: $TIMESTAMP"
echo ""
