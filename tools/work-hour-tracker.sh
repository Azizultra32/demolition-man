#!/bin/bash
# Active Work Hour Tracker
# Tracks cumulative work time across sessions
#
# Purpose: Grandmaster Ali works in bursts (3 days on, weeks off).
# Calendar-based "weekly" scheduling is meaningless. This tracks
# actual active work hours and triggers audits every N hours.

set -e

TRACKER_FILE="mission-control/work-hours.json"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TRACKER_PATH="$REPO_ROOT/$TRACKER_FILE"

# Initialize tracker file if it doesn't exist
init_tracker() {
    if [ ! -f "$TRACKER_PATH" ]; then
        mkdir -p "$(dirname "$TRACKER_PATH")"
        echo '{
  "total_hours": 0,
  "last_session_start": null,
  "last_audit_at_hours": 0,
  "audit_interval_hours": 24,
  "sessions": []
}' > "$TRACKER_PATH"
        echo "✅ Initialized work-hour tracker: $TRACKER_FILE"
    fi
}

# Start a new session
start_session() {
    init_tracker

    local now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    # Check if session already started
    local current_start=$(jq -r '.last_session_start' "$TRACKER_PATH")
    if [ "$current_start" != "null" ]; then
        echo "⚠️  Session already started at $current_start"
        echo "   Run 'work-hour-tracker.sh stop' first to close previous session"
        exit 1
    fi

    # Update tracker with session start
    jq --arg now "$now" '.last_session_start = $now' "$TRACKER_PATH" > "$TRACKER_PATH.tmp"
    mv "$TRACKER_PATH.tmp" "$TRACKER_PATH"

    echo "🟢 Session started at $now"
    echo "   Total hours: $(jq -r '.total_hours' "$TRACKER_PATH")"
}

# Stop current session and log hours
stop_session() {
    init_tracker

    local current_start=$(jq -r '.last_session_start' "$TRACKER_PATH")
    if [ "$current_start" = "null" ]; then
        echo "⚠️  No active session to stop"
        echo "   Run 'work-hour-tracker.sh start' first"
        exit 1
    fi

    local now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local start_epoch=$(date -d "$current_start" +%s 2>/dev/null || date -j -f "%Y-%m-%dT%H:%M:%SZ" "$current_start" +%s)
    local end_epoch=$(date -d "$now" +%s 2>/dev/null || date +%s)
    local duration_seconds=$((end_epoch - start_epoch))
    local duration_hours=$(echo "scale=2; $duration_seconds / 3600" | bc)

    # Update tracker
    jq --arg start "$current_start" \
       --arg end "$now" \
       --argjson hours "$duration_hours" \
       '.total_hours += $hours |
        .last_session_start = null |
        .sessions += [{
          "start": $start,
          "end": $end,
          "duration_hours": $hours
        }]' "$TRACKER_PATH" > "$TRACKER_PATH.tmp"
    mv "$TRACKER_PATH.tmp" "$TRACKER_PATH"

    echo "🔴 Session stopped at $now"
    echo "   Duration: $duration_hours hours"
    echo "   Total hours: $(jq -r '.total_hours' "$TRACKER_PATH")"

    # Check if audit due
    check_audit_due
}

# Show current status
show_status() {
    init_tracker

    local total_hours=$(jq -r '.total_hours' "$TRACKER_PATH")
    local last_audit=$(jq -r '.last_audit_at_hours' "$TRACKER_PATH")
    local audit_interval=$(jq -r '.audit_interval_hours' "$TRACKER_PATH")
    local current_start=$(jq -r '.last_session_start' "$TRACKER_PATH")
    local hours_since_audit=$(echo "$total_hours - $last_audit" | bc)

    echo "📊 ACTIVE WORK HOUR STATUS"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Total Active Hours: $total_hours"
    echo "Last Audit At: $last_audit hours"
    echo "Hours Since Audit: $hours_since_audit"
    echo "Audit Interval: $audit_interval hours"
    echo "Current Session: $([ "$current_start" != "null" ] && echo "ACTIVE (started $current_start)" || echo "None")"
    echo ""

    # Check if audit due
    if (( $(echo "$hours_since_audit >= $audit_interval" | bc -l) )); then
        echo "🚨 AUDIT DUE! ($hours_since_audit hours since last audit)"
        echo "   Trigger: Librarian documentation audit"
        echo "   Per: SOP-010 (every $audit_interval active work hours)"
    else
        local hours_remaining=$(echo "$audit_interval - $hours_since_audit" | bc)
        echo "✅ Next audit in: $hours_remaining hours"
    fi
}

# Check if audit is due (for scripts to call)
check_audit_due() {
    init_tracker

    local total_hours=$(jq -r '.total_hours' "$TRACKER_PATH")
    local last_audit=$(jq -r '.last_audit_at_hours' "$TRACKER_PATH")
    local audit_interval=$(jq -r '.audit_interval_hours' "$TRACKER_PATH")
    local hours_since_audit=$(echo "$total_hours - $last_audit" | bc)

    if (( $(echo "$hours_since_audit >= $audit_interval" | bc -l) )); then
        echo "🚨 AUDIT DUE"
        return 0  # Audit due
    else
        return 1  # Audit not due
    fi
}

# Mark audit as completed
mark_audit_complete() {
    init_tracker

    local total_hours=$(jq -r '.total_hours' "$TRACKER_PATH")

    jq --argjson hours "$total_hours" \
       '.last_audit_at_hours = $hours' \
       "$TRACKER_PATH" > "$TRACKER_PATH.tmp"
    mv "$TRACKER_PATH.tmp" "$TRACKER_PATH"

    echo "✅ Audit marked complete at $total_hours hours"
}

# Usage information
usage() {
    echo "Usage: work-hour-tracker.sh <command>"
    echo ""
    echo "Commands:"
    echo "  start    - Mark session start (clock-in)"
    echo "  stop     - Mark session end and log hours (clock-out)"
    echo "  status   - Show total hours + audit status"
    echo "  check    - Return 0 if audit due (for scripts)"
    echo "  audit    - Mark audit as completed"
    echo ""
    echo "Purpose: Track active work hours (not calendar time)"
    echo "Rationale: Ali's burst work pattern (3 days on, weeks off)"
}

# Main command dispatcher
case "${1:-}" in
    start)
        start_session
        ;;
    stop)
        stop_session
        ;;
    status)
        show_status
        ;;
    check)
        check_audit_due
        ;;
    audit)
        mark_audit_complete
        ;;
    *)
        usage
        exit 1
        ;;
esac
