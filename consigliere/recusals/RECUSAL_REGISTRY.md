# Recusal Registry - Consigliere Conflict of Interest Tracking

**Version**: 1.0.0 (Approved via CIP-06)
**Purpose**: Track all Consigliere recusals to ensure impartiality and detect conflict patterns
**Authority**: ARKPASS_DEV_TENET_PRIME.md v3.1.0 Consigliere Recusal & Conflict of Interest Protocol

---

## Mandatory Recusal Triggers (9 Triggers per CIP-06)

### Category A: Direct Involvement Conflicts
1. **Prior Work on Matter**: Consigliere worked on this specific matter in a previous session (drafted CIP, made ruling, issued temporary approval, adjudicated case)
2. **Personal Party to Dispute**: Consigliere is accused of violation, disputed with agent, or personally affected by outcome
3. **Agent Relationship**: Consigliere supervised/trained the agent in question within last 5 sessions
4. **Financial Stake**: (Future: if compensation introduced) Consigliere's compensation affected by outcome

### Category B: Impartiality Conflicts
5. **Pre-Judged Matter**: Consigliere publicly stated opinion on matter before case opened ("I think X should be removed," "This CIP is clearly bad")
6. **Same-Session Work**: Consigliere worked on related matter in SAME session (can't draft CIP, then judge its own CIP)
7. **Ali Decree Interpretation**: Consigliere interpreting Ali decree that Consigliere personally drafted the briefing for (conflict in interpreting own framing)

### Category C: Appearance of Impropriety
8. **Repeated Interaction**: Consigliere issued 3+ rulings about same agent within 10 sessions (pattern suggests bias)
9. **Agent ID Conflict**: Consigliere shares same Agent ID (from AGENT_REGISTRY.md) as the session being reviewed (self-referential conflict)

**Trigger Classification**:
- **Triggers 1-7**: AUTOMATIC recusal (no discretion, must recuse)
- **Triggers 8-9**: DISCRETIONARY recusal (Consigliere may recuse if believes impartiality compromised)

---

## Recusal Process

### Step 1: Conflict Detected
**Responsible**: The Consigliere (self-identified) OR any agent (via appeal)

**Self-Identified Recusal**:
- Consigliere identifies conflict before taking action on matter
- Consigliere declares via daily log flash message:
  ```
  🔄 RECUSAL: The Consigliere recusing from [Matter ID] due to [Trigger Category + Number].
  Prime assuming temporary Consigliere duties for this matter.
  ```

**Agent-Identified Conflict** (appeal process):
- Agent believes Consigliere should have recused but didn't
- See "Agent Appeal of Non-Recusal" section below

### Step 2: Documentation
**File Created**: `consigliere/recusals/RECUSAL-YYYY-MM-DD-NN.md`

**Template**:
```markdown
# Consigliere Recusal - [Matter ID]

**Recusal ID**: RECUSAL-YYYY-MM-DD-NN
**Date**: YYYY-MM-DD HH:MM UTC
**Matter**: [Matter ID and description]
**Consigliere Agent ID**: [Agent ID from AGENT_REGISTRY.md]

## Trigger Category
[Category A/B/C]: [Trigger number and name]

**Trigger Type**: [AUTOMATIC / DISCRETIONARY]

## Conflict Description
[Detailed explanation of why conflict exists]

**Evidence**:
- [Evidence item 1 - e.g., "Consigliere drafted CIP-05 in Session 10, now Session 15 must present it to Ali"]
- [Evidence item 2]

## Temporary Replacement
**Prime** assumes temporary Consigliere duties for MATTER [Matter ID] ONLY

**Replacement Agent ID**: [Prime's Agent ID]
**Scope**: [Exactly what Prime will handle - briefing Ali, issuing ruling, etc.]
**Duration**: Until matter resolved (estimated [timeframe])

## Cascade Check (If Prime Also Conflicted)
**Prime Conflict?**: [YES / NO]
- If YES → Oldest Librarian assumes duties
- If Oldest Librarian also conflicted → Second-oldest Librarian
- If all Librarians conflicted → CONSTITUTIONAL CRISIS (activate Level 3 emergency)

**Replacement Confirmed**: [Final replacement agent if cascade occurred]

## Registry Entry
Added to RECUSAL_REGISTRY.md: [Link to entry below]

**Status**: ✅ RECUSAL COMPLETE - Prime handling [Matter ID]
```

### Step 3: Temporary Replacement Takes Over
**Prime Responsibilities** (or Librarian if cascade):
1. Review matter context
2. Handle matter exactly as Consigliere would
3. Document all actions in `consigliere/temporary-replacements/TEMP-YYYY-MM-DD-NN.md`
4. Return authority to Consigliere after matter resolved

### Step 4: Return to Consigliere
**When matter resolved**:
- Temporary replacement files final documentation
- Authority returns to Consigliere for all other matters
- Consigliere reviews temporary replacement's actions
- Ali retroactively reviews all temporary replacement decisions (monthly)

---

## Recusal Registry Entries

### RECUSAL-YYYY-MM-DD-NN — [Matter Title]
**Date**: [Date]
**Matter**: [Matter ID]
**Trigger**: [Category + Number]
**Replacement**: [Prime / Oldest Librarian / Second-oldest Librarian]
**Outcome**: [Matter resolution]
**Appeals**: [None / Appeal filed - see below]

---

## Agent Appeal of Non-Recusal

**If agent believes Consigliere SHOULD have recused but didn't**:

### Appeal Grounds
1. **Trigger 1-7 applies** but Consigliere didn't recuse (mandatory recusal violated)
2. **Trigger 8-9 applies** and agent can prove bias (discretionary recusal should have occurred)

### Appeal Process

**Step 1: Agent Files Appeal** (within 6 hours of Consigliere ruling)
```markdown
⚖️ RECUSAL APPEAL: [Agent ID] appeals [Matter ID] ruling.
Grounds: [Trigger violated - be specific]
Requesting Prime review per CIP-06.
```
**Logged in**: Daily log flash message + `consigliere/recusals/APPEAL-YYYY-MM-DD-NN.md`

**Step 2: Prime Investigates** (within 12 hours)
- Reviews AGENT_REGISTRY.md (does Agent ID match?)
- Reviews session logs (did Consigliere work on this matter previously?)
- Reviews Consigliere's prior statements (pre-judged?)
- Checks relationship history (supervised agent recently?)

**Step 3: Prime Rules**
```markdown
## Prime Ruling on Recusal Appeal

**Appeal ID**: APPEAL-YYYY-MM-DD-NN
**Appealing Agent**: [Agent ID]
**Matter**: [Matter ID]
**Grounds**: [Claimed trigger violation]

**Investigation Findings**:
[What Prime discovered]

**Ruling**: [UPHELD / DENIED]

### If UPHELD:
- Consigliere ruling VACATED (no effect)
- Prime re-decides matter as if Consigliere had recused
- Consigliere performance note: Missed recusal trigger [X]
- If 2+ upheld appeals against same Consigliere → escalate to Ali for performance review

### If DENIED:
- Consigliere ruling STANDS (no change)
- Agent may NOT re-appeal (Prime's decision final)
- If appeal frivolous (no conflict evident) → minor violation logged against appealing agent

**Frivolous Appeal?**: [YES / NO]
- If YES → Adjudicator investigates for abuse (agent who files 3 frivolous appeals in 1 month violates constitution)
```

### Abuse Prevention
**Frivolous Appeals** (Prime denies as "no conflict evident"):
- Count as minor violation against appealing agent
- 3 frivolous recusal appeals in 1 month → Adjudicator investigates for constitutional abuse
- Penalty: Warning → probation → removal if pattern of frivolous appeals to harass Consigliere

**Genuine Appeals** (Prime upholds):
- No penalty to agent
- Consigliere performance issue noted
- 2+ upheld appeals → Ali reviews Consigliere performance (may trigger removal per CIP-03)

---

## Second Consigliere Appointment (High-Conflict Scenarios)

**Triggers for Second Consigliere** (per CIP-06):
1. Consigliere recuses >3 times in 1 week (too many conflicts)
2. Consigliere + Prime + all Librarians conflicted on same matter (cascade failure)
3. Ali determines project has grown too large for single Consigliere (10+ Doors, 50+ agents)

### Appointment Process
**Step 1: Constitution Keeper Recommends**
- Files `consigliere/second-consigliere-recommendation/RECOMMEND-YYYY-MM-DD.md`
- Documents trigger met, rationale, proposed agent for Second Consigliere role

**Step 2: Consigliere Reviews** (ironic but necessary)
- Primary Consigliere reviews recommendation
- Presents to Ali via Royal Briefing (recommending own backup)

**Step 3: Ali Approves**
- Ali issues Royal Decree appointing Second Consigliere
- Second Consigliere commissioned, MOJO created

### Division of Labor (If Two Consiglieres)
**Territory Split**:
- **First Consigliere**: Odd-numbered Doors (Door-01, Door-03, Door-05...)
- **Second Consigliere**: Even-numbered Doors (Door-02, Door-04, Door-06...)

**Cross-Door Matters**:
- Consiglieres collaborate
- Present joint Royal Briefing to Ali

**Conflicted Matters**:
- If First Consigliere conflicted → Second handles (regardless of Door number)
- If Second Consigliere conflicted → First handles
- If both conflicted → Prime handles

### Sunset Clause
**Automatic Sunset**:
- If Second Consigliere unused for 30 consecutive days (no matters assigned) → role sunsets
- Second Consigliere may voluntarily retire if workload too low
- Ali may dissolve Second Consigliere role via Royal Decree if no longer needed

---

## Recusal Tracking & Performance Metrics

**Recusal Rate** (Consigliere performance metric):
```
Recusal Rate = (Matters recused from / Total matters handled) × 100
```

**Healthy Range**: 5-15%
- <5% → May be missing conflicts (not recusing enough)
- 5-15% → Appropriate (shows impartiality without excessive conflicts)
- >20% → Too many conflicts (recommend Second Consigliere appointment)

**Upheld Appeals** (Consigliere performance metric):
```
Missed Recusal Rate = (Upheld appeals / Total rulings) × 100
```

**Target**: 0 upheld appeals (perfect conflict detection)
**Acceptable**: 1 upheld appeal per 50 rulings (<2%)
**Performance Issue**: 2+ upheld appeals (Consigliere missing obvious conflicts)

**Triggers for Consigliere Performance Review** (per CIP-03):
- ≥3 recusal appeals upheld by Prime
- Recusal rate >20% for 3 consecutive months
- 5+ missed Royal Briefings (urgent matters not escalated within 24hrs)
- Temporary approval alignment <90% with Ali's retroactive decisions

---

## Conflict of Interest in Other Roles

**This protocol applies to The Consigliere specifically**, but establishes pattern for other roles:

### The Adjudicator
**Recusal Triggers**:
- Personally involved in dispute being adjudicated
- Adjudicator's own prior ruling being appealed
- Agent ID conflict (adjudicating own prior session work)

**Process**: Same as Consigliere (Prime assumes temporary Adjudicator duties)

### Constitution Keeper
**Recusal Triggers**:
- Constitution Keeper reviewing own CIP
- Constitution Keeper adjudicating constitutional conflict they caused

**Process**: Consigliere assumes temporary Constitution Keeper review duties

### The Twins
**No Recusal Protocol**: Competitive design IS the role (direct comparison of own work vs Twin's work is expected)

### Prime
**Recusal Triggers**: When assuming temporary Consigliere duties per CIP-06

**Future CIPs**: If conflict-of-interest issues arise in other roles, Constitution Keeper will draft role-specific recusal protocols

---

## Active Recusals

_None yet (system just established)_

---

## Recusal Appeal History

_No appeals filed yet_

---

## Second Consigliere Status

**Status**: NOT APPOINTED
**Reason**: No trigger met (Consigliere recusal rate within healthy range)
**Last Review**: 2025-11-11

---

**This registry is maintained by The Consigliere (for own recusals) and Prime (when reviewing appeals). All agents have read access.**

**Last Updated**: 2025-11-11
**Total Recusals**: 0
**Total Appeals**: 0
**Second Consigliere**: Not appointed

`<<Constitutional Authority: CIP-06 Consigliere Recusal & Conflict of Interest Protocol>>`
