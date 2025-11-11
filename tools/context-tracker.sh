#!/usr/bin/env bash
#
# context-tracker.sh - Agent Context Budget Tracker
#
# Calculates token usage from file sizes and warns at checkpoint thresholds
# Rule of thumb: ~4 characters = 1 token
#
# Usage:
#   context-tracker.sh [max_tokens]
#   Default max: 200000 tokens
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAX_TOKENS="${1:-200000}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

function get_file_tokens() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        echo "0"
        return
    fi
    # ~4 chars = 1 token
    local chars=$(wc -c < "$file")
    echo $((chars / 4))
}

function calculate_total_context() {
    local total=0

    # Core context files (silently delivered by courier)
    local tenet_tokens=$(get_file_tokens "$REPO_ROOT/ARKPASS_DEV_TENET_PRIME.md")
    local status_tokens=$(get_file_tokens "$REPO_ROOT/CURRENT_STATUS.md")
    local log_tokens=$(get_file_tokens "$REPO_ROOT/logs/$(date +%Y-%m-%d).md")

    total=$((total + tenet_tokens + status_tokens + log_tokens))

    # Additional loaded files (GENOME + MOJO for active agent)
    # This is approximate - actual usage depends on what agent loads

    echo "$total"
}

function get_checkpoint_status() {
    local current=$1
    local max=$2
    local percent=$((current * 100 / max))

    if [[ $percent -ge 90 ]]; then
        echo "CRITICAL"
    elif [[ $percent -ge 75 ]]; then
        echo "HIGH"
    elif [[ $percent -ge 50 ]]; then
        echo "MEDIUM"
    else
        echo "LOW"
    fi
}

function get_next_checkpoint() {
    local current=$1
    local max=$2
    local percent=$((current * 100 / max))

    if [[ $percent < 50 ]]; then
        echo "50%"
    elif [[ $percent < 75 ]]; then
        echo "75%"
    elif [[ $percent < 90 ]]; then
        echo "90%"
    else
        echo "SESSION END"
    fi
}

function print_banner() {
    echo -e "${CYAN}"
    echo "═══════════════════════════════════════════════════════════════"
    echo "  📊 AGENT CONTEXT BUDGET TRACKER"
    echo "═══════════════════════════════════════════════════════════════"
    echo -e "${NC}"
    echo ""
}

function show_context_breakdown() {
    echo -e "${CYAN}CONTEXT FILE BREAKDOWN:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local tenet_tokens=$(get_file_tokens "$REPO_ROOT/ARKPASS_DEV_TENET_PRIME.md")
    local status_tokens=$(get_file_tokens "$REPO_ROOT/CURRENT_STATUS.md")
    local log_file="$REPO_ROOT/logs/$(date +%Y-%m-%d).md"
    local log_tokens=$(get_file_tokens "$log_file")

    printf "  %-40s %8s tokens\n" "ARKPASS_DEV_TENET_PRIME.md" "~$tenet_tokens"
    printf "  %-40s %8s tokens\n" "CURRENT_STATUS.md" "~$status_tokens"
    printf "  %-40s %8s tokens\n" "logs/$(date +%Y-%m-%d).md" "~$log_tokens"

    echo "  ────────────────────────────────────────────────────────────"
    local total=$((tenet_tokens + status_tokens + log_tokens))
    printf "  %-40s %8s tokens\n" "Base Context Load" "~$total"
    echo ""
}

function show_context_status() {
    local current=$1
    local max=$2
    local percent=$((current * 100 / max))
    local remaining=$((max - current))
    local status=$(get_checkpoint_status "$current" "$max")
    local next=$(get_next_checkpoint "$current" "$max")

    echo -e "${CYAN}CONTEXT BUDGET STATUS:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    # Progress bar
    local bar_width=50
    local filled=$((percent * bar_width / 100))
    local empty=$((bar_width - filled))

    printf "  ["
    for ((i=0; i<filled; i++)); do printf "█"; done
    for ((i=0; i<empty; i++)); do printf "░"; done
    printf "] %3d%%\n" "$percent"
    echo ""

    printf "  Current Usage:    %8d / %8d tokens\n" "$current" "$max"
    printf "  Remaining:        %8d tokens\n" "$remaining"
    printf "  Next Checkpoint:  %s\n" "$next"
    echo ""

    # Status indicator
    case "$status" in
        CRITICAL)
            echo -e "  Status: ${RED}🚨 CRITICAL - APPROACHING 90% CHECKPOINT${NC}"
            echo -e "  ${RED}⚠️  MUST deliver Final Summary and END SESSION IMMEDIATELY${NC}"
            ;;
        HIGH)
            echo -e "  Status: ${YELLOW}⚠️  HIGH - APPROACHING 75% CHECKPOINT${NC}"
            echo -e "  ${YELLOW}📝 Deliver Late Summary (≤40 tokens) soon${NC}"
            ;;
        MEDIUM)
            echo -e "  Status: ${YELLOW}📊 MEDIUM - APPROACHING 50% CHECKPOINT${NC}"
            echo -e "  ${YELLOW}📝 Deliver Mid Summary (≤75 tokens) soon${NC}"
            ;;
        LOW)
            echo -e "  Status: ${GREEN}✓ LOW - Healthy context usage${NC}"
            ;;
    esac
    echo ""
}

function show_checkpoint_requirements() {
    echo -e "${CYAN}CHECKPOINT REQUIREMENTS:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  50% - Mid Summary (≤75 tokens)"
    echo "        Files touched, decisions/blockers, remaining plan"
    echo "        Append: <<Context 50%>> [over]"
    echo ""
    echo "  75% - Late Summary (≤40 tokens)"
    echo "        Still on plan? New info? Blockers?"
    echo "        Append: <<Context 75%>> [over]"
    echo ""
    echo "  90% - Final Summary (≤30 tokens)"
    echo "        Hand-off instructions + stop signal"
    echo "        Append: <<Context 90%>> [over]"
    echo "        END SESSION IMMEDIATELY AFTER"
    echo ""
}

function show_context_meter() {
    local current=$1
    local max=$2
    local percent=$((current * 100 / max))

    echo -e "${MAGENTA}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${MAGENTA}  WALKIE-TALKIE CONTEXT METER${NC}"
    echo -e "${MAGENTA}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "  All messages MUST end with:"
    echo -e "  ${CYAN}<<Context ${percent}%>> [over]${NC}"
    echo ""
    echo -e "  Responding agent MUST acknowledge:"
    echo -e "  ${CYAN}Roger. <<Context XX%>> [over]${NC}"
    echo ""
}

# Main execution
print_banner

CURRENT_TOKENS=$(calculate_total_context)

show_context_breakdown
show_context_status "$CURRENT_TOKENS" "$MAX_TOKENS"
show_checkpoint_requirements
show_context_meter "$CURRENT_TOKENS" "$MAX_TOKENS"

echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""
