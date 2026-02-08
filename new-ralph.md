---
name: new-ralph
description: Initialize an isolated Ralph run set with unique naming, folder structure, and prompt wiring so multiple runs can coexist in one repo.
argument-hint: "<prd-or-goal> [prefix] [slug] [context docs]"
tools: ['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'todo']
---
Create a brand-new Ralph "set" without reusing or overwriting previous run files.

## Outcome
Create a self-contained folder for one loop run:

`ralph/sets/<set-id>/`

Each set has its own:
- `plan.md`
- `activity.md`
- `prompt.md`
- `run.ps1`
- `screenshots/` directory

## Input Handling
Collect:
1. PRD or goal doc path (required)
2. Optional slug (defaults to PRD filename slug)
3. Optional extra context docs (0+ files)

If required input is missing, ask once and continue.

## Set ID Convention (Short Prefix)
Use:

`r-<YYMMDD>-<n>-<slug>`

Rules:
- Prefix is always `r` (for Ralph), so it stays short and consistent.
- `YYMMDD`: local date for ordering.
- `<n>`: 2-digit sequence for that date (`01`, `02`, ...). Pick the next available by checking existing `ralph/sets/r-<YYMMDD>-*/` folders.
- `slug`: short PRD/task slug.
- lowercase, hyphenated, alphanumeric only.

If the folder already exists, increment `<n>` (preferred) rather than appending `-v2`.

Example:
`r-260208-01-auth-refresh`

## Folder Structure
Create:

`ralph/sets/<set-id>/`
`ralph/sets/<set-id>/screenshots/`

Do not modify other set folders.

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
     - `[TASKS]` -> `ralph/sets/<set-id>/plan.md`
     - `[ACTIVITY]` -> `ralph/sets/<set-id>/activity.md`
     - `[RESEARCH]` -> PRD path + optional context docs
   - Ensure all file references are explicit paths, not placeholders

4. `run.ps1`
   - Create a set-local launcher that reads this set's `prompt.md`
   - Keep same behavior as root `ralph.ps1` (iterations + model + COMPLETE stop condition)
   - Default model can mirror root script unless user requests otherwise

## Multi-Set Safety Rules
- Never overwrite any existing set files.
- Never reuse root `plan.md`, `activity.md`, or `PROMPT.md` for active runs.
- Always generate a new `set-id` and folder per initialization.
- Keep changes scoped to `ralph/sets/<set-id>/` unless user explicitly asks otherwise.

## Completion Checklist
Before finishing, verify:
- `ralph/sets/<set-id>/` exists
- `plan.md`, `activity.md`, `prompt.md`, `run.ps1` exist
- `screenshots/` exists
- `prompt.md` contains concrete file paths and no `[TASKS]/[ACTIVITY]/[RESEARCH]` tokens

Then return:
1. created `set-id`
2. created file list
3. launch command:
   - PowerShell: `.\ralph\sets\<set-id>\run.ps1 -iterations 10`
