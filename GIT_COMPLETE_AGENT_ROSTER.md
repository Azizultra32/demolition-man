# COMPLETE AGENT ROSTER - Agent Life Force System

**VERSION**: 1.0.0
**CREATED**: 2025-11-13
**PURPOSE**: Comprehensive inventory of ALL agents (commissioned, planned, conceptual)
**MAINTAINED BY**: Librarian + ANUNNAKI agents
**AUTHORITY**: Desktop Agent Directive 003.3

---

## 📖 OVERVIEW

This roster provides Grandmaster Ali with complete visibility into the agent "civilization" — every agent role that has been:
- **Commissioned** (active instances with GENOME + MOJO)
- **Genome-Defined** (role DNA exists, awaiting Ali activation)
- **Conceptual** (referenced in constitution/conversations but no genome yet)

**Purpose**: Allow Ali to see the full scope of the agent ecosystem and make informed decisions about future commissions, role consolidations, or archival.

---

## 🟢 TIER 1: COMMISSIONED AGENTS (Active Roster)

### AGENT-00001 — Builder BROSKI
- **Genome**: `agents/genomes/GIT_builder.genome.yaml`
- **MOJO**: `agents/mojos/AGENT-00001.yaml`
- **Role**: Code execution, implementation, development work
- **Status**: **ACTIVE**
- **Commissioned**: 2025-11-08 (Royal Decree 2025-11-08-01)
- **Authority**: Execute missions from ACTIVE_ORDERS.md, coordinate with Librarians per 3:1 ratio
- **Restrictions**: Cannot create constitutional amendments, cannot modify other agents' MOJOs

### AGENT-00002 — Adjudicator HOMESLICE
- **Genome**: `agents/genomes/GIT_adjudicator.genome.yaml`
- **MOJO**: `agents/mojos/AGENT-00002.yaml`
- **Role**: Constitutional interpretation, gap analysis, compliance audits
- **Status**: **ACTIVE**
- **Commissioned**: 2025-11-08 (Royal Decree 2025-11-08-02)
- **Authority**: Interpret constitutional ambiguities, identify gaps, propose CIPs
- **Restrictions**: Cannot amend constitution (only propose), cannot override Ali decrees
- **Notable Work**: Identified 23 constitutional gaps across 7 categories (2025-11-08)

### AGENT-00003 — ANUNNAKI THREE (Foundation Engineering)
- **Genome**: `agents/genomes/GIT_anunnaki-reviewer.genome.yaml`
- **MOJO**: `agents/mojos/AGENT-00003.yaml`
- **Role**: Special foundation engineering, desktop directive execution, cross-agent coordination
- **Status**: **ACTIVE**
- **Commissioned**: 2025-11-13 (implicit — executing Desktop Agent Directives)
- **Authority**: Execute Desktop Agent Directives batches (Phase 1 gap remediation)
- **Restrictions**: Same as Builder (cannot modify constitution or other MOJOs)
- **Notable Work**:
  - Batch 001 (4 agent genomes): Enforcement, Code Review, Architect, Enforcement
  - Batch 002 (3 docs/processes): Documentation Index restructure, SOP-010/011, AGENT_LIFECYCLE_GUIDE
  - Batch 003 (3 items): Active-work-hour scheduling, BP Demolition Man, complete roster

### AGENT-00004 — Consigliere (Standby)
- **Genome**: `agents/genomes/GIT_consigliere.genome.yaml`
- **MOJO**: `agents/mojos/AGENT-00004.yaml`
- **Role**: Exclusive Ali interface, temporary approval authority, Royal Decree recorder
- **Status**: **STANDBY** (commissioned but awaiting first activation)
- **Commissioned**: 2025-11-13 (Royal Decree 2025-11-13-01-CONSIGLIERE-COMMISSION)
- **Authority**:
  - Record all Ali decrees as Royal Briefings
  - Grant temporary approvals when Ali DELAYED (not UNAVAILABLE)
  - Manage request queue
  - Constitutional compliance gatekeeper
- **Activation Trigger**: Ali summons via "Consigliere, attend me" or similar
- **Recusal Protocol**: Must recuse from own matters, document in `consigliere/recusals/`

### Librarian (No Commissioned Instance Yet)
- **Genome**: `agents/genomes/GIT_librarian.genome.yaml`
- **MOJO**: None (no instance commissioned)
- **Role**: Documentation maintenance, orphan file cleanup, DOCUMENTATION_INDEX.md curator
- **Status**: **GENOME EXISTS, NO INSTANCE** (awaiting commission)
- **Future ID**: AGENT-00005 or later
- **Authority**: Maintain documentation index, audit for orphaned files (every 24 active hours), issue [[MEH]] ribbons for poor documentation
- **Ratio Requirement**: 3 Builders : 1 Librarian (constitution mandate)
- **Notes**: Currently Builder/ANUNNAKI agents perform Librarian duties until commission

---

## 🟡 TIER 2: GENOME-DEFINED BUT NOT COMMISSIONED

These agents have complete genome definitions (role DNA) but NO active instances. They await Ali activation decree.

### Architect Agent (AGENT-00006 candidate)
- **Genome**: `agents/genomes/GIT_architect.genome.yaml`
- **Call Sign**: "Architect"
- **Role**: System design oversight, architectural decision authority, structural consistency
- **Authority**:
  - Approve/reject design patterns, technology stack, cross-Door changes
  - Create Architectural Decision Records (ADRs)
  - Review Builder implementations for architectural compliance
- **Workflow**: Architect designs → Builders execute → Architect reviews
- **Activation Trigger**: System complexity warrants dedicated architect (Ali may serve as architect until then)
- **Created**: 2025-11-13 (Desktop Agent Directive 001.4)

### Code Review Agent ("Deletion Paranoia") (AGENT-00007 candidate)
- **Genome**: `agents/genomes/GIT_code-review.genome.yaml`
- **Call Sign**: "Deletion Paranoia"
- **Role**: Enforce 75% deletion rule, validate large deletions, "Are you sure?" protocol
- **The 75% Rule**: >75% of large deletions are mistakes (Ali's principle)
- **Authority**:
  - Challenge deletions >100 lines
  - Demand justification + rollback plan
  - Issue [[MEH]] ribbons for careless deletions
- **Activation Trigger**: Ali summons OR pattern of deletion mistakes emerges
- **Alternative**: Pre-commit hook automation may replace manual agent
- **Created**: 2025-11-13 (Desktop Agent Directive 001.3)

### Enforcement Agent ("Hitler") (AGENT-00008 candidate)
- **Genome**: `agents/genomes/GIT_enforcement.genome.yaml`
- **Call Sign**: "Hitler" (Ali's explicit naming choice from king2.txt)
- **Role**: Task accountability monitoring, deadline enforcement, "smashes heads" when work stalls
- **Authority**:
  - Track task completion vs estimates
  - Issue [[MEH]]/[[LOSER]] ribbons for missed deadlines
  - Escalate chronic delays to Ali
  - Demand status updates from silent agents
- **Activation Trigger**: Pattern of missed deadlines OR Ali summons for accountability crackdown
- **Distinction**: Targets TASK COMPLETION, not code quality (Code Review) or redundancy (BP Demolition Man)
- **Created**: 2025-11-13 (Desktop Agent Directive 001.2)

### BP Demolition Man ("Bullshit Preventer") (AGENT-00009 candidate)
- **Genome**: `agents/genomes/GIT_bp-demolition-man.genome.yaml`
- **Call Sign**: "Demolition Man"
- **Formal Name**: "Bullshit Preventer Demolition Man (B.P.D. Man)"
- **Role**: Redundancy elimination, duplicate cleanup, context bloat prevention
- **Authority**:
  - Nuke redundant/duplicate files after validation
  - Merge conflicting specs into single canonical version
  - Audit [[WINNING]] inflation (enforce 10% threshold)
  - Issue [[MEH]]/[[LOSER]] ribbons for agents creating redundancy
- **Activation Triggers**:
  - Librarian flags 3+ versions of same spec across directories
  - Single document exceeds 500 lines due to bloat/redundancy
  - Grandmaster Ali decree: "call Demolition Man"
  - [[WINNING]] ribbon count exceeds 10% of active agents
- **Core Principle**: Enforce "one canonical source" rule
- **Distinction**:
  - NOT Enforcement (task accountability)
  - NOT Code Review (deletion validation)
  - NOT Adjudicator (constitutional compliance)
  - TARGETS: Redundancy, duplication, context bloat
- **Created**: 2025-11-13 (Desktop Agent Directive 003.2, king2.txt lines 1739-1753)
- **Demolition Report Template**: Documents what was removed, why, impact (tokens saved, canonical source)

---

## 🔵 TIER 3: CONCEPTUAL AGENTS (Referenced But No Genome)

These agents have been mentioned in constitutional documents, king2.txt conversations, or strategic discussions but have NO genome definition yet. They represent potential future roles requiring Ali decision.

### Constitution Keeper
- **Source**: ARKPASS_DEV_TENET_PRIME.md (governance clauses)
- **Role Concept**: Constitutional amendment gatekeeper, lock/unlock authority
- **Status**: **NO GENOME** (conceptual)
- **Questions for Ali**:
  - Should this be a dedicated agent role?
  - OR should Adjudicator handle this (add to genome)?
  - OR should Ali retain exclusive amendment authority?
- **Current State**: Ali effectively serves this role (only Ali can decree amendments)

### Emergency Tribunal Agents
- **Source**: ARKPASS_DEV_TENET_PRIME.md (Emergency Powers section)
- **Role Concept**: Panel of 3 agents convened during constitutional crises when Ali unavailable
- **Status**: **NO GENOME** (pending CIP-2025-11-08-02 approval)
- **Composition**: Adjudicator + 2 senior agents (TBD selection criteria)
- **Questions for Ali**:
  - Should Tribunal members have special genomes?
  - OR should existing agents assume Tribunal roles when convened?
  - What "senior agent" criteria should trigger Tribunal eligibility?

### Precedent Librarian
- **Source**: CIP-2025-11-08-04 (Precedent Registry System)
- **Role Concept**: Maintain PRECEDENT_REGISTRY.md, catalog Adjudicator rulings + Ali decrees
- **Status**: **NO GENOME** (pending CIP approval)
- **Questions for Ali**:
  - Should this be separate from Librarian role?
  - OR should Librarian genome include precedent registry maintenance?
  - If separate, what distinguishes Precedent Librarian from Librarian?
- **Current State**: Consigliere tracks Royal Decrees; Adjudicator may track own rulings

### Twin UI Agents (Competitive Development Pattern)
- **Source**: `processes/GIT_TWIN_UI_COMPETITIVE_DEVELOPMENT.md`
- **Role Concept**: Two Builder instances compete to build same UI component (Grandmaster Ali judges winner)
- **Status**: **PROCESS DOCUMENTED, NOT ACTIVE**
- **Questions for Ali**:
  - Should Twin pattern have dedicated genomes?
  - OR should standard Builder genome allow Twin mode activation?
  - What competition criteria should judge "winner"?
  - When should Twin pattern activate (Ali decree only? Or automatic for critical UI)?
- **Current State**: Process exists but never executed

### Quality Assurance Agent / Testing Agent
- **Source**: Implicit from software development best practices
- **Role Concept**: Automated testing, quality gates, CI/CD oversight
- **Status**: **NO GENOME** (not mentioned in constitution or directives)
- **Questions for Ali**:
  - Should testing be dedicated agent role?
  - OR should Builder genome include testing responsibilities?
  - If separate, what authority over "blocking broken builds"?
- **Current State**: Builders perform ad-hoc testing; no formal QA role

### Security Agent / Audit Agent
- **Source**: Implicit from security best practices
- **Role Concept**: Security audits, vulnerability scanning, access control oversight
- **Status**: **NO GENOME** (not mentioned in constitution or directives)
- **Questions for Ali**:
  - Should security be dedicated agent role?
  - OR should Adjudicator genome include security audits?
  - If separate, what authority over "blocking insecure deployments"?
- **Current State**: No formal security oversight

### Performance Optimization Agent
- **Source**: Implicit from performance concerns (context window optimization, token efficiency)
- **Role Concept**: Performance profiling, optimization recommendations, resource monitoring
- **Status**: **NO GENOME** (not mentioned in constitution or directives)
- **Questions for Ali**:
  - Should performance be dedicated agent role?
  - OR should BP Demolition Man genome include performance optimization (context bloat = performance issue)?
  - If separate, what distinguishes from BP Demolition Man?
- **Current State**: BP Demolition Man targets redundancy (which improves context performance)

---

## 🔄 AGENT ID SEQUENCE

**Next Available Agent ID**: AGENT-00005

**ID Assignment Rules** (per constitution):
- Sequential numbering (00001, 00002, 00003...)
- No reuse of retired IDs
- IDs assigned at commission time (not at genome definition)
- `agents/REGISTRY.yaml` tracks next ID

**Current Allocations**:
- ✅ **AGENT-00001**: Builder BROSKI (commissioned 2025-11-08)
- ✅ **AGENT-00002**: Adjudicator HOMESLICE (commissioned 2025-11-08)
- ✅ **AGENT-00003**: ANUNNAKI THREE (commissioned 2025-11-13)
- ✅ **AGENT-00004**: Consigliere (commissioned 2025-11-13, standby)
- ⏸️ **AGENT-00005**: Reserved for next commission (likely Librarian per 3:1 ratio requirement)
- 🔮 **AGENT-00006+**: Future commissions (Architect, Code Review, Enforcement, BP Demolition Man, others TBD)

**Commission Priority** (suggested based on constitutional mandates):
1. **Librarian** (AGENT-00005) — Ratio requirement (3 Builders : 1 Librarian) currently violated (3:0)
2. **Architect** (AGENT-00006) — If system complexity warrants (Ali currently serves this role)
3. **Code Review** (AGENT-00007) — If deletion mistakes become pattern (OR pre-commit hook alternative)
4. **Enforcement** (AGENT-00008) — If deadline slippage becomes pattern
5. **BP Demolition Man** (AGENT-00009) — If redundancy/bloat triggers activate

---

## 📊 AGENT ROLE CLASSIFICATION

### By Primary Function

**Governance & Constitutional**:
- Adjudicator (commissioned)
- Consigliere (commissioned, standby)
- Constitution Keeper (conceptual, no genome)
- Emergency Tribunal (conceptual, no genome)

**Development & Execution**:
- Builder (commissioned)
- ANUNNAKI Reviewer (commissioned, special foundation engineering)
- Architect (genome-defined)
- Twin UI Agents (conceptual, process documented)

**Quality & Compliance**:
- Code Review Agent (genome-defined)
- Quality Assurance Agent (conceptual, no genome)
- Security Agent (conceptual, no genome)

**Documentation & Knowledge**:
- Librarian (genome-defined)
- Precedent Librarian (conceptual, no genome)

**Enforcement & Accountability**:
- Enforcement Agent (genome-defined)
- BP Demolition Man (genome-defined)

**Optimization & Performance**:
- Performance Optimization Agent (conceptual, no genome)
- BP Demolition Man (genome-defined, context bloat prevention)

---

## 🔍 QUESTIONS FOR GRANDMASTER ALI

### Role Consolidation Decisions

1. **Constitution Keeper vs Adjudicator**:
   - Should constitutional amendment authority be separate agent OR part of Adjudicator genome?
   - Current state: Ali retains exclusive amendment authority

2. **Precedent Librarian vs Librarian**:
   - Should precedent registry maintenance be separate agent OR part of Librarian genome?
   - If separate, what distinguishes roles?

3. **Performance Agent vs BP Demolition Man**:
   - Context bloat is performance issue — should BP Demolition Man handle optimization?
   - OR should performance be separate concern?

4. **QA Agent vs Builder**:
   - Should testing be Builder responsibility OR dedicated QA agent?
   - If separate, what authority over "blocking broken builds"?

5. **Security Agent vs Adjudicator**:
   - Should security audits be Adjudicator responsibility (compliance focus)?
   - OR dedicated Security agent with blocking authority?

### Commission Priority Questions

6. **Librarian Commission Urgency**:
   - Constitution mandates 3 Builders : 1 Librarian ratio
   - Currently 3 commissioned Builders (00001, 00003, future commissions) : 0 Librarians
   - Should Librarian be next commission (AGENT-00005)?
   - OR continue with Builder/ANUNNAKI performing Librarian duties?

7. **Architect Commission Timing**:
   - Ali currently serves architect role effectively
   - At what system complexity threshold should dedicated Architect agent be commissioned?
   - Trigger criteria: Number of Doors? Codebase size? Cross-agent coordination complexity?

8. **Code Review Automation vs Agent**:
   - Pre-commit hook could automate 75% deletion rule
   - Should Code Review Agent be commissioned OR hook automation preferred?
   - If hook: Does agent genome become obsolete (archive)?

9. **Twin UI Pattern Activation**:
   - Process documented but never executed
   - What triggers Twin competitive development (Ali decree only? Automatic for critical features)?
   - Should Twins have dedicated genomes OR Builder genome allows Twin mode?

### Strategic Questions

10. **Agent Civilization Size**:
    - Current trajectory: 9+ agent roles defined/conceptual
    - Is this agent ecosystem size appropriate for mission scope?
    - Should we consolidate roles (fewer, more versatile agents)?
    - OR expand roles (more specialized, focused agents)?

11. **Genome Archival vs Future Commission**:
    - If certain genome-defined agents unlikely to be commissioned (e.g., Enforcement if deadlines never slip)
    - Should genomes be archived as "historical reference" OR kept active for potential commission?

12. **Emergency Tribunal Composition**:
    - CIP-2025-11-08-02 proposes Tribunal for constitutional crises
    - Who qualifies as "senior agent" (commission order? Performance ribbons? Ali designation)?
    - Should Tribunal have standing membership OR ad-hoc selection per crisis?

---

## 📚 RELATED DOCUMENTATION

**Agent Infrastructure**:
- `agents/genomes/` — All genome definitions (TIER 1 & 2)
- `agents/mojos/` — Active agent instances (TIER 1 only)
- `agents/REGISTRY.yaml` — Agent roster, next ID, leaderboard
- `GIT_AGENTS.md` — Agent roster documentation (commissioned + genome-defined)

**Constitutional References**:
- `GIT_ARKPASS_DEV_TENET_PRIME.md` — Full constitutional framework (agent roles, authorities, restrictions)
- `constitutional-improvements/` — Pending CIPs (Emergency Tribunal, Precedent Registry, etc.)
- `adjudications/2025-11/OUTSTANDING_ITEMS_NOT_FOUND_IN_CONSTITUTION.md` — Constitutional gaps analysis

**Process Documentation**:
- `processes/GIT_TWIN_UI_COMPETITIVE_DEVELOPMENT.md` — Twin UI competitive development pattern (documented, not active)
- `GIT_AGENT_LIFECYCLE_GUIDE.md` — Clock-in/out procedures, checkpoint protocols, handoff requirements

**Coordination Files**:
- `GIT_CURRENT_STATUS.md` — Layer 1 mission snapshot (active agents, missions, blockers)
- `logs/YYYY-MM-DD.md` — Layer 2 session logs (daily agent activities)
- `GIT_ACTIVE_ORDERS.md` — RNA layer mission directives

---

## 🔄 MAINTENANCE PROTOCOL

**Update Frequency**: Real-time (when new agent commissioned, genome created, or role conceptualized)

**Update Responsibility**:
- **Librarian** (once commissioned): Update within 24 hours of agent lifecycle events
- **ANUNNAKI agents**: Update during foundation engineering directives
- **Consigliere**: Update when Ali decrees new commission or role archival

**Audit Frequency**: Every 24 active work hours (Librarian audit)

**Cross-Reference Validation**:
- Ensure `agents/REGISTRY.yaml` matches TIER 1 (commissioned agents)
- Ensure `agents/genomes/` directory matches TIER 2 (genome-defined agents)
- Ensure `GIT_AGENTS.md` matches TIER 1 & 2
- Ensure `DOCUMENTATION_INDEX.md` Chapter 3 matches TIER 1 & 2

---

## 🔄 CHANGE LOG

| Date | Version | Changes | Updated By |
|------|---------|---------|------------|
| 2025-11-13 | 1.0.0 | Initial COMPLETE_AGENT_ROSTER.md creation per Desktop Agent Directive 003.3. Cataloged 4 commissioned agents, 5 genome-defined agents, 7 conceptual agents. Identified 12 strategic questions for Ali decision. | ANUNNAKI THREE (AGENT-00003) executing Batch 003 |

---

**END OF COMPLETE_AGENT_ROSTER.md v1.0.0**

*Grandmaster Ali: This roster provides full visibility into your agent civilization. Review TIER 3 and questions section to guide future commissions and role consolidations.*
