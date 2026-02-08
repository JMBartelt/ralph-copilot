# Project Plan (Template)

## Overview
Rebuilding **[PROJECT_NAME]** according to the PRD. We are focused on **[PRIMARY_GOAL / OUTCOME]**.

**Reference:**  
`specs/[PRD_FILE].md`

**Relevant Context** // (if provided)
`context/[CONTEXT_DOC_1].md`  
`context/[CONTEXT_DOC_2]` (inspiration / reference)
---

## Task List

```json
[
  {
    "category": "setup",
    "description": "[SETUP_TASK_DESCRIPTION]",
    "steps": [
      "[SETUP_STEP_1]",
      "[SETUP_STEP_2]",
      "[SETUP_STEP_3]"
    ],
    "passes": false
  },
  {
    "category": "feature",
    "description": "[FEATURE_1_DESCRIPTION]",
    "steps": [
      "[FEATURE_1_STEP_1]",
      "[FEATURE_1_STEP_2]",
      "[FEATURE_1_STEP_3]",
      "[FEATURE_1_STEP_4]",
      "[FEATURE_1_STEP_5]"
    ],
    "passes": false
  },
  {
    "category": "feature",
    "description": "[FEATURE_2_DESCRIPTION]",
    "steps": [
      "[FEATURE_2_STEP_1]",
      "[FEATURE_2_STEP_2]",
      "[FEATURE_2_STEP_3]",
      "[FEATURE_2_STEP_4]"
    ],
    "passes": false
  },
  {
    "category": "feature",
    "description": "[FINAL_CTA_DESCRIPTION]",
    "steps": [
      "[FINAL_CTA_STEP_1]",
      "[FINAL_CTA_STEP_2]",
      "[FINAL_CTA_STEP_3]"
    ],
    "passes": false
  },
  {
    "category": "testing",
    "description": "[TESTING_AND_CLEANUP_DESCRIPTION]",
    "steps": [
      "[TEST_STEP_1]",
      "[TEST_STEP_2]",
      "[TEST_STEP_3]",
      "[TEST_STEP_4]"
    ],
    "passes": false
  }
]
````

---

## Agent Instructions

1. Read `activity.md` first to understand current state
2. Find next task with `"passes": false`
3. Complete all steps for that task
4. Verify in browser
5. Update task to `"passes": true`
6. Log completion in `activity.md`
7. Repeat until all tasks pass

**Important:** Only modify the `passes` field. Do not remove or rewrite tasks.

---

## Completion Criteria
All tasks marked with `"passes": true`