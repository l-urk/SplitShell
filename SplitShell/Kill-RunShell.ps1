# Update user system parameters
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class User32 {
    [DllImport("user32.dll")]
    public static extern int UpdatePerUserSystemParameters(int bForce, bool bUpdate);
}
"@

[User32]::UpdatePerUserSystemParameters(1, $true)

# Restart explorer
Stop-Process -Name explorer -Force
[System.Diagnostics.Process]::Start("explorer.exe")
Write-Host "Shell has reloaded successfully"