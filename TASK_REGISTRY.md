# Task Registry - Granular Work Item Tracking

**Purpose**: Track all tasks from start to completion. Enables enforcement agents to identify stalled work.

---

## Active Tasks

| Task ID | Description | Agent | Status | Started | Due | Notes |
|---------|-------------|-------|--------|---------|-----|-------|
| *No active tasks* | | | | | | |

---

## Completed Tasks (Last 10)

| Task ID | Description | Agent | Completed | Duration |
|---------|-------------|-------|-----------|----------|
| *No completed tasks yet* | | | | |

---

## Stalled Tasks (Requires Intervention)

| Task ID | Description | Agent | Started | Days Stalled | Blocker |
|---------|-------------|-------|---------|--------------|---------|
| *No stalled tasks* | | | | | |

---

## Task Lifecycle States

- **STARTED** - Agent declared task start, working on it
- **IN_PROGRESS** - Active work happening (updates logged)
- **BLOCKED** - Work stopped due to external dependency
- **STALLED** - No updates >24 active work hours (enforcement needed)
- **COMPLETED** - Work finished, deliverable produced
- **ABANDONED** - Task cancelled by Grandmaster Ali

---

## Enforcement Protocol

**Agent Responsible**: [Hitler/Demolition Man/Adjudicator - TO BE DETERMINED]

**Trigger**: Any task in STALLED state

**Action**:
1. Review task blocker
2. Escalate to Prime or Grandmaster Ali
3. Recommend: reassign, cancel, or extend deadline
4. Update TASK_REGISTRY.md with resolution

---

**Integration**: Agents must run `./tools/task-start.sh <task-id> "<description>"` at task start and `./tools/task-complete.sh <task-id>` at finish.
