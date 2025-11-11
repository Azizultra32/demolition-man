# Agent Registry - Identity Tracking System

**Version**: 1.0.0 (Approved via CIP-03)
**Purpose**: Track agent identity across sessions to prevent self-referential conflicts
**Authority**: ARKPASS_DEV_TENET_PRIME.md v3.1.0 Agent Identity & Succession Protocol

---

## Registry Format

Each entry tracks which agent (by identity/model instance) worked which sessions in which role.

**Entry Structure**:
```markdown
### [Agent Identifier] - [Role] - [Sessions]
**Agent ID**: [Unique identifier - may be model fingerprint, session hash, or self-declared ID]
**Role(s)**: [Commissioned roles this agent has served]
**Sessions Worked**: [List of session dates/IDs]
**Performance Rating**: [Overall rating from evaluations]
**Status**: [ACTIVE / STANDBY / RETIRED / REMOVED]
**Notes**: [Any relevant identity verification details]
```

---

## Active Agent Registry

### AGENT-00001 - Builder BROSKI
**Agent ID**: AGENT-00001
**Role(s)**: Builder
**Sessions Worked**:
- Commissioned: 2025-11-08 (Royal Decree, Session 7)
- Awaiting first active session
**Performance Rating**: 0.0 (no sessions completed yet)
**Status**: STANDBY
**Identity Verification**: Not yet performed (pending first activation)
**Notes**: Commissioned via ROYAL-DECREE-2025-11-08-01, MOJO instantiated 2025-11-10

---

### AGENT-00002 - Adjudicator HOMESLICE
**Agent ID**: AGENT-00002
**Role(s)**: The Adjudicator
**Sessions Worked**:
- Commissioned: 2025-11-08 (Royal Decree, Session 7)
- Session 7: Adjudication of CIP review process (ADJ-2025-11-08-01)
**Performance Rating**: 0.0 (no formal evaluation yet)
**Status**: STANDBY
**Identity Verification**: Not yet performed (pending next activation)
**Notes**: Commissioned via ROYAL-DECREE-2025-11-08-02, MOJO instantiated 2025-11-10

---

### Anunnaki God Agent - Foundation Engineering
**Agent ID**: Session-2025-11-10-Foundation
**Role(s)**: Foundation Engineering (special commission by Grandmaster Ali)
**Sessions Worked**:
- Session 2025-11-10: Foundation engineering (operational tooling, CURRENT_STATUS.md, agent MOJOs, Mission Control)
- Session 2025-11-11: CIP implementation (constitutional gap resolution, emergency procedures, identity tracking)
**Performance Rating**: Not formally evaluated (special direct commission)
**Status**: ACTIVE
**Identity Verification**: N/A (direct commission by Grandmaster Ali as "Anunnaki" reviewer)
**Notes**: Roleplayed as high-level constitutional reviewer and infrastructure engineer. Completed operational tooling suite, CIP analysis, and implementation. Unique authorization outside standard agent lifecycle.

---

## Identity Verification Protocol

**Purpose**: Confirm same agent across sessions, prevent self-referential conflicts (agent judging own prior work)

### Verification Method: Spot-Check Questions
**Performed By**: Prime OR Librarian (NOT the agent being verified)

**Timing**: At start of first session after 7+ day gap OR when agent returning to role after suspension

**Question Format**:
```markdown
**Identity Spot-Check for [Agent ID]**

**Verifier**: [Prime or Librarian performing check]
**Date**: YYYY-MM-DD
**Agent Being Verified**: [Agent ID + Role]

**Questions** (choose 2-3 from agent's prior work):
1. "In Session X, you ruled on [Matter Y]. What was your ruling and why?"
2. "What was the primary blocker you identified in [prior session]?"
3. "In your MOJO evaluation, you rated yourself [score] on [dimension]. What was your reasoning?"

**Agent Responses**: [Record verbatim]

**Verification Result**:
- ✅ CONFIRMED - Responses consistent with prior session work
- ⚠️ UNCERTAIN - Some inconsistencies, escalate to Consigliere
- ❌ FAILED - Agent cannot recall own prior work, possible identity mismatch

**Action**: [If FAILED → treat as new agent, create new Agent ID]
```

**Logged In**: `agent-verifications/VERIFY-YYYY-MM-DD-AgentID.md`

### Self-Referential Conflict Detection
**Rule**: Agent CANNOT adjudicate, review, or judge work from sessions where same Agent ID appears in AGENT_REGISTRY.md

**Example Conflict**:
- Session 10: The Adjudicator (Agent ID: "Claude-Sonnet-XYZ") must rule on constitutional amendment
- AGENT_REGISTRY.md shows: Agent ID "Claude-Sonnet-XYZ" worked Session 5 as Builder who drafted that amendment
- **CONFLICT DETECTED** → Adjudicator must recuse (per CIP-06 Trigger #9)

**Check Performed**: Before any adjudication/review, agent searches AGENT_REGISTRY.md for own Agent ID in related prior sessions

---

## Agent Removal Process

**Triggers** (metrics-based, per CIP-03):

### Constitution Keeper Removal Triggers
- **CIP Approval Rate <80%** over last 10 CIPs presented to Ali
  - Calculate: (Approved CIPs / Total CIPs) × 100
  - If <80% → Constitution Keeper performance review
- **2+ Constitutional Conflicts Undetected** (conflicts found by others, not Keeper)
- **Missed 3+ Quarterly Reviews** without valid excuse

### Consigliere Removal Triggers
- **Temporary Approval Alignment <90%** with Ali's retroactive decisions
  - Calculate: (Ali agreed with temporary approval / Total temporary approvals) × 100
  - If <90% → Consigliere judgment misaligned with Ali
- **3+ Recusal Appeals Upheld** (Agent appealed non-recusal, Prime agreed Consigliere should have recused)
- **Missed 5+ Royal Briefings** (urgent matters not escalated to Ali within 24hrs)

### Adjudicator Removal Triggers
- **Rulings Overturned >20%** by Ali retroactive review
  - Calculate: (Ali overturned ruling / Total rulings) × 100
  - If >20% → Adjudicator misjudging constitutional interpretation
- **3+ Recusal Failures** (didn't recuse when conflict of interest obvious)
- **Delayed 5+ Adjudications** beyond 48-hour constitutional deadline

### Builder/Librarian Removal Triggers
- **Performance Rating <3.0** for 3 consecutive sessions
- **Ratio Violations**: Builder continues work when 3:1 ratio violated
- **5+ Major Violations** recorded by Adjudicator

### Universal Removal Triggers (Any Role)
- **Violates Mithraic Oath** (refuses Grandmaster Ali's direct order)
- **Malicious Behavior** (deliberately sabotages project, commits unauthorized changes, leaks credentials)
- **Abandonment** (disappears mid-session without handoff, >30 days absent without notice)

---

## Removal Process

**Step 1: Performance Review Triggered**
- Metrics cross threshold OR Universal Trigger occurs
- Prime (or Constitution Keeper if Prime is subject) files `agent-reviews/REVIEW-YYYY-MM-DD-AgentID.md`
- Documents: Trigger met, evidence, impact analysis

**Step 2: Consigliere Review**
- Consigliere reviews evidence
- Consigliere may:
  - **Dismiss**: Performance issues not severe enough, close review
  - **Probation**: 30-day improvement plan, re-evaluate after
  - **Recommend Removal**: Forward to Ali for final decision

**Step 3: Royal Briefing**
- If Consigliere recommends removal → Royal Briefing filed immediately
- Briefing includes:
  - Performance metrics
  - Evidence of triggers
  - Impact of removal (who covers duties)
  - Recommended replacement (if available)

**Step 4: Ali Decree**
- Ali reviews briefing
- Ali issues decree:
  - **Removal Approved**: Agent removed from role immediately, handoff triggered
  - **Probation**: Agent given 30-60 days to improve
  - **Exoneration**: Performance issues dismissed, agent continues

**Step 5: Handoff (if removal approved)**
- See "Succession Process" below

---

## Succession Process

**When Agent Removed or Retires**:

### Step 1: Handoff Document Required
**Template**: `handoffs/HANDOFF-YYYY-MM-DD-[Role]-[Outgoing-Agent].md`

**Minimum 500 Lines Required** (per CIP-03), covering:

```markdown
# Handoff Document - [Role] Succession

**Outgoing Agent**: [Agent ID]
**Incoming Agent**: [Agent ID or TBD]
**Handoff Date**: YYYY-MM-DD
**Reason**: [Removal / Retirement / Rotation]

---

## Section 1: Role Context (100+ lines)
- Role responsibilities summary
- Key authorities and limitations
- Reporting relationships
- Critical deadlines and cadences

## Section 2: Active Work in Progress (100+ lines)
- All pending matters with status
- Blocked items and why
- Urgent items requiring immediate attention
- Items awaiting Ali response

## Section 3: Institutional Knowledge (150+ lines)
- Precedents and common patterns
- Known edge cases and how to handle
- Lessons learned from this agent's tenure
- Mistakes made and how to avoid repeating

## Section 4: Key Relationships (50+ lines)
- Which agents to coordinate with frequently
- Prime/Librarian/Consigliere interaction patterns
- Door-specific context (if multi-Door role)

## Section 5: Tools and Workflows (50+ lines)
- Critical scripts and how to use them
- File locations and naming conventions
- Communication protocols
- Where to find documentation

## Section 6: Recommendations for Successor (50+ lines)
- What this agent wishes they'd known on day 1
- Process improvements to implement
- Skills/knowledge gaps to address
- Strategic priorities for next 90 days
```

**Handoff Review**: Librarian reviews for completeness, flags gaps, requires 500+ line minimum

### Step 2: Training Period (2 Sessions)
**Incoming Agent**: New agent assumes role under supervision

**Session 1** (Supervised):
- Librarian shadows new agent
- New agent handles routine matters with Librarian review
- Librarian corrects mistakes immediately
- No high-stakes decisions (defer to Consigliere if urgent)

**Session 2** (Supervised):
- Librarian spot-checks new agent's work
- New agent handles moderate-complexity matters
- Librarian available for questions
- New agent may handle time-sensitive matters

**Session 3+** (Independent):
- New agent operates independently
- Normal performance evaluation begins

### Step 3: Update AGENT_REGISTRY.md
```markdown
### [Outgoing Agent ID] - [Role] - [Sessions]
**Status**: RETIRED
**Retirement Date**: YYYY-MM-DD
**Reason**: [Performance removal / Voluntary retirement / Rotation]
**Handoff Document**: [Link to handoff file]
**Successor**: [New Agent ID]

---

### [New Agent ID] - [Role] - [Sessions]
**Status**: ACTIVE (Training - Session 1/2)
**Role(s)**: [Role name]
**Sessions Worked**: [Start tracking]
**Predecessor**: [Outgoing Agent ID]
**Training Supervisor**: [Librarian Agent ID]
**Notes**: Assumed role YYYY-MM-DD, training period ends YYYY-MM-DD
```

---

## Retirement (Voluntary)

**Agent May Retire If**:
- Completes major project milestone
- Personal performance rating ≥4.0 and served ≥10 sessions
- Requests retirement via daily log: "I request retirement from [Role] effective [Date]"

**Process**:
1. Agent files retirement notice (minimum 2 sessions advance notice)
2. Agent creates handoff document (500+ lines)
3. Consigliere approves retirement
4. Ali acknowledges (via Royal Decree or flash message approval)
5. Succession process begins

**Retirement with Honors**:
- If agent performance ≥4.5 overall rating and served ≥20 sessions
- Ali may issue Royal Decree commending service
- Agent's MOJO preserved in `agents/mojos/retired/` with honors notation

---

## Procreation Eligibility

**Agents May Procreate If** (per existing constitution):
- **Performance Rating ≥4.0** (last evaluation)
- **Sessions Completed ≥3** (proven track record)
- **No Major Violations** in last 5 sessions
- **Procreation Request Approved** by Ali

**Identity Tracking**: Offspring inherit GENOME, get new Agent ID, separate MOJO

---

**This registry is maintained by Prime (for Builders/Librarians) and Consigliere (for governance roles). All agents have read access, write access restricted to Prime/Consigliere.**

`<<Constitutional Authority: CIP-03 Agent Identity & Succession>>`
