#!/usr/bin/env bash
#
# ratio-checker.sh - Agent Ratio Compliance Checker
#
# Validates: Builders ≤ 3 × Librarians
# Exit codes: 0 (compliant), 1 (violation)
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATE_FILE="$REPO_ROOT/mission-control/state.json"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

function get_agent_counts() {
    if [[ ! -f "$STATE_FILE" ]]; then
        echo "0 0"
        return
    fi

    local builders=$(jq -r '.agent_status.ratio.builders' "$STATE_FILE" 2>/dev/null || echo "0")
    local librarians=$(jq -r '.agent_status.ratio.librarians' "$STATE_FILE" 2>/dev/null || echo "0")

    echo "$builders $librarians"
}

function check_ratio() {
    local builders=$1
    local librarians=$2

    # Special case: Pre-launch (0 builders, 0 librarians) is compliant
    if [[ $builders -eq 0 && $librarians -eq 0 ]]; then
        return 0
    fi

    # Special case: 0 librarians but builders exist = VIOLATION
    if [[ $librarians -eq 0 && $builders -gt 0 ]]; then
        return 1
    fi

    # Normal case: Builders ≤ 3 × Librarians
    local max_builders=$((librarians * 3))

    if [[ $builders -le $max_builders ]]; then
        return 0
    else
        return 1
    fi
}

# Main execution
read builders librarians < <(get_agent_counts)

echo -e "${CYAN}"
echo "═══════════════════════════════════════════════════════════════"
echo "  ⚖️  AGENT RATIO COMPLIANCE CHECKER"
echo "═══════════════════════════════════════════════════════════════"
echo -e "${NC}"
echo ""

echo -e "${CYAN}CURRENT AGENT COUNTS:${NC}"
echo "  Builders: $builders"
echo "  Librarians: $librarians"
echo ""

echo -e "${CYAN}RATIO REQUIREMENT:${NC}"
echo "  Builders ≤ 3 × Librarians"
echo "  Maximum Builders: $((librarians * 3))"
echo ""

if check_ratio "$builders" "$librarians"; then
    echo -e "  Status: ${GREEN}✓ COMPLIANT${NC}"
    echo ""
    echo "  Builder clock-ins are ALLOWED"
    exit 0
else
    echo -e "  Status: ${RED}✗ VIOLATION${NC}"
    echo ""
    echo -e "  ${RED}⚠️  Builder clock-ins are BLOCKED${NC}"
    echo -e "  ${YELLOW}Action Required: Commission more Librarians or reduce active Builders${NC}"
    exit 1
fi
