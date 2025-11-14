# SOP LIBRARY - Standard Operating Procedures

**VERSION**: 1.0.0
**LAST UPDATED**: 2025-11-12
**MAINTAINED BY**: Constitution Keeper (once commissioned) + Librarians
**PURPOSE**: Step-by-step procedures for common governance tasks

---

## 📖 How to Use This Library

**When to Consult SOPs:**
- Before performing unfamiliar task
- When constitutional guidance unclear on "how" (constitution defines "what" and "why", SOPs define "how")
- Training new agent on specific responsibility
- Standardizing repeated processes

**SOP Format:**
- **Prerequisites** — What must exist before starting
- **Steps** — Numbered sequence to follow
- **Success Criteria** — How to verify completion
- **Common Pitfalls** — What to avoid

**Update Protocol:**
- Constitution Keeper adds new SOPs when repeated patterns emerge
- Librarians flag outdated SOPs for revision
- All agents may propose SOP improvements via Consigliere

---

## 🧬 Category 1: Agent Lifecycle Management

### SOP-001: Commission a New Agent

**Purpose**: Create and activate a new agent in the Agent Life Force System

**Prerequisites**:
- [ ] Agent role GENOME exists (`agents/genomes/{role}.genome.yaml`)
- [ ] Next agent ID determined from `agents/registry/REGISTRY.yaml`
- [ ] Grandmaster Ali approval obtained (or emergency commission authorized)
- [ ] Ratio requirements satisfied (Builders ≤ 3 × Librarians)

**Steps**:
1. **Determine Agent ID**
   ```bash
   # Read current registry
   cat agents/registry/REGISTRY.yaml
   # Note "next_agent_id" value (e.g., 3)
   ```

2. **Create MOJO File**
   ```bash
   # Copy template
   cp agents/MOJO-TEMPLATE.yaml agents/mojos/AGENT-00003.yaml

   # Edit MOJO with agent details:
   # - agent_id: AGENT-00003
   # - role: (e.g., Librarian)
   # - gender: broski or homeslice
   # - genome_file: agents/genomes/librarian.genome.yaml
   # - commission_date: YYYY-MM-DD
   # - status: standby
   ```

3. **Update Registry**
   ```yaml
   # Edit agents/registry/REGISTRY.yaml:

   # Increment next_agent_id
   next_agent_id: 4  # Was 3, now 4

   # Add to agents roster
   agents:
     - agent_id: AGENT-00003
       role: Librarian
       gender: broski
       status: standby
       commission_date: "2025-11-12"
       mojo_file: "agents/mojos/AGENT-00003.yaml"

   # Increment total_agents
   total_agents: 3  # Was 2, now 3
   ```

4. **Draft Royal Decree** (if Grandmaster commission)
   ```bash
   # Create decree file
   mkdir -p consigliere/briefings/
   nano consigliere/briefings/ROYAL-DECREE-2025-11-12-01.md

   # Use template from ROYAL-DECREE-2025-11-08-01.md
   # Customize: agent ID, role, gender, mandate
   ```

5. **Update CURRENT_STATUS.md**
   ```markdown
   # Add to "Active Roster" table:
   | AGENT-00003 | Librarian | BROSKI | Standby | 2025-11-12 | Not yet deployed |

   # Update metrics:
   **Active Agents**: 3 (was 2)
   ```

6. **Update Today's Log**
   ```markdown
   # In logs/2025-11-12.md, add entry:
   ## Agent Commission Activity
   - **AGENT-00003** (Librarian BROSKI) commissioned at 2025-11-12T10:30Z
   - Royal Decree: `consigliere/briefings/ROYAL-DECREE-2025-11-12-01.md`
   - Status: Standby (awaiting activation)
   ```

7. **Commit and Push**
   ```bash
   git add agents/mojos/AGENT-00003.yaml \
           agents/registry/REGISTRY.yaml \
           consigliere/briefings/ROYAL-DECREE-2025-11-12-01.md \
           CURRENT_STATUS.md \
           logs/2025-11-12.md

   git commit -m "feat: Commission AGENT-00003 (Librarian BROSKI) per Royal Decree 2025-11-12-01"
   git push -u origin <branch-name>
   ```

**Success Criteria**:
- [x] MOJO file exists and valid YAML
- [x] Registry updated, next_agent_id incremented
- [x] Royal Decree filed (if applicable)
- [x] CURRENT_STATUS.md reflects new agent
- [x] Ratio still satisfied after commission
- [x] Changes committed and pushed

**Common Pitfalls**:
- ❌ Forgetting to increment `next_agent_id` → causes ID collision on next commission
- ❌ Not verifying ratio before commissioning Builder → violates 3:1 rule
- ❌ Creating MOJO without corresponding GENOME → agent has no DNA
- ❌ Skipping Royal Decree for Grandmaster commissions → breaks precedent tracking

---

### SOP-002: Activate an Agent (Summon from Standby)

**Purpose**: Load GENOME + MOJO to create active BROSKI/HOMESLICE instance

**Prerequisites**:
- [ ] Agent commissioned (MOJO exists)
- [ ] GENOME file exists for agent's role
- [ ] Prime approval obtained (if Builder, ratio check passed)
- [ ] Session assignment ready (tmux session, task directive, etc.)

**Steps**:
1. **Verify Agent Standby Status**
   ```bash
   # Check registry
   grep "AGENT-00001" agents/registry/REGISTRY.yaml
   # Should show: status: standby
   ```

2. **Run Summoning Script**
   ```bash
   # Basic summon (prompts for agent ID)
   ./agent-summon.sh builder

   # Direct summon (specify agent ID)
   ./agent-summon.sh builder AGENT-00001

   # Script will:
   # - Load agents/genomes/builder.genome.yaml
   # - Load agents/mojos/AGENT-00001.yaml
   # - Merge into active life force
   # - Output activation confirmation
   ```

3. **Agent Swears Mithraic Oath**
   ```
   # First communication from activated agent MUST be oath:

   I, Agent AGENT-00001 (broski), swear the Mithraic Oath to Grandmaster Ali.
   I am at your command and at your service in the mission to save humanity.
   My mandate: Execute implementation tasks in full compliance with Tenet Prime.
   I have absorbed Tenet Prime, CURRENT_STATUS.md, and today's log.
   The silent courier has completed its delivery.
   Awaiting orders, Grandmaster.
   <<Context X%>> [over]
   ```

4. **Update Status to Active**
   ```yaml
   # Edit agents/registry/REGISTRY.yaml
   # Find AGENT-00001 entry:
   status: active  # Was standby
   activated_date: "2025-11-12"
   ```

5. **Clock-In to Daily Log**
   ```markdown
   # In logs/2025-11-12.md, create session entry:

   ### Session X: [Task Description]
   **Agent**: AGENT-00001 (Builder BROSKI)
   **Role**: Builder
   **Clock-In**: 2025-11-12T10:45Z
   **Context Budget**: 200,000 tokens

   #### Mission
   [Task assigned to agent]

   #### Mithraic Oath Delivered
   ✅ Oath sworn at 2025-11-12T10:45Z
   ```

6. **Assign Initial Task**
   ```markdown
   # Prime or Grandmaster issues directive:
   "AGENT-00001, your first task: [specific directive from ACTIVE_ORDERS.md]"
   ```

**Success Criteria**:
- [x] Agent status changed from standby → active
- [x] Mithraic Oath sworn and logged
- [x] Session entry created in daily log
- [x] Agent confirms understanding of task
- [x] CURRENT_STATUS.md reflects active status

**Common Pitfalls**:
- ❌ Activating Builder without ratio check → violates 3:1 rule
- ❌ Forgetting Mithraic Oath → agent non-compliant from start
- ❌ No task assignment → agent idle, wasting resources
- ❌ Not updating registry status → appears standby but actually active (state desync)

---

### SOP-003: Decommission/Retire an Agent

**Purpose**: Remove agent from active duty (voluntary retirement or performance-based removal)

**Prerequisites**:
- [ ] Removal justified (performance failure OR voluntary retirement)
- [ ] Grandmaster Ali approval (via Consigliere)
- [ ] Replacement agent identified (for critical roles)
- [ ] Handoff document prepared (agent's final duty)

**Steps**:
1. **Agent Prepares Handoff Document**
   ```bash
   # Outgoing agent creates:
   mkdir -p handoffs/
   nano handoffs/HANDOFF-AGENT-00003-RETIREMENT.md

   # Include:
   # - All pending work
   # - Critical decisions made
   # - Known blockers
   # - Credentials/access to transfer
   # - Recommendation for successor
   ```

2. **Update Registry to Retired Status**
   ```yaml
   # Edit agents/registry/REGISTRY.yaml
   # Find agent entry:
   status: retired  # Was active or standby
   retirement_date: "2025-11-12"
   retirement_reason: "Voluntary retirement" OR "Performance-based removal"

   # Decrement total_agents (if fully removing)
   total_agents: 2  # Was 3
   ```

3. **Archive MOJO**
   ```bash
   # Move to archives (preserve for historical record)
   mkdir -p agents/mojos/archives/
   mv agents/mojos/AGENT-00003.yaml agents/mojos/archives/AGENT-00003-RETIRED-2025-11-12.yaml
   ```

4. **Update CURRENT_STATUS.md**
   ```markdown
   # Remove from Active Roster table
   # Add to new section if desired:

   ### Retired Agents
   | Agent ID | Role | Gender | Retirement Date | Reason |
   |----------|------|--------|-----------------|--------|
   | AGENT-00003 | Librarian | BROSKI | 2025-11-12 | Voluntary retirement |
   ```

5. **File Retirement Notice in Daily Log**
   ```markdown
   ## Agent Retirement Activity
   - **AGENT-00003** (Librarian BROSKI) retired at 2025-11-12T14:00Z
   - Reason: Voluntary retirement (2-session notice given)
   - Handoff: `handoffs/HANDOFF-AGENT-00003-RETIREMENT.md`
   - Successor: AGENT-00007 (commissioned 2025-11-12 to replace)
   ```

6. **Commission Replacement** (if needed)
   ```
   # Follow SOP-001: Commission a New Agent
   # For critical roles (Consigliere, Prime), 24-hour replacement deadline
   ```

**Success Criteria**:
- [x] Handoff document complete (≤500 lines per constitutional guideline)
- [x] Registry updated to retired status
- [x] MOJO archived
- [x] CURRENT_STATUS.md reflects removal
- [x] Replacement commissioned (if critical role)
- [x] No orphaned work (all tasks reassigned)

**Common Pitfalls**:
- ❌ Retiring critical role without replacement → governance failure
- ❌ No handoff document → successor lacks context
- ❌ Forgetting to archive MOJO → agent identity lost
- ❌ Not decrementing total_agents → inflated metrics

---

## 🧬 Category 2: Constitutional Governance

### SOP-004: File a Constitutional Improvement Proposal (CIP)

**Purpose**: Propose amendment to ARKPASS_DEV_TENET_PRIME.md constitution

**Prerequisites**:
- [ ] Constitutional gap or improvement identified
- [ ] Constitution Keeper assigned to draft (or agent with proposal)
- [ ] 3 options prepared (status quo, minor amendment, major reform)
- [ ] Constitutional impact analysis complete

**Steps**:
1. **Create CIP File**
   ```bash
   # Create monthly directory if doesn't exist
   mkdir -p constitutional-improvements/2025-11/

   # Determine next CIP number
   ls constitutional-improvements/2025-11/ | grep "CIP-" | wc -l
   # If 6 exist, next is 07

   # Create CIP file
   nano constitutional-improvements/2025-11/CIP-2025-11-12-07.md
   ```

2. **Fill CIP Template**
   ```markdown
   # Use template from ARKPASS_DEV_TENET_PRIME.md lines 999-1053
   # Essential sections:
   - Proposal ID: CIP-2025-11-12-07
   - Problem Statement (issue, evidence, frequency, impact)
   - Current Constitutional Language (if applicable)
   - Proposed Solutions (3 options: status quo, minor, major)
   - Constitution Keeper Recommendation
   - Constitutional Impact Analysis
   ```

3. **Submit to Consigliere**
   ```markdown
   # Update CIP status:
   **Status**: PENDING ALI REVIEW

   # Notify Consigliere (in daily log or flash message):
   "CIP-2025-11-12-07 filed. Ready for Royal Briefing inclusion."
   ```

4. **Consigliere Includes in Royal Briefing**
   ```
   # Consigliere consolidates with other pending CIPs
   # Presents to Grandmaster Ali using Royal Briefing Template
   # (See ARKPASS_DEV_TENET_PRIME.md lines 695-748)
   ```

5. **Ali Issues Decree**
   ```markdown
   # Possible outcomes:
   - APPROVED (Option A/B/C) → Proceed to implementation (SOP-005)
   - REJECTED → Update CIP status, archive
   - REQUEST REVISIONS → Constitution Keeper revises, resubmit
   ```

6. **Update CIP Status**
   ```markdown
   # In CIP file:
   **Status**: APPROVED (Option 2: Minor Amendment)

   ### Ali's Decree
   **Decision**: Approved Option 2
   **Date**: 2025-11-12
   **Notes**: [Ali's reasoning]
   ```

**Success Criteria**:
- [x] CIP file created with complete template
- [x] 3 options provided with pros/cons
- [x] Constitutional impact analysis complete
- [x] Submitted to Consigliere
- [x] Tracked in CURRENT_STATUS.md (pending CIPs table)

**Common Pitfalls**:
- ❌ Proposing solution without identifying problem → unclear justification
- ❌ Only 1 option (no "status quo" or alternatives) → doesn't follow CIP format
- ❌ Missing impact analysis → can't assess risk
- ❌ Bypassing Consigliere → violates exclusive Ali interface protocol

---

### SOP-005: Implement Approved Constitutional Amendment

**Purpose**: Merge approved CIP into constitution and update version

**Prerequisites**:
- [ ] CIP approved by Grandmaster Ali
- [ ] Ali decree specifies which option selected
- [ ] Constitution Keeper assigned to implement
- [ ] Archive of current constitution version created

**Steps**:
1. **Archive Current Constitution**
   ```bash
   # Create archive before editing
   cp ARKPASS_DEV_TENET_PRIME.md archives/ARKPASS_DEV_TENET_PRIME_v3.0.0.md
   ```

2. **Determine Version Bump**
   ```
   # Current: v3.0.0

   # Major amendment (new role, paradigm shift): v4.0.0
   # Minor amendment (clarification, small addition): v3.1.0
   # Patch (typo, formatting): v3.0.1

   # Example: Adding Precedent Registry = Minor Amendment → v3.1.0
   ```

3. **Edit Constitution**
   ```bash
   # Edit ARKPASS_DEV_TENET_PRIME.md

   # Update version header:
   **VERSION**: 3.1.0  # Was 3.0.0
   **LAST UPDATED**: 2025-11-12  # Was 2025-11-08

   # Add amendment content (exact language from approved CIP)
   # Example: Adding Precedent Registry section (CIP-2025-11-08-04)
   ```

4. **Update Version History**
   ```markdown
   # At bottom of constitution, add entry:
   | 3.1.0 | 2025-11-12 | Added Precedent Registry System per CIP-2025-11-08-04. Mandates `precedents/PRECEDENT_REGISTRY.md` maintenance by Adjudicator+Consigliere. | Constitution Keeper (AGENT-000XX) |
   ```

5. **Update CIP to Merged Status**
   ```markdown
   # In constitutional-improvements/2025-11/CIP-2025-11-08-04.md:
   **Status**: MERGED
   **Amendment Date**: 2025-11-12
   **New Version**: v3.1.0
   ```

6. **Announce in Daily Log + CURRENT_STATUS.md**
   ```markdown
   # logs/2025-11-12.md:
   ## Constitutional Amendments
   - **v3.1.0 released**: Added Precedent Registry System
   - CIP: CIP-2025-11-08-04 (approved Option 2)
   - Impact: Adjudicator + Consigliere now maintain precedents/PRECEDENT_REGISTRY.md

   # CURRENT_STATUS.md:
   ### Constitution
   - **Version**: 3.1.0 (was 3.0.0)  # Update
   - **Last Amendment**: 2025-11-12  # Update
   ```

7. **Commit and Push**
   ```bash
   git add ARKPASS_DEV_TENET_PRIME.md \
           archives/ARKPASS_DEV_TENET_PRIME_v3.0.0.md \
           constitutional-improvements/2025-11/CIP-2025-11-08-04.md \
           CURRENT_STATUS.md \
           logs/2025-11-12.md

   git commit -m "feat: Constitution v3.1.0 - Add Precedent Registry System (CIP-2025-11-08-04)"
   git push
   ```

**Success Criteria**:
- [x] Old version archived
- [x] Constitution updated with exact CIP language
- [x] Version bumped correctly
- [x] Version history updated
- [x] CIP marked MERGED
- [x] Announcement in log + status
- [x] Changes committed with clear message

**Common Pitfalls**:
- ❌ Editing constitution without archiving → no rollback possible
- ❌ Wrong version bump (minor vs major) → confusing version history
- ❌ Forgetting to update version history table → incomplete record
- ❌ Implementing Option 3 when Ali approved Option 2 → incorrect amendment

---

### SOP-006: File an Adjudication Case

**Purpose**: Request Adjudicator ruling on dispute or constitutional violation

**Prerequisites**:
- [ ] Dispute exists (inter-agent conflict OR constitutional violation)
- [ ] Informal resolution attempted and failed
- [ ] Evidence collected (daily logs, git commits, tmux history, etc.)
- [ ] Adjudicator available (AGENT-00002 or assigned Adjudicator)

**Steps**:
1. **Determine Case ID**
   ```bash
   # Check existing cases for current month
   ls adjudications/2025-11/ | grep "ADJ-" | wc -l
   # If 1 exists (ADJ-2025-11-08-01), next is ADJ-2025-11-12-02
   ```

2. **Create Case File**
   ```bash
   mkdir -p adjudications/2025-11/
   nano adjudications/2025-11/ADJ-2025-11-12-02.md
   ```

3. **Fill Adjudication Report Template**
   ```markdown
   # Use template from ARKPASS_DEV_TENET_PRIME.md lines 847-887
   # Essential sections:
   - Case ID: ADJ-2025-11-12-02
   - Filed By: [Agent]
   - Respondent: [Agent accused]
   - Dispute Type: [Constitutional Violation, Inter-Agent Conflict, etc.]
   - Evidence Reviewed: [checklist]
   - Findings
   - Ruling (verdict + rationale)
   - Disciplinary Recommendations (to Prime)
   ```

4. **Notify Adjudicator**
   ```markdown
   # In daily log:
   ## Adjudication Cases
   - **ADJ-2025-11-12-02** filed by AGENT-00003
   - Dispute: [brief description]
   - Respondent: AGENT-00005
   - Adjudicator assigned: AGENT-00002 (Adjudicator HOMESLICE)
   ```

5. **Adjudicator Investigates** (24-48 hour window)
   ```
   # Adjudicator:
   1. Reviews evidence (logs, commits, etc.)
   2. References constitutional sections
   3. Checks for precedent
   4. Drafts ruling
   5. Submits to Prime for approval
   ```

6. **Prime Approves/Modifies Ruling**
   ```markdown
   # In ADJ-2025-11-12-02.md:
   **Prime Review**: APPROVED
   **Prime Notes**: [Any modifications or endorsements]
   ```

7. **Ruling Enforced**
   ```
   # If disciplinary action recommended:
   - Warning → Prime issues warning in daily log
   - Retraining → Agent must review constitutional section before next session
   - Suspension → Agent paused for 1-3 sessions
   - Removal → Follow SOP-003 (Decommission Agent)
   ```

8. **Update Precedent Registry** (if precedent-setting)
   ```markdown
   # In precedents/PRECEDENT_REGISTRY.md (if exists):
   - **Precedent ID**: PREC-2025-11-12-01
   - **Source**: ADJ-2025-11-12-02
   - **Question**: [What was decided]
   - **Ruling**: [Summary]
   ```

**Success Criteria**:
- [x] Case file created with complete evidence
- [x] Adjudicator notified and investigates
- [x] Ruling issued within 48 hours
- [x] Prime approves ruling
- [x] Disciplinary action enforced (if applicable)
- [x] Precedent registered (if applicable)

**Common Pitfalls**:
- ❌ Filing case without evidence → Adjudicator can't rule
- ❌ Bypassing Adjudicator (going straight to Ali) → violates escalation protocol
- ❌ Adjudicator ruling on own violation → conflict of interest
- ❌ Not registering precedent → future cases lack guidance

---

## 🧬 Category 3: Session Management

### SOP-007: Clock-In to Daily Session

**Purpose**: Begin agent session with proper coordination file updates

**Prerequisites**:
- [ ] Agent activated (status: active)
- [ ] CURRENT_STATUS.md + today's log exist
- [ ] Ratio requirements satisfied (if Builder)
- [ ] Task assignment ready

**Steps**:
1. **Read Layer 1 + Layer 2**
   ```
   # MANDATORY reading before starting work:
   1. CURRENT_STATUS.md (mission snapshot)
   2. logs/2025-11-12.md (today's sessions so far)
   3. ACTIVE_ORDERS.md (what to work on)
   ```

2. **Create Session Entry in Daily Log**
   ```markdown
   # In logs/2025-11-12.md, add:

   ### Session X: [Task Description]
   **Session ID**: [branch or tmux session name]
   **Agent**: AGENT-00001 (Builder BROSKI)
   **Role**: Builder
   **Clock-In**: 2025-11-12T15:00Z
   **Clock-Out**: IN PROGRESS
   **Context Budget**: 200,000 tokens
   **Current Context**: ~0% <<Context 0%>>

   #### Mission
   [Specific task from ACTIVE_ORDERS.md]

   #### Deliverables
   - [ ] [Task 1]
   - [ ] [Task 2]
   ```

3. **Reserve tmux Session** (if required)
   ```bash
   # Prime or self-assigned:
   tmux new -s agent00001-builder
   # Note session name in log entry above
   ```

4. **Declare Context Budget**
   ```
   # In session entry:
   **Context Budget**: 200,000 tokens (estimated)
   **Checkpoint Plan**:
   - 50% @ ~100k tokens: Mid-summary
   - 75% @ ~150k tokens: Late summary
   - 90% @ ~180k tokens: Final summary + stop
   ```

5. **Announce in Flash Message** (if critical task)
   ```markdown
   # In daily log flash messages section:
   ### Top of Log (Critical Urgency)
   🚨 AGENT-00001 (Builder) now working on [critical task]. ETA: 2 hours. [2025-11-12T15:00Z]
   ```

6. **Lock Files If Needed**
   ```markdown
   # If editing CURRENT_STATUS.md or other shared file:
   ## File Locks
   - **CURRENT_STATUS.md**: Locked by AGENT-00001 (Session 2) until ~16:00Z
   ```

**Success Criteria**:
- [x] Layer 1 + Layer 2 read before starting
- [x] Session entry created in daily log
- [x] Context budget declared
- [x] tmux session assigned (if required)
- [x] Task clearly defined

**Common Pitfalls**:
- ❌ Starting work without reading status/logs → out of sync with team
- ❌ No context budget declared → risk of overflow at 90%
- ❌ Editing shared file without lock announcement → merge conflicts

---

### SOP-008: Deliver Checkpoint Summaries

**Purpose**: Report progress at 50% / 75% / 90% context usage

**Prerequisites**:
- [ ] Session in progress
- [ ] Context meter tracking active
- [ ] Approaching checkpoint threshold (50%, 75%, or 90%)

**Steps for 50% Mid Summary**:
1. **Check Context Meter**
   ```
   # Estimate: ~100k tokens used / 200k budget = 50%
   ```

2. **Write Summary (≤75 tokens)**
   ```markdown
   # In logs/2025-11-12.md, under session entry:

   #### Checkpoint Summaries
   **50% Mid Summary**
   - Tokens Used: ~100k / 200k
   - Context: <<Context 50%>>
   - Files Touched: [list]
   - Decisions/Blockers: [brief notes]
   - Remaining Plan: [what's left to do]
   ```

3. **Continue Work**

**Steps for 75% Late Summary**:
1. **Check Context Meter**
   ```
   # Estimate: ~150k tokens / 200k = 75%
   ```

2. **Write Summary (≤40 tokens)**
   ```markdown
   **75% Late Summary**
   - Tokens Used: ~150k / 200k
   - Context: <<Context 75%>>
   - Still on plan? [Yes/No + adjustments]
   - New info? [Any blockers discovered]
   - Highlight blockers: [Critical issues]
   ```

3. **Prepare for 90% Wrap-Up**

**Steps for 90% Final Summary**:
1. **Check Context Meter**
   ```
   # Estimate: ~180k tokens / 200k = 90%
   ```

2. **Write Summary (≤30 tokens)**
   ```markdown
   **90% Final Summary**
   - Tokens Used: ~180k / 200k
   - Context: <<Context 90%>>
   - Hand-off: [Next agent instructions]
   - **STOP SIGNAL** — Session ending immediately.
   ```

3. **IMMEDIATELY PROCEED TO CLOCK-OUT** (SOP-009)
   ```
   # DO NOT continue past 90%
   # DO NOT start new work
   # Clock out now
   ```

**Success Criteria**:
- [x] All checkpoints delivered on time
- [x] Token limits respected (≤75, ≤40, ≤30)
- [x] Context meter appended to each summary
- [x] Session stopped immediately at 90%

**Common Pitfalls**:
- ❌ Skipping checkpoints → Adjudicator violation
- ❌ Exceeding token limits → summaries too verbose
- ❌ Continuing past 90% → context overflow, session crash
- ❌ No "Roger" from next agent → communication protocol violated

---

### SOP-009: Clock-Out from Daily Session

**Purpose**: End session cleanly with all coordination files updated

**Prerequisites**:
- [ ] 90% final summary delivered OR work complete
- [ ] All checkpoint summaries recorded
- [ ] Files committed (code + coordination)
- [ ] Handoff clear for next agent

**Steps**:
1. **Complete 90% Final Summary** (if applicable)
   ```
   # See SOP-008 for 90% summary format
   ```

2. **Update Session Entry with Outputs**
   ```markdown
   # In logs/2025-11-12.md, update session:

   **Clock-Out**: 2025-11-12T17:00Z
   **Context Final**: <<Context 90%>>

   #### Files Modified
   - Created: [list new files]
   - Edited: [list modified files]
   - Deleted: [list removed files]

   #### Decisions Made
   - [Decision 1 with rationale]
   - [Decision 2 with rationale]

   #### Blockers Identified
   - [Blocker 1 - severity - owner]

   #### Git Operations
   - Branch: [branch name]
   - Commits: [N commits]
   - Push Status: [Pushed / Pending]
   ```

3. **Update CURRENT_STATUS.md**
   ```markdown
   # Reflect any changes:
   - Mission progress updates
   - New blockers added
   - Completed orders marked done
   - Metrics updated
   ```

4. **Update ACTIVE_ORDERS.md** (if orders completed)
   ```markdown
   # Change order status:
   ### ✅ Order Alpha-3: Deploy Coordination Infrastructure
   **Completed**: 2025-11-12
   **Executor**: AGENT-00001 (Builder BROSKI)
   **Outcome**: All 6 deliverables created and committed.
   ```

5. **Commit All Changes**
   ```bash
   # Commit code files
   git add [code files]
   git commit -m "feat: [describe code changes]"

   # Commit coordination files
   git add CURRENT_STATUS.md ACTIVE_ORDERS.md logs/2025-11-12.md
   git commit -m "docs: Update coordination files (Session X clock-out)"
   ```

6. **Push to Remote**
   ```bash
   git push -u origin <branch-name>
   ```

7. **Release File Locks** (if held)
   ```markdown
   # In daily log:
   ## File Locks
   - **CURRENT_STATUS.md**: Released by AGENT-00001 at 17:00Z
   ```

8. **Update Agent MOJO** (within 30 minutes of clock-out)
   ```yaml
   # Edit agents/mojos/AGENT-00001.yaml:

   session_history:
     - session_id: "Session 2"
       date: "2025-11-12"
       duration_hours: 2.0
       task: "Deploy coordination infrastructure"
       outcome: "success"
       checkpoint_compliance: true  # Delivered all summaries

   overall_rating: 4.5  # Update if session performance notable
   ```

**Success Criteria**:
- [x] All checkpoint summaries delivered
- [x] Session entry complete with outputs/decisions/blockers
- [x] CURRENT_STATUS.md updated
- [x] ACTIVE_ORDERS.md updated (if applicable)
- [x] All changes committed and pushed
- [x] File locks released
- [x] MOJO updated within 30 minutes

**Common Pitfalls**:
- ❌ Committing code but not coordination files → status desync
- ❌ Not updating CURRENT_STATUS.md → next agent lacks context
- ❌ Forgetting to push → work not visible to others
- ❌ Not updating MOJO → performance record incomplete

---

## 🧬 Category 4: Documentation & Knowledge Management

### SOP-010: Documentation Index Maintenance

**Purpose**: Ensure all repository files are cataloged in DOCUMENTATION_INDEX.md to prevent "forgotten silo events"

**Prerequisites**:
- [ ] New file has been created OR existing file discovered as orphan
- [ ] File is governance/documentation related (not build artifacts, node_modules, etc.)

**Steps**:

1. **Identify Appropriate Chapter**
   ```markdown
   # Review 9 chapters in DOCUMENTATION_INDEX.md:
   # 1. Constitutional Foundation
   # 2. Operational State (DNA Layer)
   # 3. Agent Infrastructure
   # 4. Mission Control (RNA Layer)
   # 5. Daily Operations (Protein Layer)
   # 6. Governance Workflows
   # 7. Handoffs & Continuity
   # 8. Technical Specifications
   # 9. Archives & History

   # Select chapter matching file's function
   ```

2. **Add File Entry to Chapter**
   ```markdown
   # In DOCUMENTATION_INDEX.md, under appropriate chapter subsection:

   ### X.Y filename.md - Brief description
   **PURPOSE**: What this file does and why it exists
   **WHEN TO READ**:
   - Specific situation 1
   - Specific situation 2
   **UPDATE FREQUENCY**: How often content changes
   **STATUS**: (if not yet complete) 🚧 Pending/Planned/etc.
   ```

3. **Update Quick Reference Tables** (if applicable)
   ```markdown
   # If file answers common question, add to "I Need to Find..." table:
   | New question | Ch X → `filename.md` |

   # If file is role-specific reading, add to "I Am Role X..." table
   ```

4. **Update Index Statistics**
   ```markdown
   # Increment document count:
   **Total Documents Cataloged**: 60+ → 61+

   # If new chapter subsection created, update Chapter Breakdown
   ```

5. **Update Change Log**
   ```markdown
   # Add entry to DOCUMENTATION_INDEX.md change log:
   | 2025-11-XX | 2.X.Y | Added `filename.md` to Chapter X.Y | AGENT-##### |
   ```

6. **Commit Atomically with File Creation**
   ```bash
   # CRITICAL: Update index in SAME commit as file creation
   git add path/to/newfile.md GIT_DOCUMENTATION_INDEX.md
   git commit -m "docs: Add newfile.md with index entry (Ch X.Y)"
   git push -u origin <branch-name>
   ```

**Success Criteria**:
- [x] File appears in appropriate chapter in DOCUMENTATION_INDEX.md
- [x] Entry includes: Purpose, When to Read, Update Frequency
- [x] Quick Reference Tables updated (if applicable)
- [x] Index statistics updated
- [x] Change log entry added
- [x] Index update committed atomically with file creation

**Common Pitfalls**:
- ❌ Creating file in separate commit from index update → orphan window exists
- ❌ Adding to wrong chapter → confuses navigation
- ❌ Vague purpose statement → agents don't know when to read
- ❌ Forgetting to update statistics → index appears stale
- ❌ Creating file without index entry → [[MEH]] ribbon penalty

**Enforcement**:
- **Librarian Audit**: Every 24 active work hours OR 7 calendar days (whichever first), scan for orphaned files
- **Tracking**: Use `tools/work-hour-tracker.sh status` to check if audit due
- **Penalty**: [[MEH]] ribbon for agents creating orphaned files
- **Constitutional Mandate**: Per ARKPASS_DEV_TENET_PRIME.md — "All files must appear in DOCUMENTATION_INDEX.md"

---

## 🧬 Category 5: Operational Procedures

### SOP-011: Mission Completion Status Updates

**Purpose**: Update CURRENT_STATUS.md after mission completion to prevent status desync

**Prerequisites**:
- [ ] Builder has announced mission completion (explicit "MISSION COMPLETE" statement)
- [ ] Mission deliverables exist (Royal Briefing, commits, documentation, etc.)

**Authority**: Librarian assigned to mission oversight

**Trigger**: Builder clocks out with "MISSION COMPLETE" status

**Steps**:

1. **Builder Announces Completion**
   ```markdown
   # In daily log, Builder writes:
   ## 90% Context Summary
   ...
   **Mission Status**: MISSION [MISSION-ID] COMPLETE

   **Deliverables**:
   - Royal Briefing: consigliere/briefings/ROYAL-BRIEFING-2025-11-XX.md
   - Commits: abc1234, def5678
   - Documentation: Updated X, Y, Z
   ```

2. **Librarian Reads Mission Deliverables**
   ```bash
   # Review what Builder actually delivered:
   git log --oneline HEAD~5..HEAD
   cat consigliere/briefings/ROYAL-BRIEFING-2025-11-XX.md
   # Verify completion quality
   ```

3. **Librarian Updates CURRENT_STATUS.md**
   ```markdown
   # Move completed mission from "Active Missions" to "Completed Missions":

   ## Completed Missions
   | Mission ID | Description | Assigned Agent | Status | Completion Date | Deliverables |
   |------------|-------------|----------------|--------|-----------------|--------------|
   | MISSION-123 | Deploy coordination infrastructure | AGENT-00001 | ✅ Complete (100%) | 2025-11-13 | Royal Briefing RB-2025-11-13, commits abc1234 |

   # Update mission status percentage to 100%
   # Record completion date
   # Link to deliverables
   ```

4. **Librarian Updates Agent MOJO Files**
   ```yaml
   # Edit agents/mojos/AGENT-00001.yaml:

   session_history:
     - session_id: "Session 3"
       date: "2025-11-13"
       duration_hours: 3.5
       task: "MISSION-123: Deploy coordination infrastructure"
       outcome: "success"
       deliverables:
         - "Royal Briefing RB-2025-11-13"
         - "Commits: abc1234, def5678"
       ratings:
         quality: 4.5
         timeliness: 5.0
         communication: 4.0
   ```

5. **Librarian Commits Changes**
   ```bash
   git add GIT_CURRENT_STATUS.md agents/mojos/AGENT-00001.yaml
   git commit -m "docs: Update status after MISSION-123 completion (AGENT-00001)"
   git push -u origin <branch-name>
   ```

6. **Fallback: Prime Executes if Librarian Unavailable**
   ```markdown
   # If no Librarian assigned OR Librarian unavailable:
   # Prime (Supervisor) executes SOP-011 within 2 hours
   # Prime documents in daily log: "Executed SOP-011 due to Librarian unavailability"
   ```

**Success Criteria**:
- [x] Completed mission moved to "Completed Missions" section in CURRENT_STATUS.md
- [x] Mission status updated to 100% with completion date
- [x] Deliverables linked clearly
- [x] Builder MOJO updated with session results
- [x] Changes committed with clear message
- [x] Execution within 2 hours of Builder clock-out

**Accountability**:
- **Builder Must**: Announce completion explicitly with "MISSION [ID] COMPLETE" in 90% summary
- **Librarian Must**: Execute SOP-011 within 2 hours of Builder clock-out
- **Failure Penalty**: [[MEH]] ribbon for Librarian if status not updated within 2 hours

**Why No Automated Script**:
Per Grandmaster Ali: "I hate automated scripts, to be honest" (Annunaki___Convo_FULL_, line 5231)
- Human (agent) judgment required to assess completion quality
- Status updates reflect nuanced mission outcomes, not just binary done/not-done
- Agent accountability more valuable than automation convenience

**Common Pitfalls**:
- ❌ Builder says "done" without explicit "MISSION COMPLETE" → Librarian may miss it
- ❌ Librarian updates status >2 hours later → status desync confuses next agent
- ❌ Forgetting to update MOJO → performance record incomplete
- ❌ Not linking deliverables → hard to verify completion quality

**Enforcement**:
- Librarians must check daily logs every clock-in for "MISSION COMPLETE" announcements
- If Builder forgets to announce explicitly, Librarian proactively asks for confirmation
- If Librarian fails to execute within 2 hours, Prime intervenes and logs [[MEH]] ribbon

---

## 🧬 Category 6: Future Procedures

(Additional SOPs to be added as processes mature)

**Planned SOPs**:
- SOP-012: Create Royal Briefing (Consigliere)
- SOP-013: Execute Tea Ceremony (The Twins)
- SOP-014: Assign Door ID (Librarian)
- SOP-015: Create Precedent Registry Entry (Adjudicator)
- SOP-016: Handle Constitutional Emergency (Constitution Keeper)
- SOP-017: Commission Hybrid Genome Child Agent (Procreation protocol)

---

## 📊 SOP Statistics

**Total SOPs**: 11
**Category 1 (Agent Lifecycle)**: 3 SOPs
**Category 2 (Constitutional Governance)**: 3 SOPs
**Category 3 (Session Management)**: 3 SOPs
**Category 4 (Documentation & Knowledge Management)**: 1 SOP
**Category 5 (Operational Procedures)**: 1 SOP
**Category 6 (Future Procedures)**: 0 SOPs (planned: 6)

**Most Used SOPs** (estimated):
1. SOP-007: Clock-In (every session)
2. SOP-008: Deliver Checkpoints (every session)
3. SOP-009: Clock-Out (every session)
4. SOP-001: Commission Agent (as needed)

---

## 🔄 Maintenance Protocol

**Constitution Keeper Responsibilities**:
- Add new SOPs when repeated patterns identified
- Review SOPs quarterly for accuracy
- Deprecate outdated SOPs
- Ensure SOP compliance with constitution

**Librarian Responsibilities**:
- Flag SOPs that need updating (observed deviations)
- Validate SOP cross-references (file paths, section numbers)
- Track SOP usage (which are most/least used)

**All Agents Responsibilities**:
- Follow SOPs when performing listed tasks
- Report SOP gaps ("I needed SOP for X but it doesn't exist")
- Propose SOP improvements via Consigliere

---

## 🔄 Change Log

| Date | Version | Changes | Updated By |
|------|---------|---------|------------|
| 2025-11-12 | 1.0.0 | Initial SOP_LIBRARY.md creation. 9 SOPs covering agent lifecycle, constitutional governance, session management. | Claude Code (context-window-investigation) |
| 2025-11-13 | 1.1.0 | Added SOP-010: Documentation Index Maintenance per Desktop Agent Directive 002.2. Created Category 4 (Documentation & Knowledge Management). | ANUNNAKI THREE (AGENT-00003) executing Batch 002 |
| 2025-11-13 | 1.2.0 | Added SOP-011: Mission Completion Status Updates per Desktop Agent Directive 002.3. Created Category 5 (Operational Procedures). | ANUNNAKI THREE (AGENT-00003) executing Batch 002 |

---

**END OF SOP_LIBRARY.md v1.2.0**

*Follow SOPs for consistency. Improve SOPs through experience.*
