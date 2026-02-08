param (
    [Parameter(Mandatory=$true)]
    [int]$iterations,
    [string]$model = "claude-opus-4.5"
)

for ($i = 1; $i -le $iterations; $i++) {
    Write-Host "Iteration $i (Model: $model)"
    Write-Host "--------------------------------"
    
    $prompt = Get-Content -Raw -Path "PROMPT.md"
    
    # Run copilot and capture output
    $result = copilot --model "$model" --prompt "$prompt" --allow-all-paths --allow-all-urls --allow-all-tools 2>&1
    
    Write-Host $result

    if ($result -like "*<promise>COMPLETE</promise>*") {
        Write-Host "All tasks complete after $i iterations."
        exit 0
    }
    
    Write-Host ""
    Write-Host "--- End of iteration $i ---"
    Write-Host ""
}

Write-Host "Reached max iterations ($iterations)"
exit 1
