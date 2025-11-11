#!/usr/bin/env bash
#
# mc - Mission Control Dashboard
#
# Opens the Mission Control center with full status display
# and interactive menu
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATE_FILE="$REPO_ROOT/mission-control/state.json"
MCS_SCRIPT="$REPO_ROOT/mission-control/mcs.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

function print_header() {
    clear
    echo -e "${MAGENTA}"
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║                                                               ║"
    echo "║           🎛️  MISSION CONTROL CENTER (ID: 48707)             ║"
    echo "║                                                               ║"
    echo "║         Agent Life Force System Command Center               ║"
    echo "║                                                               ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
}

function show_menu() {
    echo -e "${CYAN}AVAILABLE COMMANDS:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  [1] Show Status Pulse (mcs)"
    echo "  [2] List Standby Agents"
    echo "  [3] Summon Agent"
    echo "  [4] View CURRENT_STATUS.md"
    echo "  [5] View Today's Log"
    echo "  [6] Check Ratio Compliance"
    echo "  [7] View Pending Briefings"
    echo "  [8] Mission Control State (raw JSON)"
    echo "  [9] Update State Timestamp"
    echo "  [0] Exit"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

function handle_choice() {
    local choice="$1"

    case "$choice" in
        1)
            echo ""
            bash "$MCS_SCRIPT"
            ;;
        2)
            echo ""
            echo -e "${CYAN}Standby Agents:${NC}"
            jq -r '.agent_status.standby[] | "  \(.agent_id) - \(.role) (\(.gender)) - Rating: \(.rating)/5.0"' "$STATE_FILE"
            echo ""
            ;;
        3)
            echo ""
            echo -e "${YELLOW}Enter role (builder, librarian, adjudicator):${NC}"
            read -r role
            echo -e "${YELLOW}Enter agent ID (or leave blank to list):${NC}"
            read -r agent_id
            if [[ -z "$agent_id" ]]; then
                bash "$REPO_ROOT/agent-summon.sh" "$role"
            else
                bash "$REPO_ROOT/agent-summon.sh" "$role" "$agent_id"
            fi
            ;;
        4)
            echo ""
            if [[ -f "$REPO_ROOT/CURRENT_STATUS.md" ]]; then
                less "$REPO_ROOT/CURRENT_STATUS.md"
            else
                echo -e "${RED}❌ CURRENT_STATUS.md not found${NC}"
            fi
            echo ""
            ;;
        5)
            echo ""
            local today_log="$REPO_ROOT/logs/$(date +%Y-%m-%d).md"
            if [[ -f "$today_log" ]]; then
                less "$today_log"
            else
                echo -e "${RED}❌ Today's log not found: $today_log${NC}"
            fi
            echo ""
            ;;
        6)
            echo ""
            echo -e "${CYAN}Ratio Compliance Check:${NC}"
            local builders=$(jq -r '.agent_status.ratio.builders' "$STATE_FILE")
            local librarians=$(jq -r '.agent_status.ratio.librarians' "$STATE_FILE")
            local compliant=$(jq -r '.agent_status.ratio.compliant' "$STATE_FILE")

            echo "  Builders: $builders"
            echo "  Librarians: $librarians"
            echo "  Required: Builders ≤ 3 × Librarians"

            if [[ "$compliant" == "true" ]]; then
                echo -e "  Status: ${GREEN}✓ COMPLIANT${NC}"
            else
                echo -e "  Status: ${RED}✗ VIOLATION - Builder sessions BLOCKED${NC}"
            fi
            echo ""
            ;;
        7)
            echo ""
            echo -e "${CYAN}Pending Briefings:${NC}"
            local count=$(jq '.pending_briefings | length' "$STATE_FILE")
            if [[ "$count" -eq 0 ]]; then
                echo "  No pending briefings"
            else
                jq -r '.pending_briefings[] | "  [\(.id)] \(.type) - \(.requester)"' "$STATE_FILE"
            fi
            echo ""
            ;;
        8)
            echo ""
            cat "$STATE_FILE" | jq '.'
            echo ""
            ;;
        9)
            echo ""
            local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
            jq --arg ts "$timestamp" '.last_updated = $ts' "$STATE_FILE" > "$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"
            echo -e "${GREEN}✓ State timestamp updated: $timestamp${NC}"
            echo ""
            ;;
        0)
            echo ""
            echo -e "${GREEN}Mission Control session ending.${NC}"
            echo -e "${CYAN}<<Context XX%>> [over]${NC}"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo -e "${RED}Invalid choice: $choice${NC}"
            echo ""
            ;;
    esac
}

# Main loop
while true; do
    print_header

    # Show quick status
    echo -e "${CYAN}QUICK STATUS:${NC}"
    local mc_status=$(jq -r '.status' "$STATE_FILE")
    local active_missions=$(jq '.active_missions | length' "$STATE_FILE")
    local active_agents=$(jq '.agent_status.active | length' "$STATE_FILE")
    local standby_agents=$(jq '.agent_status.standby | length' "$STATE_FILE")

    echo "  System: $mc_status"
    echo "  Active Missions: $active_missions"
    echo "  Active Agents: $active_agents"
    echo "  Standby Agents: $standby_agents"
    echo ""

    show_menu

    echo -ne "${YELLOW}Enter choice: ${NC}"
    read -r choice

    handle_choice "$choice"

    if [[ "$choice" != "0" ]]; then
        echo -ne "${YELLOW}Press Enter to continue...${NC}"
        read -r
    fi
done
