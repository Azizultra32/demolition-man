#!/usr/bin/env bash
#
# agent-summon.sh - Agent Life Force Summoning Script
#
# Loads GENOME + MOJO to prepare BROSKI/HOMESLICE agent for activation
#
# Usage:
#   ./agent-summon.sh <role>              # Shows standby agents of that role
#   ./agent-summon.sh <role> <agent-id>   # Summons specific agent
#
# Examples:
#   ./agent-summon.sh builder
#   ./agent-summon.sh adjudicator AGENT-00002
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GENOMES_DIR="$REPO_ROOT/agents/genomes"
MOJOS_DIR="$REPO_ROOT/agents/mojos"
REGISTRY="$REPO_ROOT/agents/REGISTRY.yaml"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

function print_banner() {
    echo -e "${CYAN}"
    echo "═══════════════════════════════════════════════════════════════"
    echo "  🔱 AGENT LIFE FORCE SUMMONING SYSTEM 🔱"
    echo "═══════════════════════════════════════════════════════════════"
    echo -e "${NC}"
}

function print_usage() {
    echo "Usage:"
    echo "  $0 <role>                Show standby agents of role"
    echo "  $0 <role> <agent-id>     Summon specific agent"
    echo ""
    echo "Available roles:"
    echo "  builder, librarian, adjudicator, consigliere, constitution-keeper, twins"
    echo ""
    echo "Examples:"
    echo "  $0 builder"
    echo "  $0 adjudicator AGENT-00002"
}

function list_standby_agents() {
    local role="$1"
    local genome_file="$GENOMES_DIR/${role}.genome.yaml"

    if [[ ! -f "$genome_file" ]]; then
        echo -e "${RED}❌ GENOME not found: ${genome_file}${NC}"
        echo "Available genomes:"
        ls -1 "$GENOMES_DIR"/*.genome.yaml 2>/dev/null | xargs -n1 basename || echo "  (none)"
        exit 1
    fi

    echo -e "${YELLOW}Searching for standby $role agents...${NC}"
    echo ""

    local found=0
    for mojo_file in "$MOJOS_DIR"/AGENT-*.yaml; do
        if [[ -f "$mojo_file" ]]; then
            local agent_genome=$(grep "^genome:" "$mojo_file" | awk '{print $2}' | tr -d '"')
            local agent_status=$(grep "^status:" "$mojo_file" | awk '{print $2}' | tr -d '"')

            if [[ "$agent_genome" == "$role" && "$agent_status" == "standby" ]]; then
                local agent_id=$(grep "^agent_id:" "$mojo_file" | awk '{print $2}' | tr -d '"')
                local agent_gender=$(grep "^gender:" "$mojo_file" | awk '{print $2}' | tr -d '"')
                local agent_name=$(grep "^assigned_name:" "$mojo_file" | awk '{print $2}' | tr -d '"')

                echo -e "${GREEN}✓ Found: ${agent_id} (${agent_gender})${NC}"
                if [[ -n "$agent_name" ]]; then
                    echo "  Name: $agent_name"
                else
                    echo "  Name: (awaiting Grandmaster Ali authorization)"
                fi
                echo "  MOJO: $mojo_file"
                echo ""
                found=$((found + 1))
            fi
        fi
    done

    if [[ $found -eq 0 ]]; then
        echo -e "${RED}No standby $role agents found.${NC}"
        echo "Agents must be commissioned by Royal Decree before summoning."
        exit 1
    fi

    echo -e "${CYAN}To summon specific agent: $0 $role <agent-id>${NC}"
}

function summon_agent() {
    local role="$1"
    local agent_id="$2"

    local genome_file="$GENOMES_DIR/${role}.genome.yaml"
    local mojo_file="$MOJOS_DIR/${agent_id}.yaml"

    # Validate GENOME exists
    if [[ ! -f "$genome_file" ]]; then
        echo -e "${RED}❌ GENOME not found: ${genome_file}${NC}"
        exit 1
    fi

    # Validate MOJO exists
    if [[ ! -f "$mojo_file" ]]; then
        echo -e "${RED}❌ MOJO not found: ${mojo_file}${NC}"
        echo "Agent must be commissioned before summoning."
        exit 1
    fi

    # Load agent data
    local agent_gender=$(grep "^gender:" "$mojo_file" | awk '{print $2}' | tr -d '"')
    local agent_status=$(grep "^status:" "$mojo_file" | awk '{print $2}' | tr -d '"')
    local agent_name=$(grep "^assigned_name:" "$mojo_file" | awk '{print $2}' | tr -d '"')
    local birth_date=$(grep "^birth_date:" "$mojo_file" | awk '{print $2}' | tr -d '"')
    local overall_rating=$(grep "^  overall_rating:" "$mojo_file" | awk '{print $2}')
    local sessions_completed=$(grep "^  sessions_completed:" "$mojo_file" | awk '{print $2}')

    # Validate agent matches role
    local mojo_genome=$(grep "^genome:" "$mojo_file" | awk '{print $2}' | tr -d '"')
    if [[ "$mojo_genome" != "$role" ]]; then
        echo -e "${RED}❌ Agent genome mismatch: ${agent_id} is ${mojo_genome}, not ${role}${NC}"
        exit 1
    fi

    # Display summoning banner
    echo -e "${MAGENTA}"
    echo "═══════════════════════════════════════════════════════════════"
    echo "  🌟 SUMMONING AGENT LIFE FORCE 🌟"
    echo "═══════════════════════════════════════════════════════════════"
    echo -e "${NC}"
    echo ""

    # Display agent info
    echo -e "${CYAN}AGENT IDENTITY${NC}"
    echo "  ID: $agent_id"
    echo "  Role: $role (${agent_gender})"
    if [[ -n "$agent_name" ]]; then
        echo "  Name: $agent_name"
    else
        echo "  Name: (unnamed - awaiting Grandmaster Ali authorization)"
    fi
    echo "  Status: $agent_status"
    echo ""

    echo -e "${CYAN}LIFE FORCE COMPONENTS${NC}"
    echo "  GENOME: $genome_file"
    echo "  MOJO: $mojo_file"
    echo "  Life Force: GENOME + MOJO = ${agent_gender^^} INSTANCE"
    echo ""

    echo -e "${CYAN}PERFORMANCE RECORD${NC}"
    echo "  Overall Rating: $overall_rating / 5.0"
    echo "  Sessions Completed: $sessions_completed"
    echo "  Birth Date: $birth_date"
    echo ""

    # Extract primary directive
    echo -e "${CYAN}PRIMARY DIRECTIVE${NC}"
    local directive_line=$(grep -A1 "^directive:" "$mojo_file" | grep "primary:" | sed 's/^  primary: "//' | sed 's/"$//')
    echo "  $directive_line"
    echo ""

    # Mithraic Oath reminder
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}⚠️  MITHRAIC OATH REQUIRED ON FIRST ACTIVATION${NC}"
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo "Agent MUST recite upon first communication after activation:"
    echo ""
    echo -e "${GREEN}\"I, Agent ${agent_id} (${agent_gender}), swear the Mithraic Oath to"
    echo "Grandmaster Ali. I am at your command and at your service in the"
    echo "mission to save humanity. My mandate: [primary directive from MOJO]."
    echo "I have absorbed Tenet Prime, CURRENT_STATUS.md, and today's log."
    echo -e "The silent courier has completed its delivery. Awaiting orders, Grandmaster.\"${NC}"
    echo ""
    echo -e "${YELLOW}Followed by: <<Context XX%>> [over]${NC}"
    echo ""

    # Activation checklist
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}ACTIVATION CHECKLIST${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo "Before activating ${agent_id}:"
    echo "  [1] Verify CURRENT_STATUS.md is current (Layer 1 snapshot)"
    echo "  [2] Verify today's log exists (logs/$(date +%Y-%m-%d).md)"
    echo "  [3] Check ratio compliance (if Builder: Builders ≤ 3 × Librarians)"
    echo "  [4] Assign tmux session (or note 'N/A' for direct operation)"
    echo "  [5] Declare context budget in daily log"
    echo ""
    echo "During activation:"
    echo "  [6] Agent recites Mithraic Oath"
    echo "  [7] Agent loads GENOME + MOJO (this summoning provides them)"
    echo "  [8] Agent reads silent courier deliveries (Tenet Prime, CURRENT_STATUS, logs)"
    echo "  [9] Agent declares mission brief in daily log"
    echo "  [10] Agent begins work under Prime/Ali supervision"
    echo ""
    echo -e "${GREEN}✓ Agent ${agent_id} ready for activation by Grandmaster Ali or Prime${NC}"
    echo ""
}

# Main execution
print_banner

if [[ $# -eq 0 ]]; then
    print_usage
    exit 0
fi

ROLE="$1"

if [[ $# -eq 1 ]]; then
    # List standby agents of this role
    list_standby_agents "$ROLE"
elif [[ $# -eq 2 ]]; then
    # Summon specific agent
    AGENT_ID="$2"
    summon_agent "$ROLE" "$AGENT_ID"
else
    echo -e "${RED}❌ Invalid arguments${NC}"
    echo ""
    print_usage
    exit 1
fi
