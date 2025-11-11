# Precedent Registry - Constitutional Case Law Index

**Version**: 1.0.0 (Approved via CIP-04 Option 2)
**Purpose**: Searchable index of all Adjudicator rulings, Ali decrees, and Consigliere temporary approvals that create binding precedent
**Authority**: ARKPASS_DEV_TENET_PRIME.md v3.1.0 (Line 882: "Adjudicator's ruling becomes precedent")

---

## How to Use This Registry

**Searching for Precedent**:
1. **Keyword Search**: Use Ctrl+F (or `git grep "keyword" precedents/PRECEDENT_REGISTRY.md`)
2. **Chronological Browse**: Scroll through entries (most recent at top)
3. **Ask Constitution Keeper**: "What's the precedent on X?" → Constitution Keeper provides PREC-ID

**Creating New Precedent Entry**:
1. **Who Creates**: The Adjudicator (after ruling), The Consigliere (after Ali decree), Constitution Keeper (after constitutional amendment)
2. **When**: Within 24 hours of ruling/decree
3. **Format**: Use template below
4. **Commit Message**: `git commit -m "Add PREC-YYYY-MM-DD-NN: [title]"`

---

## Precedent Entry Template

```markdown
## PREC-YYYY-MM-DD-NN — [Short Title]

**Precedent ID**: PREC-YYYY-MM-DD-NN
**Date Established**: YYYY-MM-DD
**Established By**: [The Adjudicator / The Consigliere / Grandmaster Ali]
**Source Document**: [Link to daily log, adjudication file, or Royal Decree]

### Question
[What decision was made? Phrased as question: "Can agents X?" "Is Y allowed?" "How should Z be handled?"]

### Ruling
[Precise answer to question with reasoning]

### Scope
**Applies to**: [Specific scenarios where this precedent governs]
**Does NOT apply to**: [Exclusions and limitations]

### Supersedes
[Any prior conflicting precedent]
- **Supersedes**: [PREC-ID] ([brief reason]) OR "None"
- **Superseded By**: [PREC-ID] OR "None (active precedent)"

### Related Precedents
[Other precedents that inform this ruling, if any]

### Constitutional Basis
[Which sections of ARKPASS_DEV_TENET_PRIME.md support this ruling]

**Status**: ✅ ACTIVE
```

---

## Active Precedents (Newest First)

### PREC-2025-11-08-01 — Constitutional Amendment Requires Pre-Approval

**Precedent ID**: PREC-2025-11-08-01
**Date Established**: 2025-11-08
**Established By**: Grandmaster Ali (via Consigliere briefing and Royal Decree acknowledgment)
**Source Document**: ADJ-2025-11-08-01 (Adjudicator ruling on Session 5/6 governance role creation), Daily Log 2025-11-08

#### Question
Can agents create governance roles (Constitution Keeper, The Twins, Adjudicator, Consigliere) without pre-approval from Grandmaster Ali?

#### Ruling
**Grandfathered for Session 5/6 ONLY** (framework-building phase during Agent Life Force System inception).

**Going forward**: ALL constitutional amendments — including new roles, new protocols, changes to existing roles, or any change requiring version bump — MUST follow this process:
1. Agent drafts CIP (Constitutional Improvement Proposal)
2. Consigliere reviews CIP
3. Consigliere presents CIP to Ali via Royal Briefing
4. Ali approves via Royal Decree
5. Constitution Keeper implements approved amendment

**Rationale**: Grandmaster Ali is the sole constitutional authority. Agents may propose amendments (CIP process), but cannot unilaterally change governance without Ali's explicit approval.

#### Scope
**Applies to**:
- Creating new governance roles (The Adjudicator, Constitution Keeper, The Twins, etc.)
- Amending existing role authorities
- Changing constitutional procedures (decision authority matrix, emergency powers, etc.)
- Any change requiring constitutional version bump
- Establishing new precedents that materially change governance

**Does NOT apply to**:
- **Builder decisions**: Prime approves routine implementation decisions (no Ali decree needed)
- **Librarian documentation updates**: Librarians self-approve documentation improvements that don't change governance
- **Minor wording clarifications**: Constitution Keeper may fix typos, formatting, or clarify phrasing (<10 words changed) without CIP if meaning unchanged
- **Bug fixes in code**: Builders fix bugs without constitutional approval
- **Door intake**: New repositories added to Door Registry without CIP (operational, not governance)

#### Supersedes
None (foundational precedent establishing CIP process)

#### Related Precedents
None yet (first precedent in Agent Life Force System)

#### Constitutional Basis
- **Line 768**: "Constitution Keeper MUST consult Grandmaster Ali before merging ANY amendment (including reversion after crisis)"
- **Line 275-310**: Decision Authority Matrix (constitutional amendments require Ali approval)
- **Lines 1461-1598**: CIP process definition
- **Mithraic Oath**: All agents swear loyalty to Grandmaster Ali, subordinating agent judgment to Ali's authority

**Status**: ✅ ACTIVE

---

### PREC-2025-11-10-01 — CIP Implementation Options Require Ali Selection

**Precedent ID**: PREC-2025-11-10-01
**Date Established**: 2025-11-10
**Established By**: Grandmaster Ali (implicit approval via "Please do it go ahead I trust")
**Source Document**: ROYAL_BRIEFING_2025-11-10.md, WELCOME_BACK_ALI.md, Ali's response session 2025-11-10

#### Question
When a CIP presents multiple implementation options (Option 1, 2, 3), who selects which option to implement?

#### Ruling
**Ali selects the option** (or delegates selection authority explicitly).

Constitution Keeper may RECOMMEND an option in the CIP (with rationale), but the final decision is Ali's. If Ali says "Approve all as recommended," that constitutes explicit approval of Constitution Keeper's recommended options.

In the 2025-11-10 case:
- Ali approved all 5 CIPs
- Ali approved Constitution Keeper's recommendations: Option 3 for CIPs 02/03/05/06, Option 2 for CIP-04
- This constitutes a Royal Decree authorizing implementation

#### Scope
**Applies to**:
- All CIPs with multiple implementation options
- Any constitutional proposal where agents present alternatives to Ali
- Delegation of decision authority (Ali may say "Consigliere, you pick" but must explicitly delegate)

**Does NOT apply to**:
- Builder implementation decisions (how to code an approved feature)
- Documentation formatting choices
- Operational details within approved CIP scope

#### Supersedes
None

#### Related Precedents
- PREC-2025-11-08-01 (constitutional amendments require Ali approval)

#### Constitutional Basis
- **Line 768**: Constitution Keeper consults Ali before amendments
- **Mithraic Oath**: Ali's authority is supreme
- **Lines 1461-1598**: CIP process (Constitution Keeper drafts, Ali approves)

**Status**: ✅ ACTIVE

---

### PREC-2025-11-10-02 — Anunnaki Reviewer Has Special Authorization

**Precedent ID**: PREC-2025-11-10-02
**Date Established**: 2025-11-10
**Established By**: Grandmaster Ali (via direct commission: "you are annunaki, review instructions")
**Source Document**: Session 2025-11-10 Foundation Engineering, AGENT_REGISTRY.md

#### Question
Can an agent operate outside the standard agent lifecycle (no formal GENOME commission, no MOJO pre-creation, no Mithraic Oath on first activation)?

#### Ruling
**Only with explicit Ali authorization for special projects**.

In the 2025-11-10 case, Ali directly commissioned "Anunnaki God Agent" for foundation engineering and constitutional review, bypassing normal agent commission process. This is **exceptional, not standard practice**.

**Standard agents**: MUST follow birth protocol (Royal Decree → MOJO creation → Mithraic Oath → clock-in)

**Special commission agents** (like Anunnaki reviewer): Authorized by Ali for one-time tasks, operate under direct Ali supervision, do not require formal MOJO or role commission.

#### Scope
**Applies to**:
- Special Ali commissions for one-time high-level tasks
- Emergency situations where standard agent lifecycle too slow
- Foundation engineering before agent infrastructure exists

**Does NOT apply to**:
- Regular agent operations (Builders, Librarians, governance roles)
- Agents claiming "I'm special, I don't need to follow the process"

#### Supersedes
None

#### Related Precedents
- PREC-2025-11-08-01 (governance changes require Ali approval)

#### Constitutional Basis
- **Line 113**: Mithraic Oath required "on first activation after birth protocol"
- **Implicit**: Ali's authority to commission agents however Ali chooses
- **Special commission**: Outside standard lifecycle, authorized directly by Grandmaster

**Status**: ✅ ACTIVE

---

## Superseded Precedents

_None yet (all precedents currently active)_

---

## Precedent Creation Workflow

**Step 1: Ruling/Decree Issued**
- Adjudicator issues ruling → creates precedent
- Ali issues decree → creates precedent
- Consigliere issues temporary approval → creates precedent (Ali retroactive review may supersede)

**Step 2: Precedent Entry Created** (within 24 hours)
- **Adjudicator rulings**: Adjudicator creates entry
- **Ali decrees**: Consigliere creates entry
- **Constitutional amendments**: Constitution Keeper creates entry

**Step 3: Entry Added to Registry**
- Copy template above
- Fill in all fields
- Assign PREC-ID: `PREC-YYYY-MM-DD-NN` (NN = increment if multiple precedents same day)
- Add to "Active Precedents" section (newest first)
- Commit: `git commit -m "Add PREC-YYYY-MM-DD-NN: [title]"`

**Step 4: Notify Agents**
- Flash message in daily log: "📜 NEW PRECEDENT: PREC-YYYY-MM-DD-NN ([title])"
- Update CURRENT_STATUS.md if precedent affects active work

---

## Precedent Conflicts

**If two precedents contradict**:
1. **Constitution Keeper detects conflict** (quarterly review or when discovered)
2. **Constitution Keeper files**: `precedents/conflicts/CONFLICT-YYYY-MM-DD-NN.md`
   - Precedent A says: [X]
   - Precedent B says: [Y]
   - Conflict: [Why contradictory]
3. **Constitution Keeper drafts CIP** proposing resolution (keep A, keep B, or create new precedent C)
4. **Consigliere presents CIP to Ali** via Royal Briefing
5. **Ali selects option** → winning precedent stays ACTIVE, loser moved to "Superseded Precedents" section

---

## Quarterly Review

**Responsibility**: Constitution Keeper

**Cadence**: Every 90 days (or after every 50 new precedents, whichever comes first)

**Review Tasks**:
1. **Conflict Detection**: Scan all active precedents for contradictions
2. **Obsolescence Check**: Identify precedents made obsolete by constitutional amendments
3. **Consolidation**: If related precedents can be merged into single precedent, draft CIP to consolidate
4. **File Size Monitoring**: If PRECEDENT_REGISTRY.md exceeds 2000 lines, propose upgrade to categorized system (CIP-04 Option 3)

---

## Upgrade Path

**If this single-file registry grows too large** (>200 entries or >2000 lines):

Constitution Keeper may draft CIP proposing **upgrade to CIP-04 Option 3** (multi-file categorized system):
- `categories/builder-decisions.md`
- `categories/constitutional-amendments.md`
- `categories/emergency-powers.md`
- `superseded/` directory
- Quarterly review process

**Migration process** (if upgrade CIP approved):
1. Create category files
2. Move precedents from single file to appropriate category
3. Update tooling/scripts
4. Preserve this file as `precedents/archive/PRECEDENT_REGISTRY_v1.md`

---

**This registry is maintained by The Adjudicator, The Consigliere, and Constitution Keeper. All agents have read access.**

**Last Updated**: 2025-11-11
**Total Active Precedents**: 3
**Total Superseded Precedents**: 0
**Next Quarterly Review**: 2026-02-11

`<<Constitutional Authority: CIP-04 Precedent Registry System (Option 2)>>`
