<#
.SYNOPSIS
    This PowerShell script ensures the system requires a password when resuming from sleep (AC & DC).

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-AC-000040

.TESTED ON
    Date(s) Tested  : 2026-03-26
    Tested By       : Yemisi Daodu
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator in PowerShell ISE.
#>

# --- REMEDIATION CODE START ---
# This path controls the Power Management policies for the Lock Screen
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

Write-Host "--- Applying STIG Fix: Require Password on Wakeup (WN11-AC-000040) ---" -ForegroundColor Cyan

# 1. Ensure the Power Policy path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# 2. Set DC (Battery) and AC (Plugged In) to 1 (Require Password)
# A value of 1 forces the lock screen to engage upon waking.
Set-ItemProperty -Path $regPath -Name "DCSettingIndex" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath -Name "ACSettingIndex" -Value 1 -Type DWord

# 3. Refresh Group Policy to enforce the new registry keys
gpupdate /force

Write-Host "`nSuccess: Password requirement on wakeup enforced for all power states." -ForegroundColor Green
# --- REMEDIATION CODE END ---
