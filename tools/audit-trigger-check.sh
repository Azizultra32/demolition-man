#!/bin/bash
# Dual-Mechanism Audit Trigger Checker
# Triggers audit if EITHER condition met:
# 1. Active work hours ≥24 (consecutive daily use)
# 2. Gregorian calendar ≥7 days since last audit

STATE_FILE="mission-control/state.json"
LAST_AUDIT_FILE="mission-control/last-audit-timestamp.txt"

# Get current timestamp
NOW=$(date +%s)

# Initialize if first run
if [[ ! -f "$LAST_AUDIT_FILE" ]]; then
    echo "$NOW" > "$LAST_AUDIT_FILE"
    echo "First run - audit timestamp initialized"
    exit 0
fi

LAST_AUDIT=$(cat "$LAST_AUDIT_FILE")

# Check Mechanism 1: Active work hours
ACTIVE_HOURS=$(jq -r '.time_tracking.total_active_work_hours // 0' "$STATE_FILE" 2>/dev/null || echo 0)
HOURS_SINCE_AUDIT=$(jq -r '.time_tracking.hours_since_last_audit // 0' "$STATE_FILE" 2>/dev/null || echo 0)

# Check Mechanism 2: Gregorian calendar (7 days = 604800 seconds)
SECONDS_SINCE_AUDIT=$((NOW - LAST_AUDIT))
DAYS_SINCE_AUDIT=$((SECONDS_SINCE_AUDIT / 86400))

# Trigger if EITHER condition met
TRIGGER_AUDIT=false

if (( $(echo "$HOURS_SINCE_AUDIT >= 24" | bc -l) )); then
    echo "✅ TRIGGER: Active work hours since last audit: ${HOURS_SINCE_AUDIT}hrs (≥24)"
    TRIGGER_AUDIT=true
fi

if (( DAYS_SINCE_AUDIT >= 7 )); then
    echo "✅ TRIGGER: Gregorian days since last audit: ${DAYS_SINCE_AUDIT} days (≥7)"
    TRIGGER_AUDIT=true
fi

if [[ "$TRIGGER_AUDIT" == "true" ]]; then
    echo ""
    echo "🚨 AUDIT DUE - Summoning Librarian for routine audit (SOP-003)"
    echo ""
    echo "Reset audit timer? (Run: echo \$(date +%s) > $LAST_AUDIT_FILE)"
    exit 1  # Non-zero exit signals audit needed
else
    echo "⏳ No audit needed yet"
    echo "   Active hours since audit: ${HOURS_SINCE_AUDIT}/24"
    echo "   Gregorian days since audit: ${DAYS_SINCE_AUDIT}/7"
    exit 0
fi
