# AGENT LIFECYCLE GUIDE

**VERSION**: 1.0.0
**CREATED**: 2025-11-13
**PURPOSE**: Agent clock-in/out procedures, checkpoint protocols, handoff requirements

---

## 📖 OVERVIEW

This guide defines the operational procedures for agent sessions from clock-in to clock-out, ensuring consistent documentation, context management, and handoff quality.

---

## 🔵 CLOCK-IN PROCEDURE

**Prerequisites**:
- [ ] Prime clearance obtained (ratio check passed)
- [ ] Agent GENOME + MOJO loaded
- [ ] Constitutional reading completed

**Steps**:
1. Read `GIT_ARKPASS_DEV_TENET_PRIME.md` (mandatory)
2. Read `GIT_CURRENT_STATUS.md` (Layer 1 snapshot)
3. Read `logs/YYYY-MM-DD.md` (today's log, Layer 2)
4. Read `GIT_ACTIVE_ORDERS.md` (mission directives)
5. Check `GIT_DESKTOP_AGENT_DIRECTIVES.md` for new batches
6. Log clock-in in daily log with tmux session and context budget
7. Begin work

**Reference**: See `SOP-007: Clock-In to Daily Session` in `GIT_SOP_LIBRARY.md`

---

## 📊 CHECKPOINT SUMMARIES

**Frequency**: At 50%, 75%, and 90% context usage

**Purpose**: Compress learnings, update status, prepare for potential handoff

**Steps**:
1. Deliver checkpoint summary in daily log
2. Update `GIT_CURRENT_STATUS.md` if reality changed
3. Update `GIT_ACTIVE_ORDERS.md` if tasks completed
4. Update agent MOJO with session progress
5. Consider handoff if context >75%

**Reference**: See `SOP-008: Deliver Checkpoint Summaries` in `GIT_SOP_LIBRARY.md`

---

## 🔴 CLOCK-OUT PROCEDURE

**Purpose**: Ensure clean session closure, status updates, and next-agent readiness

**Steps**:

### 1. Deliver 90% Context Summary
- Summarize session outputs, decisions, blockers
- Log in daily log with clear structure

### 2. Mission Completion Protocol (If Applicable)

**If completing a mission**:
- **Say explicitly**: `MISSION [ID] COMPLETE` in 90% summary
- **List deliverables clearly**:
  - Royal Briefing: `consigliere/briefings/ROYAL-BRIEFING-YYYY-MM-DD.md`
  - Commits: `abc1234, def5678`
  - Documentation: Updated X, Y, Z files
- **Per SOP-011**: Librarian will update `GIT_CURRENT_STATUS.md` within 2 hours

**Librarian responsibility**:
- Check daily logs for Builder "MISSION COMPLETE" announcements
- Execute `SOP-011: Mission Completion Status Updates` within 2 hours
- Failure results in [[MEH]] ribbon penalty

### 3. Update Coordination Files
- Update `GIT_CURRENT_STATUS.md` (status changes, blockers, metrics)
- Update `GIT_ACTIVE_ORDERS.md` (mark tasks complete if applicable)
- Commit all changes (code + coordination files)

### 4. Release File Locks
- Document file lock releases in daily log

### 5. Update Agent MOJO
- Within 30 minutes of clock-out
- Update session history, ratings, learnings
- Do NOT edit other agents' MOJOs

### 6. Create Handoff (If Needed)
- If context >75% OR major phase complete
- Create handoff document in `handoffs/YYYY-MM-DD-HH-MM-agent-name.md`

**Reference**: See `SOP-009: Clock-Out from Daily Session` in `GIT_SOP_LIBRARY.md`

---

## 🔄 HANDOFF PROTOCOL

**When to Create Handoff**:
- Context usage >75%
- Major phase complete (even if context <75%)
- Long-running task requiring continuation

**Handoff Contents**:
1. **Context Summary**: What was accomplished, what remains
2. **Blocker List**: Issues requiring resolution
3. **Next Steps**: Clear actions for next agent
4. **Critical Files**: Key files next agent should read
5. **Token Budget**: Remaining context estimate

**Location**: `handoffs/YYYY-MM-DD-HH-MM-agent-name.md`

---

## 📚 RELATED DOCUMENTATION

**Standard Operating Procedures**:
- `SOP-007: Clock-In to Daily Session` (`GIT_SOP_LIBRARY.md`)
- `SOP-008: Deliver Checkpoint Summaries` (`GIT_SOP_LIBRARY.md`)
- `SOP-009: Clock-Out from Daily Session` (`GIT_SOP_LIBRARY.md`)
- `SOP-011: Mission Completion Status Updates` (`GIT_SOP_LIBRARY.md`)

**Coordination Files**:
- `GIT_CURRENT_STATUS.md` — Layer 1 mission snapshot
- `logs/YYYY-MM-DD.md` — Layer 2 session ledger
- `GIT_ACTIVE_ORDERS.md` — RNA layer mission directives

**Constitutional Reference**:
- `GIT_ARKPASS_DEV_TENET_PRIME.md` — Full governance framework

---

## 🔄 CHANGE LOG

| Date | Version | Changes | Updated By |
|------|---------|---------|------------|
| 2025-11-13 | 1.0.0 | Initial AGENT_LIFECYCLE_GUIDE.md creation with clock-out section emphasizing SOP-011 mission completion protocol per Desktop Agent Directive 002.3 | ANUNNAKI THREE (AGENT-00003) executing Batch 002 |

---

**END OF AGENT_LIFECYCLE_GUIDE.md v1.0.0**

*Follow lifecycle procedures for session consistency. Update MOJOs within 30 minutes of clock-out.*
