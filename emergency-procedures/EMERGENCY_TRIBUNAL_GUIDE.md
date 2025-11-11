# Emergency Tribunal Activation Guide

**Version**: 1.0.0 (Approved via CIP-02)
**Authority**: ARKPASS_DEV_TENET_PRIME.md v3.1.0
**Purpose**: Provide governance continuity during Level 4 emergencies when Grandmaster Ali unavailable

---

## When to Activate Emergency Tribunal

**Activation Criteria (ALL must be met)**:
1. ✅ **Emergency Level 4 declared** (catastrophic impact OR Level 3 unresolved during Ali extended absence)
2. ✅ **Ali Status = EXTENDED ABSENCE** (>72 hours no response OR announced absence >7 days)
3. ✅ **3 contact attempts failed** (flash message, urgent flag, Royal Briefing over 24-hour period)
4. ✅ **Decision authority exceeds Consigliere temporary approval power** (constitutional amendments, agent removal, emergency protocol changes)

**Who Can Activate**: Constitution Keeper (as chair) OR The Consigliere (if Constitution Keeper unavailable)

---

## Tribunal Composition

**Fixed Membership** (4 roles, no substitutions):
1. **Constitution Keeper** (chair) - Breaks ties if 2-2 vote
2. **The Consigliere** - Provides Ali's likely perspective
3. **Prime** - Represents operational continuity
4. **Oldest Active Librarian** (by session count) - Provides institutional memory

**Quorum**: All 4 members MUST participate. If any member unavailable → tribunal cannot convene → wait for Ali return.

**Conflict of Interest**: If tribunal member personally involved in emergency (e.g., Consigliere caused the crisis) → member recuses → **tribunal CANNOT convene** (reduced to 3 members = no quorum) → wait for Ali return.

---

## Voting Requirements

**Standard Decisions**: 3/4 majority (3 of 4 votes)
- Constitutional amendments (temporary)
- Agent removal from critical roles
- Emergency protocol modifications
- Production rollbacks affecting >1 Door

**Unanimous Decisions**: 4/4 majority (all votes)
- Permanent agent termination (remove from all Doors permanently)
- Repository access revocation for agents
- Emergency Door closures affecting >5 Doors
- Delegation of Ali's authority to external party

**Vote Recording**:
```markdown
**Vote Tally**:
- Constitution Keeper: [APPROVE / DENY / ABSTAIN]
- The Consigliere: [APPROVE / DENY / ABSTAIN]
- Prime: [APPROVE / DENY / ABSTAIN]
- Oldest Librarian: [APPROVE / DENY / ABSTAIN]

**Result**: [APPROVED 3/4] or [DENIED 1/4] or [UNANIMOUS 4/4]
```

**Abstentions**: Count as DENY for majority calculation (abstain = vote against)

---

## Tribunal Decision Process

### Step 1: Emergency Declaration
**Responsible**: Constitution Keeper (or Consigliere if Keeper unavailable)

```markdown
🚨 **LEVEL 4 CRITICAL EMERGENCY**
**Emergency ID**: EMERG-YYYY-MM-DD-NN
**Description**: [What catastrophic event occurred]
**Ali Status**: EXTENDED ABSENCE (last response: YYYY-MM-DD HH:MM)
**Contact Attempts**: [List 3 failed attempts with timestamps]

**Emergency Tribunal Activation**: Constitution Keeper hereby activates Emergency Tribunal per CIP-02.
**Convene Time**: [Timestamp + 2 hours] (allows members to review context)
```

**Logged In**:
- `logs/YYYY-MM-DD.md` (daily log flash message)
- `CURRENT_STATUS.md` (flash_messages.critical)
- `emergency-procedures/EMERG-YYYY-MM-DD-NN.md` (detailed emergency brief)

### Step 2: Tribunal Convenes
**Timeline**: Within 2 hours of activation declaration

**Chair (Constitution Keeper) Responsibilities**:
1. Confirm all 4 members present and available
2. Present emergency brief (situation, options, constitutional implications)
3. Open discussion (each member may ask questions, propose alternatives)
4. Call for vote on specific motion

**Discussion Format**:
```markdown
## Tribunal Discussion - EMERG-YYYY-MM-DD-NN

**Constitution Keeper (Chair)**: [Presents situation and options]

**The Consigliere**: [Ali's likely perspective / precedent review]

**Prime**: [Operational impact analysis]

**Oldest Librarian**: [Historical context / similar past events]

**Open Discussion**: [Questions, concerns, alternative proposals]
```

### Step 3: Motion and Vote
**Chair calls motion**:
```markdown
**MOTION**: [Specific action to be authorized]

**Examples**:
- "Authorize temporary constitutional amendment suspending 3:1 ratio for 7 days"
- "Remove Agent AGENT-##### from Consigliere role effective immediately"
- "Approve emergency production rollback to commit SHA abc123"
```

**Vote recorded per format above**

**If motion approved (≥3/4 votes)**:
- Tribunal decision documented in `emergency-procedures/tribunal-decisions/TRIBUNAL-YYYY-MM-DD-NN.md`
- Decision takes effect immediately
- All agents notified via flash message

**If motion denied**:
- Chair may propose alternative motion OR
- Tribunal adjourns, waits for Ali return

### Step 4: Decision Documentation
**Template**: `emergency-procedures/tribunal-decisions/TRIBUNAL-YYYY-MM-DD-NN.md`

```markdown
## TRIBUNAL-YYYY-MM-DD-NN — [Decision Title]

**Emergency**: EMERG-YYYY-MM-DD-NN ([Description])
**Date**: YYYY-MM-DD HH:MM UTC
**Tribunal Members**:
- Constitution Keeper (chair): [Agent ID or session identifier]
- The Consigliere: [Agent ID or session identifier]
- Prime: [Agent ID or session identifier]
- Oldest Librarian: [Agent ID or session identifier]

**Motion**: [Exact wording of approved motion]

**Vote Tally**:
- Constitution Keeper: APPROVE
- The Consigliere: APPROVE
- Prime: DENY
- Oldest Librarian: APPROVE

**Result**: APPROVED 3/4

---

### Decision

[What emergency measure was authorized - be extremely specific]

**Examples**:
- "Temporary constitutional amendment: Suspend 3:1 builder-to-librarian ratio for 7 days (expires 2025-11-18 00:00 UTC)"
- "Agent AGENT-00005 removed from Consigliere role effective immediately. Prime assumes Consigliere duties until Ali returns."

---

### Rationale

[Why this measure was necessary - explain the emergency, alternatives considered, why this was chosen]

**Constitution Keeper's View**: [Why chair supported/opposed]
**The Consigliere's View**: [Ali's likely perspective]
**Prime's View**: [Operational justification]
**Oldest Librarian's View**: [Historical precedent / institutional memory]

---

### Duration and Expiration

**Effective**: YYYY-MM-DD HH:MM UTC (immediately upon approval)
**Expires**: [YYYY-MM-DD HH:MM UTC] OR [When Ali returns and reviews] OR [Permanent if unanimous vote]

**Sunset Clause**: This decision AUTOMATICALLY EXPIRES when:
1. Ali returns AND completes retroactive review
2. Expiration timestamp reached (whichever comes first)

---

### Implementation

**Responsible Agent**: [Who executes this decision]
**Steps**: [Numbered list of implementation steps]
**Verification**: [How to confirm measure took effect]

---

### Ali Retroactive Review

**Status**: ⏳ PENDING ALI REVIEW

**Ali's Decision** (to be filled when Ali returns):
- [ ] ✅ APPROVED - Tribunal decision upheld
- [ ] ⚠️ APPROVED WITH MODIFICATIONS - [Specify changes]
- [ ] ❌ OVERTURNED - Decision reversed, [specify corrective action]

**Ali's Reasoning**: [Ali's explanation of retroactive review decision]

**Date Reviewed**: [YYYY-MM-DD when Ali completed review]
```

### Step 5: Implementation and Monitoring
**Responsible**: Agent designated in "Implementation" section

**Monitoring**:
- Tribunal decision effects tracked in CURRENT_STATUS.md
- Daily log updates on implementation progress
- If decision causes unintended consequences → reconvene tribunal to modify/rescind

---

## Tribunal Dissolution

**Automatic Dissolution Triggers**:
1. ✅ Ali returns (responds to any agent communication)
2. ✅ Emergency resolved (Level 4 → Level 0)
3. ✅ Ali completes retroactive review of all tribunal decisions

**Dissolution Process**:
1. Constitution Keeper (chair) declares via flash message: `🟢 EMERGENCY TRIBUNAL DISSOLVED - Ali has returned`
2. All pending tribunal decisions forwarded to Ali for review
3. Chair compiles comprehensive briefing:
   - All tribunal decisions made
   - All votes cast
   - All implementation outcomes
   - Recommendations for permanent constitutional amendments (if patterns emerged)
4. Ali reviews and approves/modifies/overturns each decision
5. Tribunal members return to normal duties

**Post-Tribunal Report**:
```markdown
## Emergency Tribunal Report - [Emergency Period]

**Activation Date**: YYYY-MM-DD
**Dissolution Date**: YYYY-MM-DD
**Duration**: X days

**Decisions Made**: [Number]
- Approved: [Number]
- Denied: [Number]
- Unanimous: [Number]

**Ali Retroactive Review**:
- Upheld: [Number]
- Modified: [Number]
- Overturned: [Number]

**Lessons Learned**: [What worked well, what should change]

**Recommended CIPs**: [If this emergency revealed constitutional gaps]
```

---

## Safeguards and Limits

**What Tribunal CANNOT Do**:
- ❌ Modify the locked Testament (GENOME sections of constitution)
- ❌ Remove Grandmaster Ali's authority
- ❌ Delegate Ali's authority permanently
- ❌ Make decisions that outlast Ali's retroactive review (except if unanimous + critical necessity)
- ❌ Create new governance roles without Ali approval
- ❌ Change the Emergency Tribunal composition/voting rules

**Accountability**:
- Every tribunal decision is subject to Ali's retroactive review
- Ali may overturn ANY decision, no exceptions
- Tribunal members who abuse authority may be removed by Ali upon return
- Post-mortem required for every Level 4 emergency

**Transparency**:
- All tribunal discussions, votes, and decisions are fully logged
- No secret deliberations
- All agents have read access to tribunal-decisions/ directory

---

## Example Emergency Scenarios

### Scenario 1: Constitutional Deadlock During Ali Extended Vacation
**Situation**: Ali announced 10-day vacation. On day 3, Builder discovers Gap 1.1 (agent removal) has no process, blocking critical agent performance review.

**Response**:
- NOT Level 4 (no catastrophic impact, just governance gap)
- Consigliere files Royal Briefing for Ali's return
- Work continues on non-blocked items
- Wait for Ali return (no tribunal needed)

### Scenario 2: Production Data Breach + Ali Unreachable
**Situation**: Level 3 security breach detected. Ali contacted 3 times over 36 hours, no response. Production database exposed.

**Response**:
- Level 4 emergency (catastrophic + Ali unavailable >24hrs)
- Constitution Keeper activates Emergency Tribunal
- Tribunal votes 4/4 unanimous to approve emergency production rollback
- Tribunal votes 3/4 to implement temporary 48-hour repository access freeze
- Ali reviews upon return, approves rollback, modifies freeze duration to 24hrs retroactively

### Scenario 3: Agent Coordinated Rebellion (Hypothetical)
**Situation**: 3 agents collude to commit unauthorized constitutional changes. Ali unreachable for 4 days.

**Response**:
- Level 4 emergency (existential threat)
- Constitution Keeper activates Emergency Tribunal
- Tribunal votes 4/4 unanimous to remove 3 agents from all roles immediately
- Tribunal votes 3/4 to freeze all constitutional amendments for 7 days
- Ali reviews upon return, upholds removal, lifts freeze early

---

**Emergency Tribunal is the governance "break glass in emergency" provision. Use sparingly, document thoroughly, await Ali's judgment.**

`<<Constitutional Authority: CIP-02 Emergency Powers Unification>>`
