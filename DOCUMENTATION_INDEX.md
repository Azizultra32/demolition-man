# DOCUMENTATION INDEX - Demolition Man Repository

**VERSION**: 1.0.0
**LAST UPDATED**: 2025-11-12
**MAINTAINED BY**: Librarian(s) (once commissioned)
**PURPOSE**: Central catalog of all governance documentation with usage guidance

---

## 📚 How to Use This Index

**For New Agents:**
1. Start with **Constitution & Testament** (mandatory reading)
2. Read **Coordination Files** (understand current state)
3. Review **Your Role Documentation** (specific to your GENOME)
4. Consult **SOPs** when performing tasks

**For Existing Agents:**
- Quick reference to find specific documents
- Understand which file answers which question
- Avoid creating duplicate documentation

**Update Protocol:**
- Librarians update this index when new documents created
- Constitution Keeper ensures index accuracy quarterly
- Last modified dates tracked in each section

---

## 🧬 Tier 1: Constitution & Testament (DNA)

### Primary Governance Document
| File | Purpose | When to Read | Last Updated |
|------|---------|--------------|--------------|
| `ARKPASS_DEV_TENET_PRIME.md` | **LIVE TESTAMENT + CONSTITUTION** — Complete governance framework. Agent Life Force System (GENOME→MOJO→BROSKI/HOMESLICE), roles, protocols, procedures. **LOCKED at v3.0.0**. | **MANDATORY** before any work. Re-read when: unclear about authority, proposing new role, constitutional question arises. | 2025-11-08 |
| `archives/ARKPASS_DEV_TENET_PRIME_v3.0.0.md` | **ARCHIVAL SNAPSHOT** — Byte-for-byte copy of v3.0.0 taken before lock. | Reference when: reviewing constitutional history, verifying lock integrity, comparing versions. | 2025-11-08 (snapshot) |

### Supporting Constitutional Documents
| File | Purpose | When to Read | Last Updated |
|------|---------|--------------|--------------|
| `adjudications/2025-11/OUTSTANDING_ITEMS_NOT_FOUND_IN_CONSTITUTION.md` | **GAP ANALYSIS** — 23 identified constitutional gaps across 7 categories. Critical reference for understanding what's missing. | Read when: drafting CIPs, wondering why process unclear, planning governance improvements. | 2025-11-08 |
| `adjudications/2025-11/CRITICAL_GAPS_EXECUTION_PLAN.md` | **GAP REMEDIATION PLAN** — 48-hour execution timeline for addressing critical gaps. | Read when: implementing gap fixes, understanding priority order. | 2025-11-08 |

---

## 🧬 Tier 2: Coordination Files (RNA)

### Layer 1: Mission Snapshot (DNA Expression)
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `CURRENT_STATUS.md` | **LAYER 1** — 150-line snapshot of mission state. Active agents, door registry, missions, blockers, metrics. **Read-first, update-last** file. | **Clock-in** (before starting work), **Clock-out** (after completing work), **Anytime** (checking mission state). | Real-time (update moment reality changes) |

### Layer 2: Session Logs (RNA Transcription)
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `logs/2025-11-12.md` (TODAY) | **LAYER 2** — Daily session ledger. Clock-in/out, checkpoint summaries, decisions, blockers, flash messages. | **Clock-in** (understand prior sessions today), **During work** (check for conflicts), **Clock-out** (log your session). | Continuous (each session appends entry) |
| `logs/YYYY-MM-DD.md` (HISTORICAL) | **LAYER 2 ARCHIVE** — Past daily logs. | Reference when: investigating crashed session, finding precedent, reviewing agent performance history. | Immutable after day ends |

### Active Mission Directives (RNA Instructions)
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `ACTIVE_ORDERS.md` | **RNA LAYER** — Current mission directives transcribed from constitution. CRITICAL/HIGH/MEDIUM/LOW priority tasks. Answers "what should I work on NOW?" | **Before asking "what's next?"**, **After completing major task** (mark order complete), **Planning session** (understand dependencies). | Weekly or when missions change |

---

## 🧬 Tier 3: Agent Infrastructure (GENOME & MOJO)

### Agent Identity System
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `agents/registry/REGISTRY.yaml` | **MASTER AGENT ROSTER** — All agents (active/standby/retired), next agent ID, leaderboard. | **Before commissioning new agent** (get next ID), **Checking agent status**, **Performance review**. | Real-time (commission/retirement events) |
| `agents/genomes/builder.genome.yaml` | **BUILDER GENOME** — Immutable class DNA for all Builder agents. Capabilities, constraints, core mission. | **Before commissioning Builder**, **When Builder questions authority**. | Rarely (only via CIP + Ali decree) |
| `agents/genomes/librarian.genome.yaml` | **LIBRARIAN GENOME** — Immutable class DNA for all Librarian agents. | **Before commissioning Librarian**, **When Librarian questions authority**. | Rarely (only via CIP + Ali decree) |
| `agents/genomes/adjudicator.genome.yaml` | **ADJUDICATOR GENOME** — Immutable class DNA for all Adjudicator agents. | **Before commissioning Adjudicator**, **When Adjudicator questions authority**. | Rarely (only via CIP + Ali decree) |
| `agents/mojos/AGENT-00001.yaml` | **AGENT-00001 MOJO** — Builder BROSKI individual identity. Performance ratings, session history, goals. | **Before activating AGENT-00001**, **Performance review**, **After session** (update ratings). | Per session (agent updates own MOJO) |
| `agents/mojos/AGENT-00002.yaml` | **AGENT-00002 MOJO** — Adjudicator HOMESLICE individual identity. | **Before summoning Adjudicator**, **Performance review**. | Per session (agent updates own MOJO) |
| `agents/MOJO-TEMPLATE.yaml` | **MOJO TEMPLATE** — Blueprint for creating new agent identity files. | **When commissioning new agent** (copy and customize). | Rarely (template improvements) |

### Agent Activation Tools
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `agent-summon.sh` | **SUMMONING SCRIPT** — CLI tool to activate agents (loads GENOME + MOJO → instantiates BROSKI/HOMESLICE). | **When activating agent** (run script), **Debugging activation issues**. | As needed (script improvements) |
| `birth-protocol.md` | **SILENT COURIER PROTOCOL** — Agent initialization sequence. How Testament/status/logs delivered at birth. | **Understanding agent activation**, **Debugging "courier failed" errors**. | Rarely (protocol changes) |

---

## 🧬 Tier 4: Governance Processes

### Constitutional Improvements
| Directory/File | Purpose | When to Read | Update Frequency |
|----------------|---------|--------------|------------------|
| `constitutional-improvements/2025-11/` | **CIP ARCHIVE** — Constitutional Improvement Proposals (monthly directories). | **Before drafting new CIP** (avoid duplicates), **Reviewing pending amendments**. | Monthly (new CIPs filed as needed) |
| `constitutional-improvements/2025-11/CIP-2025-11-08-02.md` | Emergency Powers Unification proposal | When: implementing emergency protocols | N/A (pending approval) |
| `constitutional-improvements/2025-11/CIP-2025-11-08-03.md` | Agent Identity & Succession proposal | When: commissioning/retiring agents | N/A (pending approval) |
| `constitutional-improvements/2025-11/CIP-2025-11-08-04.md` | Precedent Registry System proposal | When: creating precedent registry | N/A (pending approval) |
| `constitutional-improvements/2025-11/CIP-2025-11-08-05.md` | "Ali Unavailable" Definition proposal | When: Consigliere issuing temporary approvals | N/A (pending approval) |
| `constitutional-improvements/2025-11/CIP-2025-11-08-06.md` | Consigliere Conflict Rules proposal | When: Consigliere recusal needed | N/A (pending approval) |

### Royal Decrees & Precedents
| Directory/File | Purpose | When to Read | Update Frequency |
|----------------|---------|--------------|------------------|
| `consigliere/briefings/` | **ROYAL DECREE ARCHIVE** — All Grandmaster Ali decrees recorded by Consigliere. | **When precedent needed** ("has Ali ruled on this before?"), **Understanding agent commission protocol**. | Per decree (Consigliere adds new decrees) |
| `consigliere/briefings/ROYAL-DECREE-2025-11-08-01.md` | Builder commission decree (AGENT-00001) | When: commissioning future Builders (follow template) | Immutable (historical record) |
| `consigliere/briefings/ROYAL-DECREE-2025-11-08-02.md` | Adjudicator commission decree (AGENT-00002) | When: commissioning future Adjudicators | Immutable (historical record) |
| `precedents/PRECEDENT_REGISTRY.md` | **PRECEDENT REGISTRY** — Searchable case law (Adjudicator rulings + Ali decrees). **DOES NOT EXIST YET** (pending CIP-2025-11-08-04 approval). | When: searching for "has this been decided?", citing precedent in ruling/briefing. | Real-time (Adjudicator/Consigliere updates within 24hrs) |

### Adjudications & Disputes
| Directory/File | Purpose | When to Read | Update Frequency |
|----------------|---------|--------------|------------------|
| `adjudications/2025-11/` | **ADJUDICATION ARCHIVE** — All Adjudicator cases (monthly directories). | **When dispute arises** (check if similar case exists), **Performance review** (audit Adjudicator rulings). | Per case (Adjudicator files reports) |
| `adjudications/2025-11/ADJ-2025-11-08-01.md` | First adjudication case (constitutional amendment review) | When: understanding adjudication process, reviewing Session 5/6 work | Immutable (historical record) |

---

## 🧬 Tier 5: Command Arena & UI

### UI Specifications
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `CIAMossad-UI-SPECS.md` | **COMMAND ARENA COMPLETE SPECS** — Full UI/UX specifications for agent dashboard, mission control, flash messages, agent roster. | **Before implementing UI**, **When Twins audit UI quality**, **When integrating new agent features**. | When UI capabilities expand |
| `VISUAL_MOCKUPS.md` | **VISUAL DESIGN SPECS** — Color schemes, typography, layout patterns. | **When implementing UI components**, **When resolving design questions**. | When design system evolves |
| `UI_IMPLEMENTATION_EXAMPLE.md` | **IMPLEMENTATION EXAMPLES** — Code examples for common UI patterns. | **When building UI features** (copy patterns), **When debugging UI issues**. | When best practices identified |
| `SYSTEM_LOGIC_FRAMEWORK.md` | **SYSTEM LOGIC FRAMEWORK** — Business logic and state management patterns. | **When implementing complex workflows**, **When integrating backend systems**. | When logic patterns evolve |

### UI Implementation
| Directory/File | Purpose | When to Read | Update Frequency |
|----------------|---------|--------------|------------------|
| `mission-control-arena/` | **REACT UI BUILD** — Complete Phase 1 command arena dashboard (React codebase). | **When running UI locally**, **When integrating live agent data**, **When debugging UI**. | Per UI development session |
| `mission-control-arena/README.md` | **UI BUILD DOCUMENTATION** — How to run, build, deploy mission control arena. | **First time running UI**, **When deployment questions arise**. | When build process changes |

---

## 🧬 Tier 6: Agent Operating Handbooks

### Agent Instructions
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `AGENTS.md` | **CODEX OPERATING HANDBOOK** — Instructions for Codex agents. Mithraic Oath, Silent Courier Protocol, session conduct. | **If you are Codex agent** (mandatory reading), **When onboarding new Codex instance**. | When Codex-specific protocol changes |
| `CLAUDE.md` | **CLAUDE CODE OPERATING HANDBOOK** — Instructions for Claude Code agents. Same oath + silent-courier language and protocol. | **If you are Claude Code agent** (mandatory reading), **When onboarding new Claude instance**. | When Claude-specific protocol changes |

---

## 🧬 Tier 7: Reference & Historical Documents

### Conversation Exports (Historical Context)
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `GEORGE WASHINGTON` | **CHATGPT CONVERSATION EXPORT** — Historical conversation about database migrations, ArkPass development. Role directives NOT here (contrary to README claim). | **When researching historical decisions**, **When searching for "Hitler" agent specs** (mentioned by Grandmaster). | Immutable (historical artifact) |
| `king2.txt` | **CHATGPT CONVERSATION EXPORT** — Historical conversations (73k tokens). May contain missing agent role definitions. | **When Grandmaster searches for missing role specs**, **Historical research**. | Immutable (historical artifact) |
| `traitor.text`, `KING3.text`, `hero.text` | **CHATGPT CONVERSATION EXPORTS** — Additional historical conversations. | **Historical research**, **When investigating constitutional sabotage** (traitor.text). | Immutable (historical artifacts) |

### OpenSpec Integration
| Directory/File | Purpose | When to Read | Update Frequency |
|----------------|---------|--------------|------------------|
| `openspec-AGENTS.md` | **OPENSPEC AGENT INSTRUCTIONS** — How to create and apply change proposals, spec format, project guidelines. | **When request mentions planning/proposals**, **When creating new capabilities**, **When ambiguous spec needed**. | When OpenSpec process evolves |
| `.claude/commands/openspec/` | **OPENSPEC SLASH COMMANDS** — proposal.md, apply.md, archive.md slash command definitions. | **When executing OpenSpec workflows** (reference command syntax). | When commands updated |

### Configuration & Setup
| Directory/File | Purpose | When to Read | Update Frequency |
|----------------|---------|--------------|------------------|
| `.brv/ace/` | **BYTEROVER MCP CONFIGURATION** — ByteRover Model Context Protocol setup (silent courier delivery system). | **When debugging silent courier failures**, **When MCP integration issues arise**. | When MCP config changes |
| `.cascade/mcp.json` | **MCP CONFIGURATION** — Model Context Protocol master config. | **When MCP issues arise**, **When adding new MCP servers**. | When MCP setup changes |
| `.claude/settings.local.json` | **CLAUDE CODE LOCAL SETTINGS** — Claude Code configuration. | **When Claude Code behavior unexpected**, **When changing local preferences**. | Per developer (local file) |

---

## 🧬 Tier 8: Documentation About Documentation (Meta)

### This File
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `DOCUMENTATION_INDEX.md` | **THIS FILE** — Central catalog of all governance documentation. | **When lost** ("where is X documented?"), **Onboarding new agents**, **Quarterly review** (ensure accuracy). | Real-time (Librarians update when new docs created) |

### Standard Operating Procedures
| File | Purpose | When to Read | Update Frequency |
|------|---------|--------------|------------------|
| `SOP_LIBRARY.md` | **SOP LIBRARY** — Step-by-step procedures for common tasks (commissioning agents, filing CIPs, adjudicating disputes, etc.). | **Before performing unfamiliar task**, **When process unclear**, **Training new agents**. | When procedures refined or new SOPs identified |

---

## 📊 Quick Reference Tables

### "I Need to Find..." → "Read This File"

| Question | Answer (File) |
|----------|---------------|
| What are the rules? | `ARKPASS_DEV_TENET_PRIME.md` |
| What should I work on? | `ACTIVE_ORDERS.md` → `CURRENT_STATUS.md` |
| Who are the active agents? | `CURRENT_STATUS.md` → `agents/registry/REGISTRY.yaml` |
| What happened in past sessions? | `logs/YYYY-MM-DD.md` |
| What's blocking work? | `CURRENT_STATUS.md` (Blockers section) |
| Has this been decided before? | `precedents/PRECEDENT_REGISTRY.md` (once created) OR `consigliere/briefings/` |
| How do I do task X? | `SOP_LIBRARY.md` |
| What's my role's authority? | `agents/genomes/{role}.genome.yaml` |
| How do I commission an agent? | `consigliere/briefings/ROYAL-DECREE-2025-11-08-01.md` (template) |
| What constitutional gaps exist? | `adjudications/2025-11/OUTSTANDING_ITEMS_NOT_FOUND_IN_CONSTITUTION.md` |
| What UI should I build? | `CIAMossad-UI-SPECS.md` |

### "I Am Role X, What Do I Read?"

| Role | Mandatory Reading (Priority Order) |
|------|------------------------------------|
| **ANY AGENT** | 1. `ARKPASS_DEV_TENET_PRIME.md` 2. `AGENTS.md` or `CLAUDE.md` 3. `CURRENT_STATUS.md` 4. `logs/2025-11-12.md` (today) 5. `ACTIVE_ORDERS.md` |
| **Builder** | + `agents/genomes/builder.genome.yaml` + `agents/mojos/AGENT-00001.yaml` (if you're 00001) |
| **Librarian** | + `agents/genomes/librarian.genome.yaml` + `DOCUMENTATION_INDEX.md` (this file) + Door ownership assignments |
| **Adjudicator** | + `agents/genomes/adjudicator.genome.yaml` + `adjudications/2025-11/` (past cases) + Constitutional gap analysis |
| **Consigliere** | + `agents/genomes/consigliere.genome.yaml` (once created) + `consigliere/briefings/` (all decrees) + `constitutional-improvements/` (all CIPs) |
| **Constitution Keeper** | + `agents/genomes/constitution-keeper.genome.yaml` (once created) + `constitutional-improvements/` + Gap analysis + All CIPs |
| **The Twins** | + `agents/genomes/twin*.genome.yaml` (once created) + `CIAMossad-UI-SPECS.md` + `VISUAL_MOCKUPS.md` + UI implementation examples |

---

## 🔄 Maintenance Protocol

**Librarian Responsibilities** (once Librarians commissioned):
1. **Update this index** within 24 hours of new document creation
2. **Quarterly audit** — Verify all file paths valid, last-updated dates accurate
3. **Archive cleanup** — Move old versions to archives/ per retention policy
4. **Link validation** — Ensure all cross-references between documents still valid

**Constitution Keeper Responsibilities**:
1. **Quarterly index review** — Ensure index aligned with constitution
2. **Identify documentation gaps** — "Should X be documented but isn't?"
3. **Propose documentation CIPs** — If major restructuring needed

**All Agents Responsibilities**:
- When creating NEW document: Notify Librarian to update index
- When referencing document: Use paths from this index (avoid hardcoding)
- When document seems outdated: File update request with Librarian

---

## 📊 Index Statistics

**Total Documents Cataloged**: 50+
**Tier 1 (Constitution)**: 4 files
**Tier 2 (Coordination)**: 4+ files (growing daily)
**Tier 3 (Agent Infrastructure)**: 10+ files
**Tier 4 (Governance Processes)**: 15+ files
**Tier 5 (Command Arena)**: 5+ files
**Tier 6 (Operating Handbooks)**: 2 files
**Tier 7 (Reference/Historical)**: 10+ files
**Tier 8 (Meta)**: 2 files

**Critical Missing Documents** (pending creation):
- `precedents/PRECEDENT_REGISTRY.md` (pending CIP approval)
- `agents/genomes/consigliere.genome.yaml` (pending commission)
- `agents/genomes/constitution-keeper.genome.yaml` (pending commission)
- `agents/genomes/twin-a.genome.yaml`, `twin-b.genome.yaml` (pending commission)
- Various Librarian MOJOs (pending commission)

---

## 🔄 Change Log

| Date | Version | Changes | Updated By |
|------|---------|---------|------------|
| 2025-11-12 | 1.0.0 | Initial DOCUMENTATION_INDEX.md creation. Cataloged 50+ documents across 8 tiers. Established quick-reference tables and maintenance protocol. | Claude Code (context-window-investigation) |

---

**END OF DOCUMENTATION_INDEX.md v1.0.0**

*Librarians: Keep this index current. Agents: Bookmark this file for fast navigation.*
