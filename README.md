# Ralph: Autonomous AI Coding Agent Workflow

Ralph is a highly sophisticated, iterative workflow designed for autonomous AI coding agents using the **GitHub Copilot CLI**. It allows you to automate complex, multi-step coding tasks by running them in a continuous loop with fresh context for each iteration.

## 🚀 Overview

Ralph is built for developers who want to leverage AI for long-running, planned tasks without manual intervention for every step. It follows a structured approach:

1.  **Selection:** Reads a project plan ([plan-template.md](plan-template.md)) and picks the next incomplete task.
2.  **Execution:** Implements the task changes in the codebase.
3.  **Verification:** Uses browser automation (via Chrome DevTools/Playwright) for visual verification.
4.  **Logging:** Updates an activity log ([activity.md](activity.md)) and commits the changes.
5.  **Iteration:** Repeats the process until all tasks in the plan are complete.

## 📂 Project Structure

-   [ralph.ps1](ralph.ps1): The main PowerShell script that drives the autonomous loop.
-   [PROMPT.md](PROMPT.md): The master prompt template that instructs the AI agent.
-   [ralph-copilot.md](ralph-copilot.md): Comprehensive documentation and user guide.
-   [new-ralph.md](new-ralph.md): Instructions for setting up new isolated "sprints."
-   [plan-template.md](plan-template.md): A blueprint for creating your project's task list.
-   [activity.md](activity.md): A structured log to track the agent's progress.

## 🛠️ Getting Started

### Prerequisites

-   **GitHub Copilot CLI** installed and authenticated.
-   **PowerShell** (for Windows users).
-   **Playwright / Chrome DevTools MCP** (optional, but recommended for visual tasks).

### Usage

1.  **Define your plan:** Create a `plan.md` in your project root using the [plan-template.md](plan-template.md) as a guide.
2.  **Initialize Activity:** Ensure [activity.md](activity.md) is present to track progress.
3.  **Run the Loop:**
    ```powershell
    .\ralph.ps1 -iterations 10 -model claude-sonnet-4.5
    ```

## 📖 Learn More

For a deep dive into how Ralph works, customization options (like model selection), and troubleshooting, refer to the [Ralph Workflow Guide](ralph-copilot.md).

---
*Adapted from the Ralph Wiggum autonomous agent concept.*
