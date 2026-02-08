---
name: new-ralph
description: Initialize an isolated Ralph sprint with unique naming, folder structure, and prompt wiring so multiple runs can coexist in one repo.
argument-hint: "<prd-or-goal> [prefix] [slug] [context docs]"
tools: ['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'todo']
---
Create a brand-new Ralph "sprint" without reusing or overwriting previous run files.

## Outcome
Create a self-contained folder for one loop sprint:

`ralph/sprints/<sprint-id>/`

Each sprint has its own:
- `plan.md`
- `activity.md`
- `prompt.md`
- `run.ps1`
- `screenshots/` directory

## Input Handling
Collect:
1. PRD or goal doc path (required)
2. Research question/topic for current-state mapping (required)
3. Optional slug (defaults to PRD filename slug)
4. Optional extra context docs (0+ files)

If required input is missing, ask once and continue.

## Research Doc Generation (Current State)
Before creating `prompt.md`, generate a single current-state research document. This document is what `[RESEARCH]` refers to.

Use these instructions exactly:

# Research Codebase

You are tasked with conducting comprehensive research across the codebase to answer user questions by spawning parallel sub-agents (runSubagent tool) and synthesizing their findings into a new markdown file. The source of truth is the codebase itself, NOT documentation files. DON'T read any .md files unless explicitly mentioned in the user query.

## Core Directive:

**Document what exists, don't evaluate or improve it.** Your job is to create a technical map of the current system for future agents to use when solving related tasks.

## Research Workflow:

1. **Read any mentioned files fully first** (no limit/offset parameters)
2. **Spawn specialized parallel sub-agents** to research different aspects use runSubagent tool
3. **Wait for all sub-agents, then synthesize** with concrete file paths, line numbers, and connections between components

## Research Document Output:

Create `thoughts/shared/research/MM-DD-YY-description.md`:
```markdown
---
date: [ISO timestamp]
topic: "[question]"
---

# Research: [Topic]

## Research Question
[Original query]

## Summary
[High-level findings describing what exists]

## Detailed Findings
[Components, how they work, connections - with file:line references]

## Code References
- `path/to/file:123` - what's there

## Open Questions
[Areas needing more investigation, if any]
```
**Key**: Make findings concrete and navigable for future agents solving related problems. Do not insert opinion, recommendations, or improvements. Focus on documenting the current state only.

## Sprint ID Convention (Short Prefix)
Use:

`r-<YYMMDD>-<n>-<slug>`

Rules:
- Prefix is always `r` (for Ralph), so it stays short and consistent.
- `YYMMDD`: local date for ordering.
- `<n>`: 2-digit sequence for that date (`01`, `02`, ...). Pick the next available by checking existing `ralph/sprints/r-<YYMMDD>-*/` folders.
- `slug`: short PRD/task slug.
- lowercase, hyphenated, alphanumeric only.

If the folder already exists, increment `<n>` (preferred) rather than appending `-v2`.

Example:
`r-260208-01-auth-refresh`

## Folder Structure
Create:

`ralph/sprints/<sprint-id>/`
`ralph/sprints/<sprint-id>/screenshots/`

Do not modify other sprint folders.

## File Initialization
1. `plan.md`
   - Start from `plan-template.md`
   - Fill placeholders with project-specific values
   - Keep JSON task list shape intact

2. `activity.md`
   - Initialize with the same structure as root `activity.md`
   - Set "Current Task" to first planned task

3. `prompt.md`
   - Start from root `PROMPT.md`
   - Replace:
     - `[TASKS]` -> `ralph/sprints/<sprint-id>/plan.md`
     - `[ACTIVITY]` -> `ralph/sprints/<sprint-id>/activity.md`
     - `[RESEARCH]` -> the generated `thoughts/shared/research/MM-DD-YY-description.md`
   - Also attach the PRD/goal doc and any extra context docs in the prompt header (as additional `@path` tokens), so requirements are in-context without redefining `[RESEARCH]`
   - Ensure all file references are explicit paths, not placeholders

4. `run.ps1`
   - Create a sprint-local launcher that reads this sprint's `prompt.md`
   - Keep same behavior as root `ralph.ps1` (iterations + model + COMPLETE stop condition)
   - Default model can mirror root script unless user requests otherwise

## Multi-Sprint Safety Rules
- Never overwrite any existing sprint files.
- Never reuse root `plan.md`, `activity.md`, or `PROMPT.md` for active runs.
- Always generate a new `sprint-id` and folder per initialization.
- Keep changes scoped to `ralph/sprints/<sprint-id>/` unless user explicitly asks otherwise.

## Completion Checklist
Before finishing, verify:
- `ralph/sprints/<sprint-id>/` exists
- `plan.md`, `activity.md`, `prompt.md`, `run.ps1` exist
- `screenshots/` exists
- `thoughts/shared/research/MM-DD-YY-description.md` exists for this run
- `prompt.md` contains concrete file paths and no `[TASKS]/[ACTIVITY]/[RESEARCH]` tokens

Then return:
1. created `sprint-id`
2. created file list
3. launch command:
   - PowerShell: `.\ralph\sprints\<sprint-id>\run.ps1 -iterations 10`
