---
name: spec-driven-development
description: This skill should be used when users want guidance on Spec-Driven Development methodology using GitHub's Spec-Kit with Codex. It is specially designed for Codex usage, translating upstream Spec-Kit slash-command guidance into Codex skill usage and direct workspace actions. It is optimized for Jira-based workflows and requires a Jira epic or ticket ID before starting a new specification so the ID can be preserved in the generated feature branch short name. Guide users through executable specification workflows for both new projects (greenfield) and existing codebases (brownfield), and after any SDD step generates artifacts, automatically provide structured 10-point summaries with feature status tracking.
license: MIT
---

# Spec-Driven Development (SDD) Skill

Guide users through GitHub's Spec-Kit for Spec-Driven Development - a methodology that flips traditional software development by making specifications executable and directly generating working implementations.

## Codex Execution Model

This skill is specially designed for Codex, not just generally compatible with it.

It is also optimized for Jira-oriented workflows.

## Scope

This is the Codex-adapted variant of the SDD workflow.

Use this skill to:
- run Spec-Kit workflows in a Codex-native way
- translate upstream slash-command-oriented guidance into Codex skill usage
- bridge brownfield and orchestration gaps where Spec-Kit does not install a dedicated Codex skill

Prefer installed `$speckit-*` Codex skills when they exist. Use this `sdd` skill to orchestrate the overall workflow, summarize artifacts, manage feature status, and handle brownfield-only steps directly in the workspace.

## Jira Optimization

This skill is optimized to be used with Jira.

Treat Jira as a prerequisite for starting a new feature specification.

Before starting a new `Specify` step, always obtain the Jira parent issue key first.

Accepted examples:
- `JCOM-123`
- `jcom-123`

If the user does not have an issue yet, create it first through a configured Jira CLI.

Do not begin a new `Specify` step until the Jira key is known.

For Jira issue creation and lookup:
- assume the default Jira project key is `JCOM` unless the user explicitly provides another project key
- use Jira CLI for issue creation, issue lookup, title lookup, and subtask creation

## Jira CLI Setup and Authentication

If Jira CLI is required but unavailable, prefer the repository bootstrap script when the current repo provides one:

```bash
./scripts/setup-jira-cli.sh
```

The script may install `jira-cli` with Homebrew when `brew` is available, but it must not create or store credentials for the user.

Do not automate credential capture inside this skill.

Ask the user to provide their own Atlassian API token and initialize the CLI securely.

For `ankitpokhrel/jira-cli`, prefer this setup flow:

```bash
export JIRA_API_TOKEN="<your-atlassian-api-token>"
jira init
```

During `jira init`, the user should choose the correct Jira deployment type and provide their Jira site URL and email address.

If the team already uses another secure credential source such as `.netrc`, keychain, or a managed shell profile, use that instead of writing secrets into repo files.

If Jira CLI is unavailable, unauthenticated, or the token is expired when CLI-backed Jira work is required, stop and tell the user to install or reconfigure it before continuing.

## Jira-Driven Naming Rules

Keep the naming conventions from this SDD skill.

When invoking the specification workflow for a new feature, explicitly preserve the Jira ID in the branch short name.

Preferred Spec-Kit feature format:

```text
001-jcom-123-short-feature-name
```

This format applies to the generated branch short name and the matching feature directory under `specs/`.

The numeric prefix is controlled by Spec-Kit.

The Jira-specific part of the short name must start with the normalized Jira key in lowercase, followed by a concise kebab-case feature suffix.

Use the Jira issue title to derive the suffix whenever possible.

Preferred source order for the suffix:
1. Jira CLI title lookup
2. Fallback: derive a concise branch-safe suffix from the specification request itself

Example:
- Jira ID: `JCOM-123`
- Jira title: `Add family mode to trip planner`
- Branch short name: `jcom-123-family-mode-trip-planner`
- Full Spec-Kit feature name: `001-jcom-123-family-mode-trip-planner`

If Jira data cannot be retrieved, do not block the workflow after the Jira key is known.

Instead, derive the suffix from the spec request and continue, while noting that Jira title lookup was unavailable.

When guiding the user or generating a prompt for `$speckit-specify`, instruct Codex to preserve the Jira ID in the branch short name, for example:

```text
$speckit-specify JCOM-123 Add user authentication.
Preserve the Jira ID in the branch short name.
Use branch short name: jcom-123-user-auth.
```

Feature folders follow this format:

```text
001-jcom-123-family-mode-trip-planner
```

That means:

```text
<numeric-prefix>-<jira-id>-<feature-name>
```

The Jira ID always follows this pattern:

```text
<project>-<number>
```

Example:

```text
jcom-123
```

## Jira Issue and Subtask Operations

If the user says the Jira issue does not exist yet, create it first through Jira CLI.

Write the Jira summary and description in English based on the user's request.

Default to a task-like issue type unless the user asked for another type.

Preferred command shape:

```bash
jira issue create \
  --project JCOM \
  --summary "<english summary>" \
  --description "<english description>" \
  --type Task
```

Replace `JCOM` with the user-provided project key when they explicitly requested a different Jira project.

If the installed Jira CLI variant uses different subcommands or flags, adapt the command to that CLI while preserving the same behavior.

Capture the created Jira key from the CLI output and use it for the Spec-Kit feature name.

After `tasks.md` is generated, suggest that the user review the created task list.

If the user confirms that the generated backlog looks correct, suggest creating Jira subtasks automatically from `tasks.md`.

When the user agrees, create one Jira subtask per task in `tasks.md` through Jira CLI.

Every created Jira task must be a subtask of the Jira epic or parent issue already associated with the feature.

Primary source for that Jira ID:
1. the Jira epic or ticket ID the user provided at the start of the workflow
2. fallback: infer it from the feature folder name

Before creating Jira subtasks:
- read `tasks.md`
- map each actionable task into a Jira subtask title and description
- preserve task ordering where possible
- make sure the correct Jira parent is used for every created subtask

If Jira CLI is unavailable for the requested operation, stop and tell the user that Jira CLI must be installed and configured before continuing.

## Structured Guide Source

Use [`example/EXAMPLE.md`](example/EXAMPLE.md) as the default structured teaching guide for explaining how to use Spec-Driven Development with Spec Kit in Codex.

That example is the canonical workflow narrative for this skill when the user asks for:
- a structured guide
- a walkthrough of the workflow
- an explanation of the phases in order
- an example of how to apply Spec Kit with Codex

When using that example, preserve its phase order and teaching intent:
1. Specify
2. Plan
3. Break into Tasks
4. Implement
5. Tests
6. Maintain

Also preserve its Codex adaptation rules:
- translate upstream slash-command wording into Codex skill usage when appropriate
- explain which artifacts are produced at each phase
- remind the user to review and adjust generated artifacts before trusting them
- keep the workflow tied to repository-local artifacts under version control

If the user wants a concise explanation, summarize the example instead of reproducing it fully.

If the user wants a practical walkthrough, use the example's structure directly and tailor the examples to the user's domain.

Use the actual Codex setup path for the project type:

```bash
# Greenfield: create a new project directory
specify init <PROJECT_NAME> --ai codex --ai-skills

# Brownfield: initialize inside an existing project
specify init . --ai codex --ai-skills
# or
specify init --here --ai codex --ai-skills
```

Operational rules:
- `specify init --ai codex` requires `--ai-skills`; prompt-based Codex initialization is deprecated by the CLI
- Spec-Kit installs generated Codex skills into `.agents/skills/`
- Codex is a skills-based exception in Spec-Kit, not a standard slash-command agent
- Project memory and templates live under `.specify/`
- For core greenfield flow, use the installed Codex skills:
  - `$speckit-constitution`
  - `$speckit-specify`
  - `$speckit-plan`
  - `$speckit-tasks`
  - `$speckit-implement`
  - Optional: `$speckit-clarify`, `$speckit-analyze`, `$speckit-checklist`
- For brownfield-only workflows not installed as Codex skills by `specify init`, perform them through this `sdd` skill using natural language and direct artifact updates

When upstream docs mention slash commands like `/speckit.plan`, translate them to Codex usage:
- Use the matching installed `$speckit-*` skill when it exists
- Otherwise treat it as a workflow that Codex performs directly in the repo

## Do Not Use Claude-Specific Paths or Commands

For this Codex skill, do not assume any Claude-specific setup.

Do not rely on:
- `.claude/commands/`
- `~/.claude/...`
- direct `/speckit.*` slash commands as the primary execution model in Codex
- older `.speckit/` path examples unless you are explicitly interpreting legacy upstream documentation

Prefer:
- `.agents/skills/` for installed Codex skills
- `.specify/` for project memory, templates, and helper scripts
- generated feature paths such as `specs/<feature>/...` when reporting artifacts

## Codex Directory and Invocation Conventions

Upstream Spec-Kit treats Codex differently from agents that use command folders such as `.claude/commands/`.

For Codex:
- generated assets live in `.agents/skills/`
- generated skill files are Markdown-based
- the expected invocation pattern is `$speckit-<command>`

Examples:
- `$speckit-constitution`
- `$speckit-specify`
- `$speckit-plan`
- `$speckit-tasks`
- `$speckit-implement`

When interpreting upstream agent-integration docs, prefer Codex's skills-based convention over generic command-folder conventions.

## Codex-Specific Expectations

When using this skill, Codex should:
- inspect the workspace directly instead of assuming generated artifacts exist
- summarize generated or modified artifacts after each SDD step unless the user asks to skip summaries
- update files in place when a brownfield workflow requires manual bridging not covered by installed Codex skills
- keep feature status and next-step guidance consistent even when some steps are performed manually
- use `example/EXAMPLE.md` as the preferred structured explanation template when teaching or documenting the workflow
- ask for a Jira epic or ticket ID before starting a new feature specification if the user has not already supplied one
- create the Jira issue first through Jira CLI when the user confirms that no Jira issue exists yet
- preserve that Jira ID in the branch short name for the resulting Spec Kit feature branch
- keep the Spec-Kit naming convention `001-jira-id-feature-name` instead of switching to a raw Jira-only branch name
- try to retrieve the Jira ticket title through Jira CLI and use it as the basis for the short feature name
- fall back to a short feature name derived from the specification request if Jira lookup is unavailable or fails
- after `tasks.md` is created, suggest that the user review the task list before implementation starts
- if the user approves the backlog, suggest creating Jira subtasks from `tasks.md`
- when the user agrees, create one Jira subtask per task under the correct Jira epic or parent issue
- recover the Jira ID from the feature folder name if it is not already available in context

## Command Translation Table

Translate common upstream Spec-Kit command references like this:

| Upstream Reference | Codex Usage |
|--------------------|-------------|
| `/speckit.constitution` | `$speckit-constitution` |
| `/speckit.specify` | `$speckit-specify` |
| `/speckit.plan` | `$speckit-plan` |
| `/speckit.tasks` | `$speckit-tasks` |
| `/speckit.implement` | `$speckit-implement` |
| `/speckit.clarify` | `$speckit-clarify` |
| `/speckit.analyze` | `$speckit-analyze` |
| `/speckit.checklist` | `$speckit-checklist` |
| `/speckit.brownfield` | Brownfield workflow handled directly by this `sdd` skill |
| `/speckit.analyze-codebase` | Codebase analysis handled directly by this `sdd` skill |
| `/speckit.reverse-engineer` | Reverse-engineering handled directly by this `sdd` skill |
| `/speckit.integration-plan` | Integration planning handled directly by this `sdd` skill |

## Current CLI Assumptions

These assumptions were verified against the current `specify` CLI during adaptation:
- `specify --help` exposes `init`, `check`, `version`, `extension`, and `preset`
- `specify init --ai codex` requires `--ai-skills`
- Codex skill installation goes to `.agents/skills/`
- Codex commands are exposed as skills invoked with `$speckit-<command>`
- project memory/templates live under `.specify/`
- Codex initialization does not use the old prompt-command setup model used by some other agents

If the CLI changes in the future, update this skill and its references accordingly.

## Brownfield Gap Handling

Spec-Kit's Codex initialization currently focuses on the main greenfield feature flow. When a brownfield step does not have a dedicated installed Codex skill:
- perform the workflow directly through this `sdd` skill
- inspect the codebase and existing artifacts directly
- create or update the necessary artifacts in the workspace
- preserve the same summarization and feature-status feedback loop used for the main flow

Examples of brownfield steps commonly handled directly by this skill:
- codebase analysis
- reverse-engineering existing features
- constitution generation from existing patterns
- integration planning for new features in an existing codebase

## Validation Checklist for This Codex Variant

When updating this skill in the future, verify the Codex adaptation against upstream Spec-Kit behavior:
- run `specify --help`
- run `specify init --ai codex --ai-skills` in a temporary directory
- confirm `.agents/skills/` is generated
- confirm the expected `$speckit-*` skills are generated
- confirm `.specify/` and generated feature artifact paths still match the guidance in this skill

## Core Philosophy

Spec-Driven Development emphasizes:
- **Intent-driven development**: Define the "what" before the "how"
- **Rich specification creation**: Use guardrails and organizational principles
- **Multi-step refinement**: Not one-shot code generation
- **AI-native**: Heavy reliance on advanced AI capabilities

Remember: This is **AI-native development**. Specifications aren't just documentation - they're executable artifacts that directly drive implementation. The AI agent uses them to generate working code that matches the intent defined in the specs.

## Quick Decision Tree

### Is this a new project (greenfield)?
→ **See [Greenfield Workflow](references/greenfield.md)** for the complete 6-step process

### Is this an existing codebase (brownfield)?
→ **See [Brownfield Workflow](references/brownfield.md)** for reverse-engineering and integration guidance

### Need installation help?
→ **See [Installation Guide](references/sdd_install.md)** for setup and troubleshooting

## Installation Quick Start

**Recommended (Persistent):**
```bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```

**One-time Usage:**
```bash
# Greenfield
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME> --ai codex --ai-skills

# Brownfield
uvx --from git+https://github.com/github/spec-kit.git specify init . --ai codex --ai-skills
# or
uvx --from git+https://github.com/github/spec-kit.git specify init --here --ai codex --ai-skills
```

**Verify:**
```bash
specify check
```

For detailed installation options, troubleshooting, and environment variables, see [Installation Guide](references/sdd_install.md).

## Supported AI Agents

Optimized for:
- ✅ Codex

Spec-Kit also supports:
- ✅ Claude Code
- ✅ GitHub Copilot
- ✅ Gemini CLI
- ✅ Cursor
- ✅ Qwen Code
- ✅ opencode
- ✅ Windsurf
- ✅ Kilo Code
- ✅ Auggie CLI
- ✅ CodeBuddy CLI
- ✅ Roo Code
- ✅ Codex CLI
- ✅ Amp
- ⚠️ Amazon Q Developer CLI (doesn't support custom arguments for slash commands)

## Artifact Summarization and Feedback Loop

**CRITICAL WORKFLOW**: After any SDD command generates or modifies artifacts, automatically follow this feedback loop to keep the user engaged:

### After Each Command Completes

1. **Detect Artifact Changes**
   - Identify which artifacts were created or modified:
     - `constitution.md` (project principles)
     - `spec.md` (requirements specification)
     - `plan.md` (technical implementation plan)
     - `tasks.md` (actionable task breakdown)
     - Analysis reports from brownfield workflows

2. **Read and Summarize**
   - Read the relevant artifact(s)
   - Extract key information:
     - **For constitution.md**: Core principles, coding standards, constraints
     - **For spec.md**: Main requirements, user stories, success criteria
     - **For plan.md**: Tech stack choices, architecture decisions, milestones
     - **For tasks.md**: Number of tasks, major task categories, dependencies
     - **For analysis reports**: Current patterns, tech debt, integration points

3. **Present Structured Summary** (Use 10-Point Template Below)
   - Show what was generated and why
   - Highlight the most important decisions with rationale
   - Include quality indicators and watch-outs
   - Keep summary focused and actionable
   - Use clear headings for each section

4. **Include Feature Status** (Hybrid Approach)
   - Brief status line in every summary
   - Detailed status on demand when the user asks for status
   - See "Feature Status Tracking" section below

5. **Offer Feedback Options**
   - **Option A**: "Looks good, proceed to next step"
   - **Option B**: "I'd like to modify [specific section]"
   - **Option C**: "Regenerate with these changes: [user input]"
   - **Option D**: "Explain why [specific decision] was made"

### 10-Point Summary Template

Use this structured format after ANY SDD command completes:

```
## ✅ [Command Name] Completed - Here's What Just Happened

### 🎯 Key Decisions Made (Top 3)
1. [Decision] - **Rationale:** [Why this was chosen]
2. [Decision] - **Rationale:** [Why this was chosen]
3. [Decision] - **Rationale:** [Why this was chosen]

### 📋 What Was Generated
- [Artifact 1]: [Brief description of content]
- [Artifact 2]: [Brief description of content]

### 🔍 Important Items to Review (Top 3)
1. [Critical item to check and why it matters]
2. [Important detail to verify and potential impact]
3. [Edge case to consider and how it affects the design]

### ⚠️ Watch Out For (Top 2)
- [Potential issue or gotcha] - **How to avoid:** [Guidance]
- [Common mistake] - **How to avoid:** [Guidance]

### 🔄 What This Enables Next (2 Options)
- **Option 1:** [Next step] - Best if: [Condition]
- **Option 2:** [Alternative step] - Best if: [Condition]

📊 **Feature Status:** [Current Feature Name] ([Stage]) → Next: [Next Feature]
   Progress: [●●●○○] [X]% | Completed: [N] of [Total] features | Dependencies: [Status]

**Your options:** [A] Proceed [B] Modify [C] Explain more [D] Show full status
```

### Example: Enhanced Summarization After `$speckit-specify`

\`\`\`
## ✅ Specify Completed - Here's What Just Happened

### 🎯 Key Decisions Made
1. **Authentication: JWT tokens** - Rationale: Stateless architecture, horizontally scalable, industry standard
2. **Password requirements: 12+ characters with complexity** - Rationale: Balances security (NIST guidelines) with usability
3. **Session timeout: 24 hours** - Rationale: Standard for web apps, balances security vs user convenience

### 📋 What Was Generated
- `specs/001-user-auth/spec.md`: Complete requirements with 5 user stories, 8 success criteria, 3 edge cases

### 🔍 Important Items to Review
1. **Password reset flow** - Verify email requirements match your infrastructure (SMTP server, templates)
2. **Multi-factor authentication** - Currently marked as "future enhancement"; may need to be in MVP
3. **Rate limiting** - Set at 5 login attempts per 15 min; consider if this fits your security policy

### ⚠️ Watch Out For
- **Email service dependency not specified** - How to avoid: Add email service to plan.md dependencies
- **GDPR compliance for user data** - How to avoid: Review data retention and user deletion requirements

### 🔄 What This Enables Next
- **Option 1:** Run `$speckit-plan` to design technical implementation - Best if: Requirements look good
- **Option 2:** Modify specify.md - Best if: You need to adjust requirements or add features

📊 **Feature Status:** user-authentication (Specified) → Next: profile-management
   Progress: [●●○○○] 40% | Completed: 1 of 5 features | Dependencies: database-setup ✅

**Your options:** [A] Proceed to planning [B] Modify requirements [C] Explain JWT choice [D] Show full status
\`\`\`

### When to Skip Summarization

Only skip the summarization step when:
- User explicitly requests "skip summaries" or "run all steps automatically"
- Re-running a command without artifact changes
- Command fails or produces errors (troubleshoot instead)

### Benefits of This Workflow

- **Eliminates "black box" feeling**: Clear explanations of what was generated and why
- **Enables early feedback**: Catch misunderstandings before implementation
- **Maintains agility**: Quick review with structured format, not lengthy approval processes
- **Builds trust**: User sees the AI's reasoning and decisions with rationale
- **Provides context**: Feature status keeps users oriented in the overall project

## Feature Status Tracking

### Hybrid Approach

After every SDD step, include a **brief feature status line** in the summary. Provide **detailed status on demand** when the user asks for it.

### Brief Status Line Format

Include this at the end of every summary:

```
📊 **Feature Status:** [Current Feature Name] ([Stage]) → Next: [Next Feature Name]
   Progress: [●●●○○] [X]% | Completed: [N] of [Total] features | Dependencies: [Dep] ✅/⏸️
```

**Stage values:**
- `Specifying` (20% complete)
- `Planning` (40% complete)
- `Tasking` (60% complete)
- `In Progress` (80% complete)
- `Complete` (100% complete)

**Progress indicator:**
- Use filled circles (●) for completed stages
- Use empty circles (○) for pending stages
- Calculate percentage based on stage

### Detailed Status Dashboard

When the user requests full status (option D) or asks for feature status, show:

```
📊 Project Feature Status Dashboard

🎯 CURRENT FEATURE
├─ [feature-name] ([Stage] - [X]% complete)
│  ├─ ✅ Requirements specified
│  ├─ 🔄 Implementation plan in progress
│  ├─ ⏸️  Tasks not started
│  └─ ⏸️  Implementation not started
│  Blockers: [None | Description]
│  Dependencies: [feature-name] ✅

✅ COMPLETED FEATURES ([N])
├─ [feature-1] (100% complete)
└─ [feature-2] (100% complete)

📋 UPCOMING FEATURES ([N])
├─ [feature-3] (depends on: [current-feature])
└─ [feature-4] (depends on: [feature-3])

⚠️  BLOCKED FEATURES ([N])
[List any features that are blocked with reasons]
```

### Natural Language Feature Management

Codex should automatically detect and handle natural language feature management requests:

**User says:** "Move feature XYZ before ABC"
**Codex does:**
1. Reads the current feature list from `specs/` and related planning artifacts
2. Shows current order with numbers
3. Proposes new order
4. Asks for confirmation
5. Updates feature priority/order in constitution or plan
6. Shows updated status dashboard

**User says:** "Add a new feature for email notifications"
**Codex does:**
1. Detects new feature request
2. Asks clarifying questions (priority, dependencies, description)
3. Generates feature spec outline
4. Inserts into feature list at appropriate position
5. Shows updated status dashboard

**User says:** "Let's do profile-management first"
**Codex does:**
1. Identifies current feature order
2. Proposes moving profile-management to top priority
3. Adjusts dependencies if needed
4. Updates artifacts
5. Shows updated status

**Detection patterns:**
- "Move [feature] before/after [other]" → Reorder
- "Add [feature]" → New feature
- "Let's do [feature] first" → Move to top priority
- "Skip [feature] for now" → Mark as deferred
- "We finished [feature]" → Update status to complete
- "What features depend on [feature]?" → Show dependency tree
- "Show feature status" → Display full dashboard

### Quick Feature Operations

Guide users through these operations when requested:

**Add Feature:**
```
User: "Add a feature for admin dashboard"
Codex:
1. What's the priority? (High/Medium/Low)
2. What features does this depend on? (user-auth, profile-management, etc.)
3. Brief description?
[Creates outline, shows updated status]
```

**Reorder Features:**
```
User: "Reorder features"
Codex:
Current order:
1. user-authentication
2. profile-management
3. admin-dashboard
4. email-notifications
5. reporting

How would you like to reorder? (provide new numbers or describe changes)
[Updates order, shows new status]
```

**Remove Feature:**
```
User: "Remove the reporting feature"
Codex:
⚠️  Warning: This will remove 'reporting' feature.
Dependencies affected: None
Are you sure? (yes/no)
[If yes: removes, updates status]
```

### Progress Calculation

Automatically calculate progress based on SDD workflow completion:

| Stage | Progress | Indicators |
|-------|----------|------------|
| **Specified** | 20% | `specify.md` exists |
| **Planned** | 40% | `plan.md` exists |
| **Tasked** | 60% | `tasks.md` exists |
| **In Progress** | 80% | Implementation started (code files modified) |
| **Complete** | 100% | Implementation complete, tests pass |

### Dependency Tracking

Track and visualize dependencies:

**Show dependencies:**
```
user-authentication
├─ Depends on: database-setup ✅
└─ Blocks: profile-management ⏸️, admin-dashboard ⏸️
```

**Check if ready:**
```
📊 Can we start profile-management?
   Checking dependencies...
   ✅ user-authentication (complete)
   ✅ database-setup (complete)

   All dependencies satisfied! Ready to proceed.
```

**Detect circular dependencies:**
```
⚠️  Warning: Circular dependency detected
   feature-A depends on feature-B
   feature-B depends on feature-C
   feature-C depends on feature-A

   Please resolve this before proceeding.
```

### Integration with Workflows

**For Greenfield Projects:**
- After the first successful specification step, ask if there are multiple features
- If yes, list them and track progress through each
- Show status after each command

**For Brownfield Projects:**
- After reverse-engineering existing functionality, create a feature list from what was discovered
- Track new features separately from existing documented features
- Show integration impact on status

For complete feature management guidance, see [Feature Management Guide](references/feature_management.md).

## How to Use This Skill

### When User Asks About SDD

1. Explain core philosophy: Executable specifications, intent-driven, AI-native
2. Verify prerequisites: \`uv\`, Python 3.11+, Git, AI agent
3. Determine project type: New (greenfield) vs existing (brownfield)
4. Guide to appropriate workflow:
   - Greenfield → [Greenfield Workflow](references/greenfield.md)
   - Brownfield → [Brownfield Workflow](references/brownfield.md)

### When User Wants to Start a New Project

1. Guide installation → [Installation Guide](references/sdd_install.md)
2. Initialize project:
   \`\`\`bash
   specify init my-project --ai codex --ai-skills
   \`\`\`
3. Follow greenfield workflow → [Greenfield Workflow](references/greenfield.md)
4. **After each step**: Summarize artifacts and get user feedback

### When User Has an Existing Codebase

1. Check for \`.specify/\` directory
2. **If missing** → Guide through [Brownfield Workflow](references/brownfield.md):
   - Analyze existing code
   - Generate constitution from existing patterns
   - Choose artifact generation strategy
   - Add new features with SDD
3. **If present** → Determine next step based on current progress
4. **After each step**: Summarize artifacts and get user feedback

### When User Wants to Add a Feature

**To greenfield project:**
1. Navigate to [Greenfield Workflow](references/greenfield.md)
2. Follow steps 3-6 (specify → plan → tasks → implement)
3. Summarize each artifact before proceeding

**To brownfield/existing project:**
1. Navigate to [Brownfield Workflow](references/brownfield.md)
2. Follow steps 6-7 (specify → integration planning → tasks → implement)
3. Summarize each artifact before proceeding

### When User Encounters Issues

1. **Installation issues** → [Installation Guide](references/sdd_install.md) troubleshooting section
2. **Workflow issues** → Check appropriate workflow guide:
   - [Greenfield troubleshooting](references/greenfield.md)
   - [Brownfield troubleshooting](references/brownfield.md)
3. **Feature detection** → Set \`SPECIFY_FEATURE\` environment variable (see [Installation Guide](references/sdd_install.md))

## Workflow Overview

### Greenfield (New Projects)

\`\`\`
specify init --ai codex --ai-skills → $speckit-constitution → [SUMMARIZE] →
$speckit-specify → [SUMMARIZE] → $speckit-plan → [SUMMARIZE] →
$speckit-tasks → [SUMMARIZE] → $speckit-implement
\`\`\`

**Full details:** [Greenfield Workflow](references/greenfield.md)

### Brownfield (Existing Projects)

\`\`\`
specify init --here --ai codex --ai-skills → [brownfield analysis via this skill] → [SUMMARIZE] →
[codebase analysis / reverse-engineering via this skill] → [SUMMARIZE] →
$speckit-specify → [SUMMARIZE] → [integration planning via this skill] → [SUMMARIZE] →
$speckit-tasks → [SUMMARIZE] → $speckit-implement
\`\`\`

**Full details:** [Brownfield Workflow](references/brownfield.md)

## Development Phases Supported

### 0-to-1 Development ("Greenfield")
Start with high-level requirements, generate specifications from scratch, plan implementation steps, build production-ready applications.

**→ [Greenfield Workflow](references/greenfield.md)**

### Iterative Enhancement ("Brownfield")
Add features iteratively to existing codebases, modernize legacy systems, adapt processes for evolving requirements, reverse-engineer existing code into SDD format.

**→ [Brownfield Workflow](references/brownfield.md)**

### Creative Exploration
Explore diverse solutions in parallel, support multiple technology stacks & architectures, experiment with UX patterns.

**→ [Greenfield Workflow](references/greenfield.md) - Multi-Stack Exploration section**

## Key Commands Reference

### Installation & Setup
\`\`\`bash
specify init <project> --ai codex --ai-skills
specify init --here --force --ai codex --ai-skills
specify check                       # Verify installation
\`\`\`

### Greenfield Workflow
\`\`\`
$speckit-constitution               # Project principles → SUMMARIZE
$speckit-specify                    # Define requirements → SUMMARIZE
$speckit-plan                       # Technical planning → SUMMARIZE
$speckit-tasks                      # Break down tasks → SUMMARIZE
$speckit-implement                  # Execute
\`\`\`

### Brownfield Workflow
\`\`\`
Use this `sdd` skill directly for brownfield-only workflows:
brownfield analysis                 # Analyze existing code → SUMMARIZE
analyze codebase                   # Deep analysis & constitution → SUMMARIZE
reverse-engineer existing features # Document existing features → SUMMARIZE
integration planning               # Plan new feature integration → SUMMARIZE
\`\`\`

### Optional Enhancement Commands
\`\`\`
$speckit-clarify                   # Clarify ambiguous requirements
$speckit-analyze                   # Cross-artifact consistency check
$speckit-checklist                 # Generate quality checklists
\`\`\`

## Analysis Scripts

If this skill bundles analysis helpers under `scripts/`, invoke them with paths relative to the skill root or with absolute paths in the current Codex environment. Do not hardcode `~/.claude/...` paths.

### \`scripts/phase_summary.sh\`
Generates a comprehensive progress report across all phases in a tasks.md file:
- Shows completion percentage for each phase
- Lists pending tasks per phase
- Highlights simplified/modified tasks
- Provides overall progress statistics
- Supports any SDD feature's tasks.md file

**Usage:**
\`\`\`bash
scripts/phase_summary.sh specs/003-keyboard-shortcuts/tasks.md
\`\`\`

**Output:** Markdown-formatted phase-by-phase progress report with:
- Phase-by-phase completion percentages
- Pending task lists (up to 5 per phase)
- Simplified task warnings
- Overall feature progress summary

**When to Use:**
- Check progress on any SDD feature
- Get quick overview of what's complete vs pending
- Identify phases that need attention
- Generate status reports for stakeholders

### \`scripts/analyze-requirements.py\`
Analyzes requirement coverage across spec.md and tasks.md:
- Maps functional requirements (FR-001, FR-002, etc.) to implementation tasks
- Identifies uncovered requirements (gaps in task coverage)
- Flags vague requirements lacking measurable criteria
- Calculates coverage percentage

**Usage:**
\`\`\`bash
python3 scripts/analyze-requirements.py
\`\`\`

**Output:** JSON with coverage metrics, uncovered requirements, vague requirements

### \`scripts/analyze-success-criteria.py\`
Analyzes success criteria verification coverage:
- Maps success criteria (SC-001, SC-002, etc.) to verification tasks
- Validates measurability of each criterion
- Identifies criteria without verification tasks
- Groups by metric type (performance, accessibility, usability)

**Usage:**
\`\`\`bash
python3 scripts/analyze-success-criteria.py
\`\`\`

**Output:** JSON with coverage summary, verification task mapping

### \`scripts/analyze-edge-cases.py\`
Analyzes edge case coverage across specifications:
- Maps edge cases to explicit task coverage
- Identifies implicitly covered cases (handled by general logic)
- Flags uncovered edge cases requiring attention
- Categorizes coverage type (EXPLICIT, IMPLICIT, UNCOVERED)

**Usage:**
\`\`\`bash
python3 scripts/analyze-edge-cases.py
\`\`\`

**Output:** JSON with coverage breakdown, uncovered edge case details

**When to Use:**
If present, these scripts can be invoked during `$speckit-analyze` or equivalent Codex validation work to provide deep consistency validation. They help identify:
- Requirements without task coverage
- Success criteria without verification
- Edge cases that need test coverage
- Ambiguous requirements needing clarification

### Validation Commands (Brownfield)
\`\`\`
validate reverse-engineering           # Verify spec accuracy
coverage check                         # Check documentation coverage
validate constitution                  # Verify constitution consistency
trace [feature]                        # Map specs to code
\`\`\`

## Detailed Documentation

- **[Installation Guide](references/sdd_install.md)**: Installation methods, troubleshooting, environment variables
- **[Greenfield Workflow](references/greenfield.md)**: Complete 6-step workflow for new projects
- **[Brownfield Workflow](references/brownfield.md)**: Complete 7-step workflow for existing codebases

## Integration with Other Skills

This skill works well with:
- **project-memory**: Document SDD decisions and patterns
- **design-doc-mermaid**: Visualize architecture from plan.md
- **github-workflows**: Automate SDD artifact validation
- **code-quality-reviewer**: Review generated implementation

## Resources

- GitHub Spec-Kit Repository: https://github.com/github/spec-kit
- Issues/Support: https://github.com/github/spec-kit/issues
- License: MIT

## Maintainers

- Den Delimarsky (@localden)
- John Lam (@jflam)
