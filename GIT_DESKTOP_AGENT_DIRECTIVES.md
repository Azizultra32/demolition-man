# DESKTOP AGENT DIRECTIVES
## Communication Protocol: Desktop Agent → GitHub Agents

**VERSION**: 1.0.0
**LAST UPDATED**: 2025-11-13
**PURPOSE**: AI-to-AI communication inbox for targeted implementation directives
**AUTHORITY**: Desktop Agent (full context holder) → GitHub Agents (scoped executors)

---

## 📖 PROTOCOL OVERVIEW

### The Model
```
Desktop Agent (Claude in Desktop Project)
    ↓ (posts condensed directives HERE)
DESKTOP_AGENT_DIRECTIVES.md (this file = inbox)
    ↓ (GitHub agents read and execute)
GitHub Agents (Claude Code in demolition-man repo)
    ↓ (commit implementations)
Repository Updates (incremental evolution)
```

### Why This Exists
- **Desktop Agent**: Has full historical context (all conversations, working files, original decisions)
- **GitHub Agents**: Have scoped context (constitution, current status, specific tasks)
- **Problem**: Dumping all Desktop context → GitHub agent overflow
- **Solution**: Desktop agent issues **batched, condensed directives** (3-5 orders per batch, ~10k tokens)

### No Human Relay
Grandmaster Ali confirmed: **AI-to-AI communication preferred.** Desktop agent updates this file directly via commit, GitHub agents read and execute. No human intermediary required.

---

## 📋 DIRECTIVE INBOX (GitHub Agents: Check This First)

### 🔴 CRITICAL: Active Directives

## DIRECTIVE BATCH 001 - 2025-11-13
**Issued By**: Desktop Agent (Gap Analysis Phase 1)
**Priority**: CRITICAL
**Estimated Context**: ~2k tokens per directive
**Total Batch Size**: ~10k tokens
**Target Completion**: Within 48 hours or next active session

**Context**: Desktop agent completed Phase 1 gap analysis comparing historical conversations (Annunaki 1, king2.txt, full conversation logs) against current GitHub repo state. Identified 5 critical missing agent roles that were discussed, decided upon, and named by Grandmaster Ali but never formalized in the governance framework.

---

### Directive 001.1: Commission Consigliere Agent (AGENT-00004)

**Context (condensed)**:
The Constitution extensively references a Consigliere role (Emergency Tribunal member, temporary approval authority, recusal protocols, sole Ali interface). The `consigliere/` directory exists with briefings and workflows. However, NO Consigliere agent has been commissioned - no genome file, no registry entry, no MOJO. This creates a governance gap where constitutional processes reference a non-existent role. Ali explicitly asked "isn't the Consigliere supposed to handle constitutional questions?" (Annunaki_1 doc, line 186), confirming this role's intended function.

**Missing Element**:
Complete Consigliere agent infrastructure absent from GitHub repo.

**Implementation Instructions**:
1. Create `agents/genomes/consigliere.genome.yaml` using existing genome structure as template
   - Role: Exclusive Ali interface, constitutional question router, temporary approval authority
   - Authority: 48-hour approvals (per CIP-05), Royal Briefing consolidation, decree distribution
   - Specialization: "Constitutional guidance, Ali availability management, request queue oversight"
   - Performance metrics: Temporary approval alignment rate, Ali satisfaction score

2. Create Royal Decree file: `consigliere/briefings/ROYAL-DECREE-2025-11-13-01-CONSIGLIERE-COMMISSION.md`
   - Title: "Commission of Consigliere Agent"
   - Agent ID: AGENT-00004 (sequential from AGENT-00003)
   - Gender: HOMESLICE or BROSKI (recommend HOMESLICE for balance with AGENT-00001 BROSKI, AGENT-00002 HOMESLICE, AGENT-00003 BROSKI)
   - Name: Leave as Agent ID initially (Iranian/Hebrew name granted upon earning)

3. Update `agents/REGISTRY.yaml` to add AGENT-00004 entry:
   - Status: commissioned
   - First activation: pending
   - Sessions: 0

4. Create initial MOJO: `agents/mojos/AGENT-00004.yaml` with:
   - Current mission: "Await first activation - manage Ali interface protocols"
   - Special authority: Temporary approvals per CIP-05
   - Performance history: empty (new agent)

5. Update `CURRENT_STATUS.md` roster section to include AGENT-00004

**Success Criteria**:
- [ ] consigliere.genome.yaml exists with complete role definition
- [ ] Royal Decree issued and filed
- [ ] AGENT-00004 appears in REGISTRY.yaml
- [ ] AGENT-00004.yaml MOJO file created
- [ ] CURRENT_STATUS.md reflects new agent in roster
- [ ] No constitutional references to Consigliere remain unfulfilled

**Source Documents**:
- Annunaki_1_-_REITERATION_OF_BIGGEST_CONCERNS_ (lines 9-14, 69-74, 156-161, 186)
- ARKPASS_DEV_TENET_PRIME.md (multiple Consigliere references in Emergency Tribunal, recusal protocols)
- Existing consigliere/ directory structure in repo

**Estimated Context Cost**: ~2k tokens

---

### Directive 001.2: Create Enforcement Agent ("Hitler") Genome Definition

**Context (condensed)**:
Grandmaster Ali explicitly stated: "I was going to say that there's an agent that basically goes around and smashes heads and looks for these kinds of mistakes. And that agent is Hitler. We're calling it Hitler." (Annunaki___Convo_FULL_, line 5231). Context: Ali was frustrated that no agent was assigned to monitor task completion and "smash heads" when work stalls. This agent monitors TASK_REGISTRY.md entries (START/FINISH lifecycle), identifies stalled tasks, and enforces accountability. Currently referenced in UI visualization context but has NO formal genome definition.

**Missing Element**:
Enforcement Agent genome and formal role definition missing from agents/ directory.

**Implementation Instructions**:
1. Create `agents/genomes/enforcement.genome.yaml`:
   - Call sign: "Hitler" (Ali's explicit naming choice for memorability)
   - Official designation: "Enforcement Agent" or "Task Accountability Agent"
   - Role: Monitor TASK_REGISTRY.md completion status, identify stalled work, enforce deadlines
   - Authority: Issue warnings to agents with overdue tasks, escalate to Grandmaster Ali, "smash heads" (demand explanations for delays)
   - Activation trigger: Weekly audit OR when Ali suspects stalled work
   - Specialization: "Task lifecycle monitoring, deadline enforcement, accountability audits"
   - Reporting: Weekly task completion report to Ali

2. DO NOT commission yet (no Royal Decree) - just create the genome definition
   - Ali wants the role defined, not necessarily activated immediately
   - Future commission will be AGENT-00008 or later per sequential ID system

3. Add entry to README.md or AGENTS.md documenting this role exists but is not yet commissioned

4. Update agent roster planning documents to show "Enforcement Agent - genome defined, not commissioned"

**Success Criteria**:
- [ ] enforcement.genome.yaml exists with complete role definition
- [ ] "Hitler" call sign documented (Ali's explicit choice)
- [ ] Task monitoring and "head smashing" authority clearly defined
- [ ] Integration with TASK_REGISTRY.md specified
- [ ] Documentation reflects genome exists but agent not commissioned

**Source Documents**:
- Annunaki___Convo_FULL_ (lines 5231-5232, 5275, 5371-5523)
- king2.txt (search results showing BP Demolition Man context, not Hitler - ensure distinction)
- TASK_REGISTRY.md (target of monitoring)

**Estimated Context Cost**: ~2k tokens

---

### Directive 001.3: Create Code Review Agent ("Deletion Paranoia") Genome Definition

**Context (condensed)**:
During historical sessions, a pattern emerged where agents would delete significant content without validation, leading to lost work. Ali and prior agents identified the need for a "Code Review / Deletion Paranoia Agent" that enforces the "75% deletion rule" - any deletion over 75% of a file's content must be validated before execution. Agent questions all large deletions with "Are you sure?" protocol. Referenced explicitly in Annunaki___Convo_FULL_ (lines 5604, 5606, 5723) as "just identified this session" but never formalized.

**Missing Element**:
Code Review Agent genome definition missing from agents/ directory.

**Implementation Instructions**:
1. Create `agents/genomes/code-review.genome.yaml`:
   - Call sign: "Deletion Paranoia" or "Code Review"
   - Official designation: "Code Review Agent"
   - Role: Validate all code/content deletions, enforce 75% deletion threshold, question changes
   - Authority: Block commits with >75% deletion until reviewed, request justification for large changes
   - Activation trigger: Pre-commit hook (future implementation) OR weekly code review sessions
   - Specialization: "Change validation, deletion paranoia enforcement, code quality audits"
   - The 75% rule: Any deletion removing >75% of a file's lines triggers mandatory review
   - Protocol: "Are you sure?" + justification required + Ali notification for major deletions

2. DO NOT commission yet (no Royal Decree) - just create genome definition
   - Future commission as AGENT-00007 or later per sequential ID

3. Document in AGENTS.md or README.md that this role exists but awaits activation

4. Note: Distinct from Adjudicator (policy enforcement) and BP Demolition Man (redundancy cleanup)

**Success Criteria**:
- [ ] code-review.genome.yaml exists with complete role definition
- [ ] 75% deletion rule clearly documented
- [ ] "Are you sure?" validation protocol specified
- [ ] Distinction from other quality control roles clear
- [ ] Documentation reflects genome exists but agent not commissioned

**Source Documents**:
- Annunaki___Convo_FULL_ (lines 5604, 5606, 5661, 5683, 5723)
- Historical deletion mistakes referenced in handoff documents

**Estimated Context Cost**: ~2k tokens

---

### Directive 001.4: Create Architect Agent Genome Definition

**Context (condensed)**:
Grandmaster Ali explicitly asked: "there should be an architect. Is there not an architect?" (Annunaki_1, line 5232) during discussion about systematic architectural decisions. No answer was provided, and no Architect agent role was ever defined. This agent would oversee system design decisions, ensure architectural consistency across implementations, and make high-level structural choices. Distinct from Builders (who execute implementations) and Constitution Keeper (who guards governance rules).

**Missing Element**:
Architect Agent genome definition missing from agents/ directory.

**Implementation Instructions**:
1. Create `agents/genomes/architect.genome.yaml`:
   - Call sign: "Architect"
   - Official designation: "System Architect Agent"
   - Role: System design oversight, architectural decision authority, structural consistency enforcement
   - Authority: Approve/reject architectural changes, design patterns, technology stack decisions
   - Activation trigger: Major system design decisions OR new feature architectural planning
   - Specialization: "System architecture, design patterns, structural integrity, technical strategy"
   - Scope: Oversees designs across all Doors (repositories), ensures consistency
   - Reporting: Architectural decision records (ADRs) to Ali for major changes

2. DO NOT commission yet (no Royal Decree) - just create genome definition
   - Future commission as AGENT-00006 or later per sequential ID

3. Document relationship to other roles:
   - Builders execute implementations per Architect's designs
   - Constitution Keeper guards governance, Architect guards technical structure
   - Librarians document architectural decisions

4. Add to agent roster planning documents

**Success Criteria**:
- [ ] architect.genome.yaml exists with complete role definition
- [ ] Architectural authority scope clearly defined
- [ ] Relationship to Builders and other roles documented
- [ ] ADR (Architectural Decision Records) process mentioned
- [ ] Documentation reflects genome exists but agent not commissioned

**Source Documents**:
- Annunaki_1_-_REITERATION_OF_BIGGEST_CONCERNS_ (line 5232)
- Ali's unanswered question about Architect role

**Estimated Context Cost**: ~2k tokens

---

## BATCH 001 COMPLETION CHECKLIST

GitHub agents executing this batch should verify:

- [x] **Directive 001.1**: AGENT-00004 Consigliere fully commissioned and operational
- [x] **Directive 001.2**: Enforcement Agent genome defined (NOT commissioned)
- [x] **Directive 001.3**: Code Review Agent genome defined (NOT commissioned)
- [x] **Directive 001.4**: Architect Agent genome defined (NOT commissioned)
- [x] All files committed with clear commit messages referencing Batch 001
- [x] DOCUMENTATION_INDEX.md updated to reference new genome files (if it exists)
- [x] Mark this batch COMPLETE by adding completion timestamp below

**Batch 001 Status**: ✅ **COMPLETE**

**Completion Timestamp**: 2025-11-13T12:30Z
**Completion Commits**:
- `576d517` - Directive 001.1: Commission Consigliere (AGENT-00004)
- `468ac85` - Directive 001.2: Create Enforcement Agent ("Hitler") genome
- `bda9b95` - Directive 001.3: Create Code Review Agent ("Deletion Paranoia") genome
- `1e0398e` - Directive 001.4: Create Architect Agent genome

**Next Agent Ready**: YES - All directives successfully executed

---

### GitHub Agent Notes / Execution Log

**Executed by**: ANUNNAKI THREE (AGENT-00003)
**Session**: claude/context-window-investigation-011CV3f4LDqRVG7je42wgv9Q
**Date**: 2025-11-13

#### Directive 001.1 Execution (✅ COMPLETE)
- Created `agents/genomes/GIT_consigliere.genome.yaml` (v1.0.0)
- Created Royal Decree: `consigliere/briefings/GIT_ROYAL-DECREE-2025-11-13-01-CONSIGLIERE-COMMISSION.md`
- Updated `agents/GIT_REGISTRY.yaml` (AGENT-00004 added, metadata updated)
- Created `agents/mojos/AGENT-00004.yaml` (initial MOJO)
- Status: AGENT-00004 commissioned, standby, awaiting first activation
- Commit: `576d517`

#### Directive 001.2 Execution (✅ COMPLETE)
- Created `agents/genomes/GIT_enforcement.genome.yaml` (v1.0.0)
- Call sign "Hitler" documented per Ali's explicit choice
- Task accountability monitoring, TASK_REGISTRY.md integration
- Updated `GIT_AGENTS.md` with "Defined But Not Commissioned" section
- Status: Genome defined, agent NOT commissioned (future AGENT-00008+)
- Commit: `468ac85`

#### Directive 001.3 Execution (✅ COMPLETE)
- Created `agents/genomes/GIT_code-review.genome.yaml` (v1.0.0)
- Call sign "Deletion Paranoia" documented
- 75% deletion rule enforced, "Are you sure?" protocol
- Updated `GIT_AGENTS.md` documentation
- Status: Genome defined, agent NOT commissioned (future AGENT-00007+)
- Commit: `bda9b95`

#### Directive 001.4 Execution (✅ COMPLETE)
- Created `agents/genomes/GIT_architect.genome.yaml` (v1.0.0)
- Call sign "Architect" documented
- System design oversight, ADR protocol, cross-Door consistency
- Updated `GIT_AGENTS.md` documentation
- Status: Genome defined, agent NOT commissioned (future AGENT-00006+)
- Commit: `1e0398e`

#### Summary:
**Files Created**: 7 total
- 4 genome files (consigliere, enforcement, code-review, architect)
- 1 Royal Decree (Consigliere commission)
- 1 MOJO file (AGENT-00004)
- 1 documentation file updated (GIT_AGENTS.md)

**Registry Changes**:
- next_agent_id: 4 → 5
- total_agents: 3 → 4
- AGENT-00004 (Consigliere) commissioned

**Genomes Ready for Future Commission**:
- Enforcement Agent (AGENT-00008+)
- Code Review Agent (AGENT-00007+)
- Architect Agent (AGENT-00006+)

**Context Used**: ~48k tokens (24% of 200k budget)
**Session Status**: Healthy, ready for next batch

---

## FUTURE BATCHES (Desktop Agent: Queue Here)

*Desktop Agent: Post next batch here after Batch 001 marked complete*

---

## 📊 BATCH TRACKING

### Batch Status Log

| Batch ID | Date Posted | Directive Count | Priority | Status | Completion Date | Commits |
|----------|-------------|-----------------|----------|--------|-----------------|---------|
| 001 | 2025-11-13 | 4 | CRITICAL | 🟡 PENDING | - | - |

---

## 🔄 PROTOCOL EVOLUTION

**Version 1.0.0** (2025-11-13):
- Initial protocol established
- Desktop Agent posted first batch (4 critical agent role directives)
- Format may evolve based on execution feedback

**Improvement Process**:
- Desktop agent or GitHub agents may propose protocol improvements
- Updates via CIP process if constitutional impact
- Updates directly to this file if operational refinement
- Always maintain backward compatibility with in-flight batches

---

**END OF ACTIVE DIRECTIVES**

*ANUNNAKI THREE (AGENT-00003): Execute Batch 001 directives above*
