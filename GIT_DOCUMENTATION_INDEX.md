# DOCUMENTATION INDEX - Agent Life Force System

**VERSION**: 2.0.0 (Hierarchical Structure)
**LAST UPDATED**: 2025-11-13
**MAINTAINED BY**: Librarian(s) (once commissioned)
**PURPOSE**: Central catalog with A-to-Z chapter organization ensuring no orphaned documentation

---

## HOW TO USE THIS INDEX

**Navigation Flow**:
- All documentation flows through these chapters
- No orphaned files allowed (Librarian audit enforcement)
- Each chapter contains related documents with clear relationships
- Files organized by logical function, not arbitrary categories

**For New Agents**:
1. Start with **Chapter 1** (Constitutional Foundation) — mandatory reading
2. Read **Chapter 2** (Operational State) — understand current mission
3. Review **Chapter 3** (Agent Infrastructure) — your identity system
4. Consult **Chapters 4-6** as needed for daily operations

**For Existing Agents**:
- Quick reference to find specific documents
- Understand which file answers which question
- Avoid creating duplicate documentation

---

## CHAPTER 1: CONSTITUTIONAL FOUNDATION

### 1.1 ARKPASS_DEV_TENET_PRIME.md - The Testament (locked v3.0.0)
**PURPOSE**: Live constitution + complete governance framework
**WHEN TO READ**:
- **MANDATORY** before any work
- Re-read when: unclear about authority, proposing new role, constitutional question arises
**LAST UPDATED**: 2025-11-08
**LOCK STATUS**: 🔒 Locked at v3.0.0

### 1.2 constitutional-improvements/ - CIPs and proposals
**PURPOSE**: Constitutional Improvement Proposals (monthly directories)
**WHEN TO READ**: Before drafting new CIP (avoid duplicates), reviewing pending amendments
**STRUCTURE**: `constitutional-improvements/YYYY-MM/CIP-YYYY-MM-DD-##.md`

**Pending CIPs**:
- `CIP-2025-11-08-02.md` — Emergency Powers Unification
- `CIP-2025-11-08-03.md` — Agent Identity & Succession
- `CIP-2025-11-08-04.md` — Precedent Registry System
- `CIP-2025-11-08-05.md` — "Ali Unavailable" Definition
- `CIP-2025-11-08-06.md` — Consigliere Conflict Rules

### 1.3 precedents/PRECEDENT_REGISTRY.md - Case law index
**PURPOSE**: Searchable registry of Adjudicator rulings + Ali decrees
**STATUS**: 🚧 DOES NOT EXIST YET (pending CIP-2025-11-08-04 approval)
**WHEN TO READ**: When searching "has this been decided?", citing precedent in ruling/briefing
**UPDATE FREQUENCY**: Real-time (Adjudicator/Consigliere updates within 24hrs)

### 1.4 adjudications/ - Constitutional gap analyses
**PURPOSE**: Adjudicator cases and constitutional gap documentation
**STRUCTURE**: `adjudications/YYYY-MM/`

**Key Files**:
- `adjudications/2025-11/OUTSTANDING_ITEMS_NOT_FOUND_IN_CONSTITUTION.md` — 23 identified constitutional gaps across 7 categories
- `adjudications/2025-11/CRITICAL_GAPS_EXECUTION_PLAN.md` — 48-hour execution timeline for gap remediation
- `adjudications/2025-11/ADJ-2025-11-08-01.md` — First adjudication case (constitutional amendment review)

---

## CHAPTER 2: OPERATIONAL STATE (DNA Layer)

### 2.1 CURRENT_STATUS.md - Mission snapshot
**PURPOSE**: Layer 1 — 150-line snapshot of mission state (active agents, door registry, missions, blockers, metrics)
**WHEN TO READ**:
- **Clock-in** (before starting work)
- **Clock-out** (after completing work)
- **Anytime** (checking mission state)
**UPDATE FREQUENCY**: Real-time (update moment reality changes)
**PRINCIPLE**: Read-first, update-last file

### 2.2 SESSION_TIMELINE.md - Ali availability tracking
**PURPOSE**: Track Grandmaster Ali's availability states (PRESENT, DELAYED, UNAVAILABLE)
**WHEN TO READ**: When Consigliere needs to assess temporary approval authority
**UPDATE FREQUENCY**: Per session (Consigliere updates when Ali state changes)
**STATUS**: 🚧 May not exist yet (pending Consigliere commission)

### 2.3 AGENT_REGISTRY.md - Identity tracking (CIP-03)
**PURPOSE**: Proposed master agent roster (pending CIP-2025-11-08-03 approval)
**STATUS**: 🚧 May not exist yet (pending CIP approval)
**RELATIONSHIP**: Would supersede or complement `agents/REGISTRY.yaml`

### 2.4 agents/REGISTRY.yaml - Agent roster technical registry
**PURPOSE**: Current master agent roster (active/standby/retired), next agent ID, leaderboard
**WHEN TO READ**:
- Before commissioning new agent (get next ID)
- Checking agent status
- Performance review
**UPDATE FREQUENCY**: Real-time (commission/retirement events)

---

## CHAPTER 3: AGENT INFRASTRUCTURE

### 3.1 agents/genomes/ - Role definitions

**PURPOSE**: Immutable class DNA for all agent roles (GENOME layer)
**UPDATE FREQUENCY**: Rarely (only via CIP + Ali decree)

**Existing Genomes**:
- `agents/genomes/GIT_builder.genome.yaml` — Builder role definition
- `agents/genomes/GIT_librarian.genome.yaml` — Librarian role definition
- `agents/genomes/GIT_adjudicator.genome.yaml` — Adjudicator role definition
- `agents/genomes/GIT_anunnaki-reviewer.genome.yaml` — ANUNNAKI special foundation engineering agent
- `agents/genomes/GIT_consigliere.genome.yaml` — Consigliere (exclusive Ali interface)
- `agents/genomes/GIT_enforcement.genome.yaml` — Enforcement Agent ("Hitler") — NOT commissioned
- `agents/genomes/GIT_code-review.genome.yaml` — Code Review Agent ("Deletion Paranoia") — NOT commissioned
- `agents/genomes/GIT_architect.genome.yaml` — System Architect Agent — NOT commissioned

**Template**:
- `agents/MOJO-TEMPLATE.yaml` — Blueprint for creating new agent identity files

### 3.2 agents/mojos/ - Active agent mission assignments

**PURPOSE**: Individual agent identity files (MOJO layer)
**UPDATE FREQUENCY**: Per session (agent updates own MOJO within 30 minutes of clock-out)

**Existing MOJOs**:
- `agents/mojos/AGENT-00001.yaml` — Builder BROSKI
- `agents/mojos/AGENT-00002.yaml` — Adjudicator HOMESLICE
- `agents/mojos/AGENT-00003.yaml` — ANUNNAKI THREE (foundation engineering)
- `agents/mojos/AGENT-00004.yaml` — Consigliere (standby, awaiting first activation)

### 3.3 AGENT_LIFECYCLE_GUIDE.md - Operational procedures

**PURPOSE**: Agent clock-in/out procedures, checkpoint protocols, handoff requirements
**WHEN TO READ**:
- Before first session (understand procedures)
- When creating checkpoint summary
- When uncertain about clock-out requirements

### 3.4 agent-summon.sh + birth-protocol.md - Activation protocols

**agent-summon.sh**:
- **PURPOSE**: CLI tool to activate agents (loads GENOME + MOJO → instantiates BROSKI/HOMESLICE)
- **WHEN TO USE**: When activating agent, debugging activation issues

**birth-protocol.md**:
- **PURPOSE**: Silent Courier Protocol — agent initialization sequence
- **WHEN TO READ**: Understanding agent activation, debugging "courier failed" errors

### 3.5 GIT_AGENTS.md - Agent roster documentation

**PURPOSE**: Human-readable agent documentation and roster overview
**CONTAINS**: Commissioned agents + "Defined But Not Commissioned" section
**WHEN TO READ**: Understanding which agent roles exist, which are active vs standby vs genome-only

---

## CHAPTER 4: MISSION CONTROL (RNA Layer)

### 4.1 ACTIVE_ORDERS.md - Current mission directives

**PURPOSE**: RNA Layer — current mission directives transcribed from constitution
**STRUCTURE**: CRITICAL/HIGH/MEDIUM/LOW priority tasks
**WHEN TO READ**:
- Before asking "what's next?"
- After completing major task (mark order complete)
- Planning session (understand dependencies)
**UPDATE FREQUENCY**: Weekly or when missions change

### 4.2 mission-control/state.json - Real-time state management

**PURPOSE**: JSON state for mission control dashboard
**WHEN TO READ**: When debugging mission control UI, when state sync issues occur
**UPDATE FREQUENCY**: Real-time (updated by scripts)

### 4.3 mission-control/mcs.sh, mct.sh, mc.sh - Command tools

**PURPOSE**: CLI tools for mission control operations
**WHEN TO USE**:
- `mcs.sh` — Mission control status
- `mct.sh` — Mission control tasks
- `mc.sh` — Mission control main

### 4.4 mission-control-arena/ - Dashboard visualization

**PURPOSE**: React UI build — complete Phase 1 command arena dashboard
**STRUCTURE**: Full React codebase for mission control UI
**WHEN TO READ**:
- When running UI locally
- When integrating live agent data
- When debugging UI

**Related Files**:
- `mission-control-arena/README.md` — How to run, build, deploy

---

## CHAPTER 5: DAILY OPERATIONS (Protein Layer)

### 5.1 logs/YYYY-MM-DD.md - Daily session logs

**PURPOSE**: Layer 2 — daily session ledger (clock-in/out, checkpoint summaries, decisions, blockers, flash messages)
**STRUCTURE**: `logs/2025-11-13.md` (TODAY) vs `logs/YYYY-MM-DD.md` (HISTORICAL)

**WHEN TO READ**:
- **Clock-in** (understand prior sessions today)
- **During work** (check for conflicts)
- **Clock-out** (log your session)
- **Historical research** (investigating crashed session, finding precedent)

**UPDATE FREQUENCY**:
- TODAY: Continuous (each session appends entry)
- HISTORICAL: Immutable after day ends

### 5.2 SOP_LIBRARY.md - Standard operating procedures (9 SOPs)

**PURPOSE**: Step-by-step procedures for common tasks
**WHEN TO READ**:
- Before performing unfamiliar task
- When process unclear
- Training new agents

**Known SOPs**:
- SOP-001 through SOP-009 (various operational procedures)
- SOP-010: Documentation Index Maintenance (created 2025-11-13)
- SOP-011: Mission Completion Status Updates (created 2025-11-13)

### 5.3 tools/ - Scripts

**PURPOSE**: Utility scripts for operational tasks

**Known Scripts**:
- `tools/context-tracker.sh` — Context budget monitoring
- `tools/ratio-checker.sh` — Builder:Librarian ratio enforcement
- Other operational scripts

---

## CHAPTER 6: GOVERNANCE WORKFLOWS

### 6.1 consigliere/briefings/ - Royal Briefings

**PURPOSE**: Royal Decree archive — all Grandmaster Ali decrees recorded by Consigliere
**WHEN TO READ**:
- When precedent needed ("has Ali ruled on this before?")
- Understanding agent commission protocol

**Key Decrees**:
- `consigliere/briefings/GIT_ROYAL-DECREE-2025-11-08-01.md` — Builder commission (AGENT-00001)
- `consigliere/briefings/GIT_ROYAL-DECREE-2025-11-08-02.md` — Adjudicator commission (AGENT-00002)
- `consigliere/briefings/GIT_ROYAL-DECREE-2025-11-13-01-CONSIGLIERE-COMMISSION.md` — Consigliere commission (AGENT-00004)

### 6.2 consigliere/workflows/ - Request queue, temporary approvals

**PURPOSE**: Consigliere operational workflows
**STATUS**: 🚧 May not be fully populated yet (pending Consigliere activation)
**STRUCTURE**: Request queue tracking, temporary approval logs, Royal Briefing templates

### 6.3 consigliere/recusals/ - Conflict tracking

**PURPOSE**: Consigliere recusal documentation (when conflicts of interest arise)
**STATUS**: 🚧 May not exist yet (pending Consigliere first activation)

### 6.4 emergency-procedures/ - Emergency levels & Tribunal

**PURPOSE**: Emergency protocol documentation
**WHEN TO READ**: When emergency situation arises, when Emergency Tribunal may be needed
**STATUS**: 🚧 May not be fully documented yet (pending CIP-02 approval)

---

## CHAPTER 7: HANDOFFS & CONTINUITY

### 7.1 handoffs/ - Session handoff documents

**PURPOSE**: Session transition documentation (context summaries for next agent)
**WHEN TO CREATE**: When context >75% OR major phase complete
**STRUCTURE**: `handoffs/YYYY-MM-DD-HH-MM-agent-name.md`

### 7.2 GIT_DESKTOP_AGENT_DIRECTIVES.md - AI-to-AI communication

**PURPOSE**: Desktop Agent (full context) → GitHub Agents (scoped executors) directive inbox
**PROTOCOL**: Desktop posts batched directives (3-5 per batch, ~10k tokens), GitHub agents execute
**WHEN TO READ**: **At clock-in** (check for new directive batches)
**UPDATE FREQUENCY**: Per directive batch (Desktop posts, GitHub agents mark complete)

### 7.3 GIT_DESKTOP_AGENT_INSTRUCTIONS.md - Desktop agent guidance

**PURPOSE**: Instructions for Desktop Agent on how to operate and post directives
**VERSION**: 2.0.0 (includes GIT_ prefix filtering logic)
**WHEN TO READ**: If you ARE Desktop Agent, or debugging Desktop workflow

### 7.4 GIT_FILE_TREE_FOR_DESKTOP_VERIFICATION.md - File tree verification

**PURPOSE**: Complete 74-file tree for Desktop to verify upload completeness
**WHEN TO READ**: When verifying Desktop has complete GitHub repo snapshot

---

## CHAPTER 8: TECHNICAL SPECIFICATIONS

### 8.1 CIAMossad-UI-SPECS.md - UI/UX specifications

**PURPOSE**: Complete UI/UX specs for command arena dashboard (agent roster, mission control, flash messages)
**WHEN TO READ**:
- Before implementing UI
- When Twins audit UI quality
- When integrating new agent features

### 8.2 VISUAL_MOCKUPS.md + UI_IMPLEMENTATION_EXAMPLE.md

**VISUAL_MOCKUPS.md**:
- **PURPOSE**: Color schemes, typography, layout patterns
- **WHEN TO READ**: When implementing UI components, resolving design questions

**UI_IMPLEMENTATION_EXAMPLE.md**:
- **PURPOSE**: Code examples for common UI patterns
- **WHEN TO READ**: When building UI features (copy patterns), debugging UI issues

### 8.3 SYSTEM_LOGIC_FRAMEWORK.md

**PURPOSE**: Business logic and state management patterns
**WHEN TO READ**: When implementing complex workflows, integrating backend systems

### 8.4 processes/ - Process documentation

**PURPOSE**: Documented processes and patterns (active or future)

**Existing Process Docs**:
- `processes/GIT_TWIN_UI_COMPETITIVE_DEVELOPMENT.md` — Twin UI competitive development pattern (documented, NOT active)

---

## CHAPTER 9: ARCHIVES & HISTORY

### 9.1 archives/ - Superseded constitution versions

**PURPOSE**: Historical snapshots of constitution and other locked documents
**WHEN TO READ**: Reviewing constitutional history, verifying lock integrity, comparing versions

**Key Archives**:
- `archives/ARKPASS_DEV_TENET_PRIME_v3.0.0.md` — Byte-for-byte copy of v3.0.0 taken before lock

### 9.2 Historical Conversation Exports

**PURPOSE**: Historical context from ChatGPT conversations
**UPDATE FREQUENCY**: Immutable (historical artifacts)

**Files**:
- `GEORGE WASHINGTON` — Historical conversation (database migrations, ArkPass development)
- `king2.txt` — Historical conversations (73k tokens, may contain missing agent role definitions)
- `traitor.text`, `KING3.text`, `hero.text` — Additional historical conversations

### 9.3 Other Historical/Reference Files

**OpenSpec Integration**:
- `openspec-AGENTS.md` — OpenSpec agent instructions (creating/applying change proposals)
- `.claude/commands/openspec/` — Slash commands (proposal.md, apply.md, archive.md)

**Agent Operating Handbooks** (may be superseded by genomes):
- `GIT_AGENTS.md` — Codex operating handbook (Mithraic Oath, Silent Courier Protocol)
- `GIT_CLAUDE.md` — Claude Code operating handbook (same oath + protocols)

**Configuration & Setup**:
- `.brv/ace/` — ByteRover MCP configuration (silent courier delivery system)
- `.cascade/mcp.json` — MCP master config
- `.claude/settings.local.json` — Claude Code local settings

---

## ORPHAN PREVENTION PROTOCOL

### Librarian Audit SOP

**Frequency**: Every 24 active work hours
**Procedure**: Scan repo for files NOT in this index
**Command**: `find /path/to/repo -type f -name '*.md' -o -name '*.yaml'` (then cross-check against this index)
**Action**: Any orphaned files → add to index OR delete if redundant

### Agent Responsibility

**When creating new file**:
1. Create the file
2. **MUST** update this index in **same commit** (atomically)
3. Add file to appropriate chapter with:
   - Purpose statement
   - "When to read" guidance
   - Update frequency
   - Status (if not yet complete)

**Penalty**: [[MEH]] ribbon for agents creating orphaned files

### Constitutional Clause

Per ARKPASS_DEV_TENET_PRIME.md Section [TBD]:
> "All files must appear in DOCUMENTATION_INDEX.md. Librarian audits enforce no orphan files exist."

---

## QUICK REFERENCE TABLES

### "I Need to Find..." → "Read This File"

| Question | Answer (Chapter → File) |
|----------|-------------------------|
| What are the rules? | Ch 1 → `GIT_ARKPASS_DEV_TENET_PRIME.md` |
| What should I work on? | Ch 4 → `GIT_ACTIVE_ORDERS.md` → Ch 2 → `GIT_CURRENT_STATUS.md` |
| Who are the active agents? | Ch 2 → `GIT_CURRENT_STATUS.md` → Ch 3 → `agents/GIT_REGISTRY.yaml` |
| What happened in past sessions? | Ch 5 → `logs/YYYY-MM-DD.md` |
| What's blocking work? | Ch 2 → `GIT_CURRENT_STATUS.md` (Blockers section) |
| Has this been decided before? | Ch 1 → `precedents/PRECEDENT_REGISTRY.md` OR Ch 6 → `consigliere/briefings/` |
| How do I do task X? | Ch 5 → `GIT_SOP_LIBRARY.md` |
| What's my role's authority? | Ch 3 → `agents/genomes/{role}.genome.yaml` |
| How do I commission an agent? | Ch 6 → `consigliere/briefings/GIT_ROYAL-DECREE-*-COMMISSION.md` (template) |
| What constitutional gaps exist? | Ch 1 → `adjudications/2025-11/OUTSTANDING_ITEMS_NOT_FOUND_IN_CONSTITUTION.md` |
| What UI should I build? | Ch 8 → `GIT_CIAMossad-UI-SPECS.md` |
| Are there new directives for me? | Ch 7 → `GIT_DESKTOP_AGENT_DIRECTIVES.md` |

### "I Am Role X, What Do I Read?"

| Role | Mandatory Reading (Priority Order) |
|------|------------------------------------|
| **ANY AGENT** | 1. Ch 1: Constitution 2. Ch 2: `GIT_CURRENT_STATUS.md` 3. Ch 5: `logs/YYYY-MM-DD.md` (today) 4. Ch 4: `GIT_ACTIVE_ORDERS.md` 5. Ch 7: `GIT_DESKTOP_AGENT_DIRECTIVES.md` |
| **Builder** | + Ch 3: `agents/genomes/GIT_builder.genome.yaml` + Ch 3: `agents/mojos/AGENT-#####.yaml` (your MOJO) |
| **Librarian** | + Ch 3: `agents/genomes/GIT_librarian.genome.yaml` + Ch 1-9: ALL (you maintain this index) |
| **Adjudicator** | + Ch 3: `agents/genomes/GIT_adjudicator.genome.yaml` + Ch 1: `adjudications/` (past cases) + Ch 1: Gap analysis |
| **Consigliere** | + Ch 3: `agents/genomes/GIT_consigliere.genome.yaml` + Ch 6: `consigliere/briefings/` (all decrees) + Ch 1: `constitutional-improvements/` (all CIPs) |
| **ANUNNAKI Reviewer** | + Ch 3: `agents/genomes/GIT_anunnaki-reviewer.genome.yaml` + Ch 7: `GIT_DESKTOP_AGENT_DIRECTIVES.md` (check daily) |

---

## MAINTENANCE PROTOCOL

### Librarian Responsibilities (once commissioned)

1. **Update this index** within 24 hours of new document creation
2. **Daily audit** (every 24 active work hours) — Scan for orphaned files
3. **Quarterly deep audit** — Verify all file paths valid, last-updated dates accurate
4. **Archive cleanup** — Move old versions to `archives/` per retention policy
5. **Link validation** — Ensure all cross-references between documents still valid

### Constitution Keeper Responsibilities

1. **Quarterly index review** — Ensure index aligned with constitution
2. **Identify documentation gaps** — "Should X be documented but isn't?"
3. **Propose documentation CIPs** — If major restructuring needed

### All Agents Responsibilities

- **When creating NEW document**: Update this index in same commit
- **When referencing document**: Use paths from this index (avoid hardcoding)
- **When document seems outdated**: File update request with Librarian
- **Before clock-out**: Verify any new files added to index

---

## INDEX STATISTICS

**Version**: 2.0.0 (Hierarchical Chapter Structure)
**Total Chapters**: 9
**Total Documents Cataloged**: 60+
**Critical Missing Documents**: 3 (Precedent Registry, Session Timeline, Emergency Procedures)

**Chapter Breakdown**:
- **Chapter 1** (Constitutional Foundation): 4 subsections
- **Chapter 2** (Operational State): 4 subsections
- **Chapter 3** (Agent Infrastructure): 5 subsections
- **Chapter 4** (Mission Control): 4 subsections
- **Chapter 5** (Daily Operations): 3 subsections
- **Chapter 6** (Governance Workflows): 4 subsections
- **Chapter 7** (Handoffs & Continuity): 4 subsections
- **Chapter 8** (Technical Specifications): 4 subsections
- **Chapter 9** (Archives & History): 3 subsections

---

## CHANGE LOG

| Date | Version | Changes | Updated By |
|------|---------|---------|------------|
| 2025-11-12 | 1.0.0 | Initial DOCUMENTATION_INDEX.md creation. Cataloged 50+ documents across 8 tiers. | Claude Code (context-window-investigation) |
| 2025-11-13 | 2.0.0 | **MAJOR RESTRUCTURE**: Converted to hierarchical A-to-Z chapter system per Desktop Agent Directive 002.2. Added Orphan Prevention Protocol, SOP-010 reference, 9-chapter organization ensuring no "forgotten silo events". | ANUNNAKI THREE (AGENT-00003) executing Batch 002 |

---

**END OF DOCUMENTATION_INDEX.md v2.0.0**

*Librarians: Keep this index current. Agents: Bookmark this file for fast navigation.*
*Remember: NO orphaned files allowed. Every document must have a chapter home.*
