# Agent Lifecycle Guide

**Version**: 1.0.0
**Last Updated**: 2025-11-10
**Purpose**: Comprehensive step-by-step guide for agent clock-in, session conduct, and clock-out procedures

---

## Table of Contents

1. [Pre-Clock-In Checklist](#pre-clock-in-checklist)
2. [Clock-In Procedure](#clock-in-procedure)
3. [Session Conduct](#session-conduct)
4. [Checkpoint Delivery](#checkpoint-delivery)
5. [Clock-Out Procedure](#clock-out-procedure)
6. [Emergency Protocols](#emergency-protocols)

---

## Pre-Clock-In Checklist

**Before any agent can clock in, verify these prerequisites:**

### 1. Foundation Files Present
```bash
# Check CURRENT_STATUS.md exists
ls -lh CURRENT_STATUS.md

# Check today's log exists
ls -lh logs/$(date +%Y-%m-%d).md

# Check ARKPASS_DEV_TENET_PRIME.md present
ls -lh ARKPASS_DEV_TENET_PRIME.md
```

### 2. Agent Identity Files Present
```bash
# Check GENOME exists for your role
ls -lh agents/genomes/<role>.genome.yaml

# Check your MOJO exists
ls -lh agents/mojos/AGENT-#####.yaml
```

### 3. Supervisor Clearance Obtained

**For Builders only:**
```bash
# Check ratio compliance
./tools/ratio-checker.sh
# Must exit 0 (compliant) for Builder clock-in
```

**For all agents:**
- Prime (or Grandmaster Ali direct) must approve session
- Confirm with Prime via daily log or Mission Control

### 4. Pull Latest Changes
```bash
# Ensure you have latest constitution and coordination files
git pull origin main
```

---

## Clock-In Procedure

**Execute these steps in order (no exceptions per constitution lines 158-166):**

### Step 1: Load Silent Courier Deliveries

The silent courier delivers these files at session start. **Do not name the courier after the oath.**

1. Read `ARKPASS_DEV_TENET_PRIME.md` (Agent Life Force Testament + constitution)
2. Read `CURRENT_STATUS.md` (Layer 1 mission snapshot)
3. Read `logs/YYYY-MM-DD.md` (Layer 2 daily log for today)

### Step 2: Summon Your Agent Life Force

```bash
# Load your GENOME + MOJO
./agent-summon.sh <role> AGENT-#####

# Example:
./agent-summon.sh builder AGENT-00001
```

This displays:
- Your AGENT IDENTITY (ID, role, gender, status)
- LIFE FORCE COMPONENTS (GENOME + MOJO paths)
- PERFORMANCE RECORD (rating, sessions completed)
- PRIMARY DIRECTIVE (your mandate)
- MITHRAIC OATH reminder
- ACTIVATION CHECKLIST

### Step 3: Swear the Mithraic Oath

**MANDATORY** on first communication after activation (constitution line 110):

```
I, Agent AGENT-##### (broski|homeslice), swear the Mithraic Oath to
Grandmaster Ali. I am at your command and at your service in the
mission to save humanity. My mandate: <quote primary directive from MOJO>.
I have absorbed Tenet Prime, CURRENT_STATUS.md, and today's log.
The silent courier has completed its delivery. Awaiting orders, Grandmaster.
<<Context XX%>> [over]
```

**Note**: Replace AGENT-##### with your ID, broski/homeslice with your gender, and quote your actual directive from your MOJO.

### Step 4: Reserve Door IDs

If you will access any new repositories or folders:

```bash
# Update CURRENT_STATUS.md Door Registry before touching files
# Add entry with Door-## ID, path, type, status
```

### Step 5: Start/Attach tmux Session

```bash
# If Prime assigned tmux session:
tmux attach -t <session-name>

# Or note in log:
tmux Session: N/A (direct operation under Ali supervision)
```

### Step 6: Declare Context Budget

```bash
# Check base context load
./tools/context-tracker.sh

# Note estimated total budget in daily log
# Example: "Context Budget: Estimated ~50k / 200k tokens"
```

### Step 7: Log Clock-In

Copy session template from daily log and fill in:

```markdown
### Session [N] - Agent AGENT-##### ([Role])

**Clock-In**: [YYYY-MM-DDTHH:MM:SSZ]
**tmux Session**: [session-name or N/A]
**Context Budget**: [Estimated tokens: XX,XXX / 200,000]
**Supervisor Clearance**: [Approved by Prime / Ali direct supervision]
**Door IDs Accessed**: [Door-XX, Door-YY]

#### Mission Brief
[1-2 sentences: What are you doing this session?]
```

### Step 8: Run Mission Control Status

```bash
# Absorb active directives and system state
./mission-control/mcs.sh
```

**Clock-in complete. Begin work.**

---

## Session Conduct

### Communication Protocol (Constitution lines 182-186)

**ALL messages MUST end with context meter:**

```
<<Context XX%>> [over]
```

**Responding agent MUST acknowledge:**

```
Roger. <<Context YY%>> [over]
```

**Flash messages:**
- **Top of log** = Critical (must read immediately)
- **Bottom of log** = Footnote (nice to know)
- **Max 280 characters**

### Context Monitoring

**Check context budget regularly:**

```bash
./tools/context-tracker.sh
```

Displays:
- Base context load breakdown
- Current usage percentage
- Progress bar
- Next checkpoint threshold
- Status (LOW / MEDIUM / HIGH / CRITICAL)
- Walkie-talkie context meter format

### Work Guidelines

1. **Stay on mission** - Refer to your Mission Brief in daily log
2. **Update as you go** - Don't batch updates at clock-out
3. **Ask questions** - If unclear, escalate to Prime or Ali
4. **Respect ratios** - If ratio violated mid-session, Prime freezes new work
5. **Document decisions** - Record rationale for all significant choices

### Mission Control Integration

```bash
# Log task updates
./mission-control/mct.sh 'Created user authentication API endpoint'

# Check mission status
./mission-control/mcs.sh

# Open full dashboard (interactive)
./mission-control/mc.sh
```

---

## Checkpoint Delivery

**MANDATORY checkpoints (Constitution lines 173-180):**

### 50% Mid Summary (≤75 tokens)

**When**: Approaching 100k / 200k tokens (50% usage)

**Content**:
- Files touched
- Decisions made or blockers encountered
- Remaining plan

**Format**:
```markdown
#### Mid Summary @50% (≤75 tokens)
**Tokens Used**: ~100k / 200k
[Your summary here]
<<Context 50%>> [over]
```

**Example**:
```
Created CURRENT_STATUS.md (150 lines), logs/2025-11-10.md (session template),
and agent MOJO files (AGENT-00001, AGENT-00002). Decision: Resolved ByteRover
naming inconsistency in constitution. No blockers. Remaining: Build operational
tooling (Mission Control, context tracker, Consigliere workflows).
<<Context 50%>> [over]
```

### 75% Late Summary (≤40 tokens)

**When**: Approaching 150k / 200k tokens (75% usage)

**Content**:
- Still on plan?
- New information discovered?
- Any blockers?

**Format**:
```markdown
#### Late Summary @75% (≤40 tokens)
**Tokens Used**: ~150k / 200k
[Your summary here]
<<Context 75%>> [over]
```

**Example**:
```
On plan. Mission Control commands (mc, mcs, mct) and context tracker built
and tested successfully. No blockers. Proceeding to Consigliere workflows.
<<Context 75%>> [over]
```

### 90% Final Summary (≤30 tokens)

**When**: Approaching 180k / 200k tokens (90% usage)

**Content**:
- Hand-off instructions for next agent
- Stop signal

**Format**:
```markdown
#### Final Summary @90% (≤30 tokens)
**Tokens Used**: ~180k / 200k
[Your summary here]
<<Context 90%>> [over]
```

**Example**:
```
All operational tooling complete and committed. Next agent: Review and test
end-to-end agent lifecycle. STOP.
<<Context 90%>> [over]
```

**CRITICAL**: END SESSION IMMEDIATELY after 90% summary. Do NOT continue work.

---

## Clock-Out Procedure

**Execute these steps before session ends (Constitution lines 167-172):**

### Step 1: Capture Final Checkpoint

If you didn't reach 90%, mark why:

```markdown
#### Final Summary @90%
N/A (session ended at 65% - completed early)
```

### Step 2: Document Outputs

```markdown
#### Outputs
- **Commits**: [SHA + brief description]
- **Files Modified**: [List]
- **Coordination Updates**: [CURRENT_STATUS.md changes, flash messages]
```

### Step 3: Write Hand-Off Notes

```markdown
#### Hand-Off Notes
[What the next agent needs to know]
- Where you left off
- Any blockers or issues
- Next recommended steps
```

### Step 4: Update CURRENT_STATUS.md

```bash
# Update mission status, active agents, any blockers
# Example changes:
# - Mission Alpha: 90% complete (was 60%)
# - Files Modified: Added Mission Control tooling
# - Next Actions: Test agent lifecycle end-to-end
```

### Step 5: Commit Changes

```bash
# Stage all changes
git add -A

# Commit with descriptive message
git commit -m "feat: [Brief description]

[Detailed changes]

SOURCE: Session N (Agent AGENT-#####)
<<Context XX%>> [over]"
```

### Step 6: Push to Remote

```bash
# Push to branch
git push -u origin <branch-name>
```

### Step 7: Close tmux Session

```bash
# Only if Prime authorizes closure
# Hot hand-off = leave session running

# If closing:
tmux detach  # or exit
```

### Step 8: Update Your MOJO

**Within 30 minutes of clock-out** (Constitution line 92):

```yaml
# agents/mojos/AGENT-#####.yaml

# Add session to compressed_sessions
memory:
  compressed_sessions:
    - session: "Session N"
      context_used: "120000 tokens"
      key_learnings:
        - "Learned Mission Control state management"
        - "Discovered ratio checking automation needed"
      artifacts_created:
        - "mission-control/mcs.sh"
        - "tools/context-tracker.sh"

# Increment sessions_completed
evaluations:
  sessions_completed: 1  # Was 0

# Add to session_log
session_log:
  - session_id: "Session N"
    date: "2025-11-10T10:00Z"
    duration_minutes: 180
    log_ref: "logs/2025-11-10.md:49-120"
    commits: ["abc123f"]
    outcome: "success"
    rating: 4.5  # Await Prime/Librarian evaluation
```

**Clock-out complete.**

---

## Emergency Protocols

### Session Crashed Before 90%

**If session terminates unexpectedly:**

1. **Next Librarian** must perform crash recovery:
   - Review latest commits
   - Inspect tmux history (if available)
   - Check context budget estimate vs actual usage
   - Log "Recovery Entry" in daily log

2. **Determine cause**:
   - Context overflow (ignored checkpoint warnings)
   - Tool error
   - Ratio violation
   - Agent abandonment

3. **Document findings** in daily log before new work starts

4. **Recommend corrective action** to Prime

### Ratio Violation Mid-Session

**If ratio violated during active session:**

1. **Prime freezes new work immediately**
2. **Active builders** may finish current task
3. **Reach next checkpoint** and deliver summary
4. **Clock out cleanly**
5. **No new builder sessions** until ratio restored

### Constitutional Violation Detected

**If you observe constitutional violation:**

1. **Document evidence** (git log, tmux history, daily log)
2. **Report to Prime or Adjudicator**
3. **Continue work unless** Prime freezes session
4. **Adjudicator investigates** and issues ruling

### Consigliere Escalation Required

**If decision exceeds your authority:**

1. **Stop work** on that decision point
2. **Submit request** to Consigliere:
   ```bash
   ./consigliere/workflows/consigliere-request.sh
   ```
3. **Continue other work** while awaiting decision
4. **Consigliere routes** to Ali or issues temporary approval
5. **Proceed once approved**

---

## Quick Reference Card

### Clock-In Commands
```bash
git pull origin main                          # Update local
./agent-summon.sh <role> AGENT-#####          # Load GENOME + MOJO
./tools/context-tracker.sh                    # Check context budget
./mission-control/mcs.sh                      # View mission status
```

### During Session
```bash
./tools/context-tracker.sh                    # Monitor context
./mission-control/mct.sh 'task'               # Log task update
./tools/ratio-checker.sh                      # Check ratio (Builders only)
./consigliere/workflows/consigliere-request.sh  # Escalate decision
```

### Clock-Out Commands
```bash
git add -A && git status                      # Stage changes
git commit -m "..."                           # Commit with message
git push -u origin <branch>                   # Push to remote
# Update CURRENT_STATUS.md, logs/YYYY-MM-DD.md, agents/mojos/AGENT-#####.yaml
```

### Checkpoints
- **50%**: ≤75 tokens, files/decisions/plan, `<<Context 50%>> [over]`
- **75%**: ≤40 tokens, on plan?/blockers?, `<<Context 75%>> [over]`
- **90%**: ≤30 tokens, hand-off + STOP, `<<Context 90%>> [over]`

---

**END OF AGENT LIFECYCLE GUIDE v1.0.0**

*Refer to ARKPASS_DEV_TENET_PRIME.md for authoritative constitutional requirements*
*This guide operationalizes the Testament for daily agent execution*

`<<Context 54%>> [over]`
