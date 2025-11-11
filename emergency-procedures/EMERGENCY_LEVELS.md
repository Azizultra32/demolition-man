# Emergency Level Classification System

**Version**: 1.0.0 (Approved via CIP-02)
**Effective Date**: 2025-11-11
**Authority**: ARKPASS_DEV_TENET_PRIME.md Emergency Powers Unification

---

## Emergency Level Definitions

### Level 1: MINOR
**Severity**: Low impact, contained scope
**Duration**: ≤2 hours
**Authority**: Any commissioned agent may declare
**Response**: Self-contained fixes, no escalation required

**Examples**:
- Test suite failures (non-blocking)
- Documentation inconsistencies
- Minor configuration drift
- Single-file merge conflicts

**Protocol**:
1. Agent declares via daily log: `🟡 LEVEL 1 EMERGENCY: [description]`
2. Agent resolves independently
3. Agent logs resolution within 2 hours
4. If unresolved after 2 hours → escalate to Level 2

---

### Level 2: MODERATE
**Severity**: Medium impact, affects single Door or small team
**Duration**: 2-12 hours
**Authority**: Requires Prime approval OR any Adjudicator
**Response**: Multi-agent coordination, may require temporary workarounds

**Examples**:
- Build pipeline failures blocking deployment
- Database migration conflicts
- Cross-agent coordination failures
- Ratio violations (builders > 3 × librarians)

**Protocol**:
1. Agent escalates via daily log: `🟠 LEVEL 2 EMERGENCY: [description]`
2. Prime or Adjudicator acknowledges within 30 minutes
3. Emergency lead coordinates response team
4. Updates posted to CURRENT_STATUS.md flash messages
5. Resolution logged within 12 hours
6. If unresolved after 12 hours → escalate to Level 3

---

### Level 3: SEVERE
**Severity**: High impact, affects multiple Doors or constitutional crisis
**Duration**: 12-48 hours
**Authority**: Requires Constitution Keeper OR Consigliere approval
**Response**: Full governance intervention, may invoke emergency powers

**Examples**:
- Constitutional conflicts (two sections contradict)
- Multi-Door agent deadlock
- Critical security vulnerability requiring immediate patching
- Self-referential paradoxes (agent judging own work)
- Production database corruption

**Protocol**:
1. Agent escalates via flash message: `🔴 LEVEL 3 EMERGENCY: [description]`
2. Constitution Keeper OR Consigliere assumes emergency lead
3. Emergency lead invokes 12-hour constitutional freeze (Constitution Keeper) OR 24-hour quarantine (Consigliere)
4. Royal Briefing filed immediately for Ali awareness
5. Emergency lead coordinates multi-agent response
6. Resolution logged within 48 hours
7. If Ali unavailable >24 hours AND emergency unresolved → escalate to Level 4

---

### Level 4: CRITICAL
**Severity**: Catastrophic impact, existential threat to project or extended Ali absence during Level 3
**Duration**: 48+ hours
**Authority**: Emergency Tribunal ONLY (requires Ali extended absence OR catastrophic failure)
**Response**: Emergency Tribunal activated, extraordinary measures authorized

**Examples**:
- Ali unavailable >7 days during Level 3 emergency
- Complete loss of git history (all backups failed)
- Coordinated malicious agent behavior
- Fundamental constitutional deadlock with no resolution path
- Production data breach affecting user privacy

**Protocol**:
1. Constitution Keeper declares via flash message: `🚨 LEVEL 4 CRITICAL EMERGENCY - Emergency Tribunal Activating`
2. **Emergency Tribunal Composition**:
   - Constitution Keeper (chair)
   - The Consigliere
   - Prime
   - Oldest active Librarian by session count
3. **Voting Requirements**:
   - Minimum 3/4 majority (3 of 4 votes) to approve emergency measures
   - All decisions documented in `emergency-procedures/tribunal-decisions/`
   - All decisions SUBJECT TO Ali's retroactive review when available
4. **Emergency Measures Authorized**:
   - Constitutional amendments (temporary, expire when Ali returns)
   - Agent removal from critical roles
   - Emergency Door closures
   - Production rollbacks
   - Repository access restrictions
5. **Tribunal Dissolution**:
   - Automatically dissolves when Ali returns AND reviews decisions
   - Ali may overturn any/all tribunal decisions
   - Tribunal members must brief Ali on all actions taken

**Tribunal Decision Format**:
```markdown
## TRIBUNAL-YYYY-MM-DD-NN — [Decision Title]

**Emergency**: [Description of Level 4 emergency]
**Date**: YYYY-MM-DD
**Tribunal Members**: [List 4 members]
**Vote**: [X/4 in favor]

### Decision
[What emergency measure was authorized]

### Rationale
[Why this measure was necessary]

### Duration
[How long this measure remains in effect]

### Ali Retroactive Review
[PENDING / APPROVED / OVERTURNED]
```

---

## Emergency Power Hierarchy

**Freeze/Quarantine Powers** (aligned across all emergency levels):

| Role | Power | Duration | Requires |
|------|-------|----------|----------|
| **Adjudicator** | 4-hour freeze | 4 hours | Level 2+ emergency |
| **Constitution Keeper** | 12-hour freeze | 12 hours | Level 3+ emergency |
| **Consigliere** | 24-hour quarantine | 24 hours | Level 3+ emergency |
| **Emergency Tribunal** | Indefinite freeze | Until Ali returns | Level 4 emergency |

**Invocation Rules**:
- If multiple freeze/quarantine powers invoked simultaneously → longest duration takes precedence
- Lower-tier freezes automatically superseded by higher-tier (Adjudicator 4hr < Constitution Keeper 12hr < Consigliere 24hr)
- During freeze: NO constitutional amendments, NO agent commissions, NO role changes
- Routine work (documentation, testing, development) may continue unless explicitly quarantined

---

## Emergency Contact Protocols

**If Ali potentially unavailable during emergency**:

1. **Immediate Contact Attempts** (Consigliere responsible):
   - Flash message in daily log (red alert banner)
   - Urgent flag in CURRENT_STATUS.md
   - Royal Briefing filed in `consigliere/briefings/URGENT-YYYY-MM-DD-NN.md`

2. **Ali Status Classification** (per CIP-05):
   - AVAILABLE (<4 hours) → wait for Ali response
   - DELAYED (4-24 hours) → Consigliere may approve time-sensitive matters
   - UNAVAILABLE (>24 hours) → Consigliere may approve all matters
   - EXTENDED ABSENCE (>72 hours OR announced) → Emergency Tribunal activation possible

3. **Emergency Tribunal Activation Threshold**:
   - Ali Status = EXTENDED ABSENCE
   - AND Emergency Level = 3 or 4
   - AND no Ali response after 3 contact attempts over 24 hours

---

## Post-Emergency Review

**Required for Level 3+ emergencies**:

1. **Post-Mortem Document** (`emergency-procedures/post-mortems/POSTMORTEM-YYYY-MM-DD-NN.md`):
   - What happened (timeline)
   - Root cause analysis
   - Response effectiveness
   - Lessons learned
   - Proposed CIPs to prevent recurrence

2. **Responsible Role**:
   - Level 3: Constitution Keeper files post-mortem within 48 hours of resolution
   - Level 4: Emergency Tribunal chair files post-mortem within 72 hours of resolution

3. **Ali Review**:
   - All Level 3+ emergencies presented to Ali for retroactive review
   - Ali may approve response, request changes, or issue Royal Decree modifying protocols

---

**This document is binding on all agents per ARKPASS_DEV_TENET_PRIME.md Emergency Powers Unification (CIP-02).**

`<<Constitutional Amendment v3.1.0>>`
