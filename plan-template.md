# Project Plan (Template)

## Overview
This file is a *format/template* for a Ralph `plan.md`.

It is not a suggested task list. Do not copy the example task contents verbatim. Replace the placeholders with your project-specific tasks.

Project: **[PROJECT_NAME]**
Goal: **[PRIMARY_GOAL / OUTCOME]**

**Reference:**  
`specs/[PRD_FILE].md`

**Relevant Context** // (if provided)
`context/[CONTEXT_DOC_1].md`  
`context/[CONTEXT_DOC_2]` (inspiration / reference)
---

## Task List

Rules:
- The task list must be valid JSON (no trailing commas, no comments).
- Keep the overall shape: an array of objects with `category`, `description`, `steps`, `passes`.
- `passes` starts as `false` and is flipped to `true` only when the task is complete.

```json
[
  {
    "category": "[CATEGORY]",
    "description": "[TASK_DESCRIPTION]",
    "steps": [
      "[STEP_1]",
      "[STEP_2]",
      "[STEP_3]"
    ],
    "passes": false
  },
  {
    "category": "[CATEGORY]",
    "description": "[TASK_DESCRIPTION]",
    "steps": [
      "[STEP_1]",
      "[STEP_2]"
    ],
    "passes": false
  },
  {
    "category": "[CATEGORY]",
    "description": "[TASK_DESCRIPTION]",
    "steps": [
      "[STEP_1]"
    ],
    "passes": false
  }
]
```

---

## Agent Instructions

1. Read `activity.md` first to understand current state
2. Find next task with `"passes": false`
3. Complete all steps for that task
4. Verify in browser
5. Update task to `"passes": true`
6. Log completion in `activity.md`
7. Repeat until all tasks pass

**Important:** During execution, only modify the `passes` field. Do not remove, reorder, or rewrite tasks while working.

---

## Completion Criteria
All tasks marked with `"passes": true`
