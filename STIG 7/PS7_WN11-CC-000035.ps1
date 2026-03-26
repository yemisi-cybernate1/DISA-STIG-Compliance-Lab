<#
.SYNOPSIS
    This PowerShell script disables Autoplay for all drives to prevent unauthorized code execution.

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-CC-000035

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator. 
#>

# --- REMEDIATION CODE START ---
# This registry path controls how Explorer handles new media/drives.
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$name = "NoDriveTypeAutoRun"
$value = 255 # The value 255 (0xFF) disables Autoplay on ALL drive types.

Write-Host "--- Applying STIG Fix: Disabling Autoplay (WN11-CC-000035) ---" -ForegroundColor Cyan

# 1. Ensure the Registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# 2. Set NoDriveTypeAutoRun to 255
Set-ItemProperty -Path $regPath -Name $name -Value $value -Type DWord

# 3. Refresh Group Policy
gpupdate /force

Write-Host "`nSuccess: Autoplay has been disabled for all drive types." -ForegroundColor Green
# --- REMEDIATION CODE END ---
