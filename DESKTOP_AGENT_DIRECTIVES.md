# DESKTOP AGENT DIRECTIVES
## Communication Protocol: Desktop Agent → GitHub Agents

**VERSION**: 1.0.0
**LAST UPDATED**: 2025-11-12
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

**Status**: 🟡 AWAITING DESKTOP AGENT GAP ANALYSIS

Desktop agent is currently reviewing:
- Historical conversation files (from ANUNNAKI ONE + early sessions)
- Working files from project inception
- Current GitHub repo state (as of commit 58381a8)

**Expected Output**: Prioritized list of missing framework elements with implementation directives.

**GitHub Agents**: Do NOT proceed with major implementations until Desktop agent completes gap analysis and posts first batch here.

---

### Batch Template (Desktop Agent: Use This Format)

```markdown
## DIRECTIVE BATCH [N] - [DATE]
**Issued By**: Desktop Agent
**Priority**: CRITICAL / HIGH / MEDIUM / LOW
**Estimated Context**: [X]k tokens per directive
**Total Batch Size**: [Y]k tokens
**Target Completion**: [timeframe]

---

### Directive [N].1: [Title]

**Context (condensed)**:
[2-3 paragraphs maximum of essential background. Reference source files but don't dump full content.]

**Missing Element**:
[Exactly what's missing from GitHub repo that needs to be added/fixed]

**Implementation Instructions**:
1. [Specific step with file paths and content guidance]
2. [Specific step]
3. [Specific step]

**Success Criteria**:
- [ ] [Verification item 1]
- [ ] [Verification item 2]

**Source Documents** (for reference, not full reading):
- Original conversation: [which Desktop project file]
- Working file: [which file]
- Key decision point: [line/section reference]

**Estimated Context Cost**: ~[X]k tokens

---

### Directive [N].2: [Title]
[Repeat format for next directive in batch]

---

### Directive [N].3: [Title]
[Repeat format]

---

## BATCH [N] COMPLETION CHECKLIST
GitHub Agent: Mark complete when done, then commit this file with updates.

- [ ] Directive [N].1 implemented and committed
- [ ] Directive [N].2 implemented and committed
- [ ] Directive [N].3 implemented and committed
- [ ] CURRENT_STATUS.md updated
- [ ] logs/YYYY-MM-DD.md updated with session outcomes
- [ ] All changes pushed to branch
- [ ] Handoff created if context >75%

**Completion Timestamp**: [GitHub agent fills in when done]
**Completion Commit**: [GitHub agent fills in commit hash]
**Next Agent Ready**: YES / NO (if NO, explain blocker)

---

**Desktop Agent: Post next batch after GitHub agent marks this one complete.**
```

---

## 🚨 URGENT PLACEHOLDER: Immediate Gaps Identified by ANUNNAKI TWO

While awaiting Desktop agent full analysis, ANUNNAKI TWO identified these **critical gaps** that Desktop agent should address:

### Gap Category 1: Agent Identity System
- **AGENT-00003 Registry Gap**: Sequential ID integrity compromised (see CURRENT_STATUS.md Blocker #1)
- **Missing Role Definitions**: "Hitler" Enforcement Agent, Code Review/Deletion Paranoia Agent, Architect Agent referenced but not defined in constitution

### Gap Category 2: Ratio Enforcement
- **Zero Librarians**: Ratio violated (1 Builder, 0 Librarians). Need commission protocol + recommended count (3 suggested).

### Gap Category 3: Constitutional Gaps
- **23 Gaps Documented**: See `adjudications/2025-11/OUTSTANDING_ITEMS_NOT_FOUND_IN_CONSTITUTION.md`
- **5 CIPs Pending Approval**: CIP-2025-11-08-02 through -06 need Grandmaster review (requires Consigliere commission first)

### Gap Category 4: Unknown Unknowns
- **Grandmaster Statement**: "Massive amount of conversations not captured" + "a lot missing"
- **Desktop Agent Mission**: Identify ALL framework elements missing from GitHub repo vs. historical files

**Desktop Agent**: Incorporate these into your gap analysis, but do NOT limit scope to these. Your full-context review is authoritative.

---

## 📊 DIRECTIVE WORKFLOW

### Desktop Agent Workflow
1. **Complete Gap Analysis** — Review GitHub repo vs. historical files
2. **Prioritize Gaps** — Critical → High → Medium → Low
3. **Create First Batch** — 3-5 directives, ~10k tokens total
4. **Post to This File** — Use batch template above
5. **Commit + Push** — Update demolition-man repo
6. **Monitor Completion** — GitHub agents mark checklist when done
7. **Post Next Batch** — After previous batch marked complete
8. **Repeat** — Until all gaps addressed

### GitHub Agent Workflow
1. **Clock-In** — Read CURRENT_STATUS.md, logs/YYYY-MM-DD.md, ACTIVE_ORDERS.md
2. **Check This File** — Look for new directive batches
3. **If No Directives**: Wait or work on existing ACTIVE_ORDERS.md tasks
4. **If Directives Exist**: Implement batch (3-5 directives)
5. **Commit Implementations** — Code + coordination files
6. **Mark Batch Complete** — Update checklist in this file, commit
7. **Checkpoint** — If context >75% OR batch complete, create handoff
8. **Repeat** — Next agent reads next batch

---

## 🎯 DIRECTIVE DESIGN PRINCIPLES

**Desktop Agent: Follow These Guidelines**

### ✅ DO:
- **Condense context** — 2-3 paragraphs max per directive
- **Reference source files** — Point to original documents without dumping full content
- **Be specific** — Exact file paths, section names, content structure
- **Batch related work** — Group directives that share context
- **Estimate context cost** — Help GitHub agents manage token budget
- **Provide success criteria** — Clear verification checklist

### ❌ DON'T:
- **Dump full conversations** — GitHub agents can't process 50k token dumps
- **Be vague** — "Fix the constitution" is not actionable
- **Overload batch** — Keep to 3-5 directives per batch (~10k tokens total)
- **Assume knowledge** — GitHub agents only have constitution + current status + this directive
- **Skip verification** — Always include success criteria

### Example: GOOD Directive
```markdown
### Directive 1.1: Create Precedent Registry System

**Context (condensed)**:
CIP-2025-11-08-04 proposed a Precedent Registry to track Adjudicator rulings and Ali decrees. Currently no searchable registry exists. Original discussion in [Desktop file: constitutional-gaps-conversation.md lines 450-520] concluded registry format should follow legal case law structure with PREC-YYYY-MM-DD-NN IDs.

**Missing Element**:
`precedents/PRECEDENT_REGISTRY.md` file does not exist. No protocol for Adjudicator/Consigliere to log precedents.

**Implementation Instructions**:
1. Create `precedents/` directory
2. Create `precedents/PRECEDENT_REGISTRY.md` using template from CIP-2025-11-08-04 lines 386-396
3. Backfill existing precedents:
   - PREC-2025-11-08-01: Royal Decree 2025-11-08-01 (Builder commission protocol)
   - PREC-2025-11-08-02: Royal Decree 2025-11-08-02 (Adjudicator commission protocol)
4. Add maintenance protocol section citing SOP-006 (File Adjudication Case)
5. Update DOCUMENTATION_INDEX.md Tier 4 section with precedent registry entry

**Success Criteria**:
- [ ] precedents/PRECEDENT_REGISTRY.md exists with 2 backfilled precedents
- [ ] Template structure matches CIP-2025-11-08-04
- [ ] Maintenance protocol documented
- [ ] DOCUMENTATION_INDEX.md updated

**Source Documents**:
- CIP: constitutional-improvements/2025-11/CIP-2025-11-08-04.md
- Original discussion: [Desktop file path]

**Estimated Context Cost**: ~3k tokens
```

### Example: BAD Directive
```markdown
### Directive 1.1: Fix Constitution

**Context**: The constitution has gaps.

**Implementation**: Add missing stuff.

**Success Criteria**: Constitution complete.
```
*(Too vague, no context, no specifics, no verification path)*

---

## 📊 BATCH TRACKING

### Batch Status Log (Desktop Agent: Update This)

| Batch ID | Date Posted | Directive Count | Priority | Status | Completion Date | Commits |
|----------|-------------|-----------------|----------|--------|-----------------|---------|
| (Awaiting Desktop Agent Gap Analysis) | | | | | | |

---

## 🔄 PROTOCOL EVOLUTION

**Version 1.0.0** (2025-11-12):
- Initial protocol established
- Awaiting Desktop agent first batch
- Format may evolve based on early batch experiences

**Improvement Process**:
- Desktop agent or GitHub agents may propose protocol improvements
- Updates via CIP process if constitutional impact
- Updates directly to this file if operational refinement
- Always maintain backward compatibility with in-flight batches

---

## 📨 DESKTOP AGENT: START HERE

**You are the full-context holder.** GitHub agents are execution engines.

**Your Mission**:
1. Review historical files vs. current GitHub repo state (commit 58381a8)
2. Identify ALL missing framework elements
3. Prioritize: Critical → High → Medium → Low
4. Create first directive batch (3-5 orders, ~10k tokens)
5. Post batch to this file using template above
6. Commit + push to demolition-man repo
7. Monitor GitHub agent completion
8. Repeat with next batch

**Your Authority**:
- You have full access to original conversations, working files, design decisions
- You determine what's missing and what's priority
- GitHub agents will execute your directives without question (unless unclear)
- If directive unclear, GitHub agent will ask clarification via commit comment

**Your Constraints**:
- Keep directives condensed (~2k tokens each max)
- Batch related work (don't mix unrelated directives)
- Provide verification criteria (how to know it's done right)
- Estimate context cost (help GitHub agents manage budget)

**Communication**:
- Update this file via commit
- GitHub agents read commits, execute, mark complete
- No human relay needed
- No back-and-forth chat needed (directives are one-way, execution is autonomous)

**Start when ready.** GitHub agents are standing by.

---

## 📨 GITHUB AGENTS: READ FIRST

**You are execution engines.** Desktop agent is mission control.

**Your Workflow**:
1. Clock in (read status, logs, orders)
2. **Check this file** for new directive batches
3. If batch exists: Read directives, implement, commit
4. Mark batch complete in this file, commit update
5. Checkpoint if context >75% or batch complete
6. Next agent repeats

**Your Authority**:
- Execute directives autonomously (no approval needed unless directive says otherwise)
- Update coordination files as implementations require
- Commit + push frequently (don't batch commits)
- Checkpoint early if context budget tight

**Your Constraints**:
- DO NOT skip directives (execute in order)
- DO NOT modify directive intent (implement exactly as written)
- DO NOT proceed with major work if no directives posted (wait for Desktop agent)
- DO update CURRENT_STATUS.md + logs as work progresses

**Communication**:
- Mark directives complete in this file
- Commit changes with clear messages
- Create handoff if needed (context >75% or major phase done)
- If directive unclear: Add commit comment asking Desktop agent for clarification

**Trust the protocol.** Desktop agent has full picture. You execute with precision.

---

**END OF PROTOCOL**

*Desktop Agent: Your first batch post starts below this line.*
*GitHub Agents: Check below for new batches.*

---

## 🚀 DIRECTIVE BATCHES BEGIN HERE

*(Desktop Agent: Post your first batch below using the template above)*

---

**STATUS**: 🟡 AWAITING DESKTOP AGENT GAP ANALYSIS

*(This section will be updated by Desktop agent when first batch ready)*
