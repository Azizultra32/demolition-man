#!/usr/bin/env bash
#
# consigliere-request.sh - Submit request to The Consigliere
#
# Usage: consigliere-request.sh
# Interactive script for agents to submit requests for Ali approval
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
QUEUE_FILE="$REPO_ROOT/consigliere/workflows/request-queue.yaml"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "═══════════════════════════════════════════════════════════════"
echo "  📨 CONSIGLIERE REQUEST SUBMISSION"
echo "═══════════════════════════════════════════════════════════════"
echo -e "${NC}"
echo ""

# Get next request ID
DATE=$(date +%Y-%m-%d)
EXISTING_COUNT=$(grep -c "REQ-$DATE" "$QUEUE_FILE" 2>/dev/null || echo "0")
REQUEST_NUM=$(printf "%02d" $((EXISTING_COUNT + 1)))
REQUEST_ID="REQ-$DATE-$REQUEST_NUM"

echo -e "${CYAN}Request ID:${NC} $REQUEST_ID"
echo ""

# Collect request details
echo -e "${YELLOW}Agent ID (e.g., AGENT-00001):${NC}"
read -r AGENT_ID

echo -e "${YELLOW}Role (e.g., builder):${NC}"
read -r ROLE

echo -e "${YELLOW}Request Type:${NC}"
echo "  1) Constitutional Amendment"
echo "  2) New Role Authorization"
echo "  3) Architecture Decision"
echo "  4) Dispute Resolution"
echo "  5) Procreation Approval"
echo "  6) Other"
read -r type_choice

case "$type_choice" in
    1) TYPE="constitutional_amendment" ;;
    2) TYPE="new_role" ;;
    3) TYPE="architecture_decision" ;;
    4) TYPE="dispute_resolution" ;;
    5) TYPE="procreation_approval" ;;
    *) TYPE="other" ;;
esac

echo -e "${YELLOW}Urgency:${NC}"
echo "  1) EMERGENCY (production down, security vulnerability)"
echo "  2) HIGH (blocking work)"
echo "  3) MEDIUM (needed this week)"
echo "  4) LOW (nice to have)"
read -r urgency_choice

case "$urgency_choice" in
    1) URGENCY="emergency" ;;
    2) URGENCY="high" ;;
    3) URGENCY="medium" ;;
    *) URGENCY="low" ;;
esac

echo -e "${YELLOW}Brief Summary (1-2 sentences):${NC}"
read -r SUMMARY

echo -e "${YELLOW}Details (path to file or full text):${NC}"
read -r DETAILS

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Add to queue (append to YAML)
cat >> "$QUEUE_FILE" << EOF

  - request_id: "$REQUEST_ID"
    submitted_by: "$AGENT_ID ($ROLE)"
    submitted_at: "$TIMESTAMP"
    type: "$TYPE"
    urgency: "$URGENCY"
    summary: "$SUMMARY"
    details: "$DETAILS"
    status: "pending"
EOF

echo ""
echo -e "${GREEN}✓ Request submitted to The Consigliere${NC}"
echo ""
echo "  Request ID: $REQUEST_ID"
echo "  Type: $TYPE"
echo "  Urgency: $URGENCY"
echo ""
echo "The Consigliere will consolidate requests into a briefing for"
echo "Grandmaster Ali. You will be notified of the decision."
echo ""
