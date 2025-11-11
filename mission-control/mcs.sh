#!/usr/bin/env bash
#
# mcs - Mission Control Status Pulse
#
# Displays current mission status, agent roster, and system health
# Run at clock-in and before clock-out
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATE_FILE="$REPO_ROOT/mission-control/state.json"
CURRENT_STATUS="$REPO_ROOT/CURRENT_STATUS.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

function print_banner() {
    echo -e "${CYAN}"
    echo "═══════════════════════════════════════════════════════════════"
    echo "  🎛️  MISSION CONTROL STATUS PULSE (ID: 48707)"
    echo "═══════════════════════════════════════════════════════════════"
    echo -e "${NC}"
    echo ""
}

function check_state_file() {
    if [[ ! -f "$STATE_FILE" ]]; then
        echo -e "${RED}❌ Mission Control state file not found: $STATE_FILE${NC}"
        echo "Initializing new state file..."
        # Will be created by mc.sh if needed
        exit 1
    fi
}

function get_timestamp() {
    date -u +"%Y-%m-%dT%H:%M:%SZ"
}

function show_missions() {
    echo -e "${CYAN}📋 ACTIVE MISSIONS${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local mission_count=$(jq '.active_missions | length' "$STATE_FILE")

    if [[ "$mission_count" -eq 0 ]]; then
        echo "  No active missions"
    else
        jq -r '.active_missions[] | "  [\(.mission_id)] \(.name)\n    Owner: \(.owner)\n    Status: \(.status) (\(.progress))\n    Tasks: \(.tasks_completed)/\(.tasks_total)\n    Doors: \(.door_ids | join(", "))\n"' "$STATE_FILE"
    fi
    echo ""
}

function show_agents() {
    echo -e "${CYAN}👥 AGENT ROSTER${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local active_count=$(jq '.agent_status.active | length' "$STATE_FILE")
    local standby_count=$(jq '.agent_status.standby | length' "$STATE_FILE")

    echo -e "${GREEN}Active: $active_count${NC}"
    if [[ "$active_count" -gt 0 ]]; then
        jq -r '.agent_status.active[] | "  ✓ \(.agent_id) (\(.role) \(.gender)) - Rating: \(.rating)/5.0"' "$STATE_FILE"
    fi

    echo ""
    echo -e "${YELLOW}Standby: $standby_count${NC}"
    if [[ "$standby_count" -gt 0 ]]; then
        jq -r '.agent_status.standby[] | "  ○ \(.agent_id) (\(.role) \(.gender)) - Rating: \(.rating)/5.0 - Sessions: \(.sessions)"' "$STATE_FILE"
    fi

    echo ""
    echo -e "${CYAN}Ratio Status:${NC}"
    local builders=$(jq -r '.agent_status.ratio.builders' "$STATE_FILE")
    local librarians=$(jq -r '.agent_status.ratio.librarians' "$STATE_FILE")
    local ratio_status=$(jq -r '.agent_status.ratio.ratio_status' "$STATE_FILE")
    local compliant=$(jq -r '.agent_status.ratio.compliant' "$STATE_FILE")

    if [[ "$compliant" == "true" ]]; then
        echo -e "  ${GREEN}✓ COMPLIANT${NC} - Builders: $builders, Librarians: $librarians ($ratio_status)"
    else
        echo -e "  ${RED}✗ VIOLATION${NC} - Builders: $builders, Librarians: $librarians ($ratio_status)"
        echo -e "  ${RED}⚠️  Builder sessions BLOCKED until ratio restored${NC}"
    fi

    echo ""
}

function show_flash_messages() {
    echo -e "${CYAN}📢 FLASH MESSAGES${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local critical_count=$(jq '.flash_messages.critical | length' "$STATE_FILE")
    local info_count=$(jq '.flash_messages.info | length' "$STATE_FILE")

    if [[ "$critical_count" -gt 0 ]]; then
        echo -e "${RED}🚨 CRITICAL:${NC}"
        jq -r '.flash_messages.critical[] | "  • \(.)"' "$STATE_FILE"
        echo ""
    fi

    if [[ "$info_count" -gt 0 ]]; then
        echo -e "${BLUE}ℹ️  INFO:${NC}"
        jq -r '.flash_messages.info[] | "  • \(.)"' "$STATE_FILE"
        echo ""
    fi

    if [[ "$critical_count" -eq 0 && "$info_count" -eq 0 ]]; then
        echo "  No flash messages"
        echo ""
    fi
}

function show_governance() {
    echo -e "${CYAN}🏛️  GOVERNANCE STATUS${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local pending_briefings=$(jq '.pending_briefings | length' "$STATE_FILE")
    local temp_approvals=$(jq '.temporary_approvals | length' "$STATE_FILE")

    echo "  Pending Briefings: $pending_briefings"
    echo "  Temporary Approvals: $temp_approvals"
    echo ""
}

function show_system_health() {
    echo -e "${CYAN}💚 SYSTEM HEALTH${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local status=$(jq -r '.status' "$STATE_FILE")
    local last_updated=$(jq -r '.last_updated' "$STATE_FILE")

    if [[ "$status" == "OPERATIONAL" ]]; then
        echo -e "  Status: ${GREEN}✓ OPERATIONAL${NC}"
    else
        echo -e "  Status: ${RED}✗ $status${NC}"
    fi

    echo "  Last Updated: $last_updated"
    echo "  CURRENT_STATUS.md: $(if [[ -f "$CURRENT_STATUS" ]]; then echo -e "${GREEN}✓ Present${NC}"; else echo -e "${RED}✗ Missing${NC}"; fi)"
    echo "  Today's Log: $(if [[ -f "$REPO_ROOT/logs/$(date +%Y-%m-%d).md" ]]; then echo -e "${GREEN}✓ Present${NC}"; else echo -e "${RED}✗ Missing${NC}"; fi)"
    echo ""
}

# Main execution
print_banner
check_state_file
show_missions
show_agents
show_flash_messages
show_governance
show_system_health

echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "  Last pulse: $(get_timestamp)"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""
