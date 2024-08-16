# Define the process name to monitor
$processName = "rundll32"

# Infinite loop to continuously check for the process
while ($true) {
    # Get all instances of the process
    $processes = Get-Process -Name $processName -ErrorAction SilentlyContinue
    
    # Check if any instances were found
    if ($processes) {
        foreach ($process in $processes) {
            try {
                # Kill the process
                $process.Kill()
                Write-Host "Killed process: $($process.Id) - $($process.ProcessName)"
            } catch {
                Write-Host "Failed to kill process: $($process.Id) - $($process.ProcessName). Error: $_"
            }
        }
    }
    
    # Sleep for a short interval before checking again
    Start-Sleep -Seconds 5
}
