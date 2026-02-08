# Running Ralph Wiggum with GitHub Copilot CLI

This guide adapts the Ralph Wiggum autonomous agent workflow for GitHub Copilot CLI, allowing you to run long-running, iterative coding tasks with fresh context windows per iteration.

## Overview

Ralph Wiggum is a method for running AI coding agents in continuous autonomous loops. This adaptation uses GitHub Copilot CLI instead of Claude Code, providing a cost-effective and efficient way to build projects iteratively.

**Best for:**
- Long-running tasks with clear goals
- Projects where you have a detailed plan (PRD)
- Tasks benefiting from continuous iteration without manual intervention

**Not ideal for:**
- Exploratory work without clear goals
- Quick one-off tasks
- Situations requiring frequent human input

## Prerequisites

- **GitHub Copilot CLI installed** and authenticated
- **Project with a detailed plan** (see `specs/prd.md` for the PRD)
- **Basic terminal familiarity**
- **Playwright MCP** configured for visual feedback (optional but recommended)

## Setup

The necessary files have been pre-configured in this repository:

- `plan.md`: Task list structured for autonomous execution
- `activity.md`: Log of completed work
- `PROMPT.md`: Master prompt for the agent
- `ralph.ps1`: PowerShell script for Windows (recommended)
- `ralph.sh`: Bash script for Unix-like systems
- `.mcp.json`: Playwright MCP configuration for screenshots
- `screenshots/`: Directory for visual verification screenshots

## Running the Workflow

### On Windows (PowerShell)

1. **Navigate to your project directory:**
   ```powershell
   cd C:\Users\thedc\Desktop\GitHub\SpatialSoftWeb
   ```

2. **Run the autonomous loop:**
   ```powershell
   .\ralph.ps1 -iterations 10
   ```

   This starts a 10-iteration loop. Each iteration:
   - Reads the current state from `plan.md` and `activity.md`
   - Finds the next failing task
   - Implements the task
   - Takes a screenshot for verification
   - Updates the plan and commits changes
   - Logs progress

3. **Monitor progress:**
   - Check `activity.md` for logged updates
   - View screenshots in `screenshots/` folder
   - Review git commits for each completed task

### On Unix-like Systems (Bash)

If running on a different system:

```bash
./ralph.sh 10
```

## Customization

### Choosing a Model

Specify the AI model as a second argument:

```powershell
# Use Claude Sonnet 4.5 (default)
.\ralph.ps1 -iterations 10

# Use GPT-5
.\ralph.ps1 -iterations 10 -model gpt-5

# Use Gemini 3 Pro Preview
.\ralph.ps1 -iterations 10 -model gemini-3-pro-preview
```

Available models include (as of jan 2026):
- `claude-sonnet-4.5` (default)
- `claude-haiku-4.5`
- `claude-opus-4.5`
- `gpt-5`
- `gpt-5-mini`
- `gemini-3-pro-preview`

### Adjusting Iterations

- Start with 10-20 iterations for testing
- Increase for larger projects
- The loop stops early if all tasks complete (when `<promise>COMPLETE</promise>` is output)

### Permissions

The scripts use `--allow-all-paths` and `--allow-all-urls` to minimize prompts. On first run, you'll need to confirm you trust the folder.

## Workflow Details

### How It Works

1. **Fresh Context:** Each iteration starts with a clean context window
2. **Task Selection:** Agent reads `plan.md` and picks the next failing task
3. **Implementation:** Works on exactly one task at a time
4. **Verification:** Uses Playwright to take screenshots
5. **Logging:** Updates `activity.md` and commits changes
6. **Iteration:** Repeats until completion or max iterations reached

### File References

The prompt automatically includes:
- `@plan.md`: Current task status
- `@activity.md`: Progress log
- `@specs/prd.md`: Project requirements

### Visual Feedback

Playwright MCP provides screenshots for each task, saved as `screenshots/[task-name].png`.

## Troubleshooting

### Common Issues

1. **Permission Denied:**
   - Ensure Copilot CLI is authenticated: Run `copilot` interactively first
   - Confirm you trust the folder on first run

2. **Port Already in Use:**
   - The prompt instructs the agent to try different ports if 4321 is taken

3. **Agent Gets Stuck:**
   - Check `plan.md` for ambiguous tasks
   - Review `activity.md` for last actions
   - Reduce iterations and debug manually

4. **Playwright Not Working:**
   - Verify `.mcp.json` configuration
   - Ensure Playwright MCP is installed: `npx @playwright/mcp@latest`

5. **Model Not Available:**
   - Check available models with `copilot --help`
   - Ensure you have access to the selected model

### Stopping the Loop

- Press `Ctrl+C` in the terminal to interrupt
- The loop will exit gracefully after the current iteration

## Best Practices

- **Plan Thoroughly:** Use a detailed PRD before starting
- **Set Reasonable Limits:** Always specify max iterations
- **Monitor Progress:** Check `activity.md` and git history regularly
- **Backup Work:** Commit frequently (the script does this automatically)
- **Test Iteratively:** Start with small iteration counts

## References

- [Original Ralph Wiggum Guide](https://youtu.be/eAtvoGlpeRU)
- [GitHub Copilot CLI Documentation](https://docs.github.com/en/copilot/github-copilot-cli)
- [Playwright MCP](https://github.com/microsoft/playwright-mcp)

---

*Adapted from the Ralph Wiggum workflow for GitHub Copilot CLI compatibility.*</content>
<parameter name="filePath">c:\Users\thedc\Desktop\GitHub\SpatialSoftWeb\docs\ralph-copilot.md