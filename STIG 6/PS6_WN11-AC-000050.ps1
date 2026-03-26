<#
.SYNOPSIS
    This PowerShell script enforces a 15-minute inactivity timeout (Screen Lock).

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-AC-000050

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator in PowerShell ISE.
#>

# --- REMEDIATION CODE START ---
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$name = "InactivityTimeoutSecs"
$value = 900  # 15 minutes converted to seconds (900s)

Write-Host "--- Applying STIG Fix: Screen Lock Inactivity Timeout (WN11-AC-000050) ---" -ForegroundColor Cyan

# 1. Ensure the Registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# 2. Set the timeout to 900 seconds
Set-ItemProperty -Path $regPath -Name $name -Value $value -Type DWord

# 3. Refresh Group Policy to apply the change
gpupdate /force

Write-Host "`nSuccess: Screen lock timeout set to 15 minutes (900 seconds)." -ForegroundColor Green
# --- REMEDIATION CODE END ---
