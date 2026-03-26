<#
.SYNOPSIS
    This PowerShell script ensures the built-in Guest account is disabled to prevent unauthorized access.

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-GE-000010

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator. 
#>

# --- REMEDIATION CODE START ---
Write-Host "--- Applying STIG Fix: Disabling Guest Account (WN11-GE-000010) ---" -ForegroundColor Cyan

# 1. Use the Disable-LocalUser command to deactivate the Guest account.
# We use -ErrorAction SilentlyContinue in case it is already disabled.
Disable-LocalUser -Name "Guest" -ErrorAction SilentlyContinue

# 2. Double-check the status for the log output
$guestStatus = Get-LocalUser -Name "Guest"
if ($guestStatus.Enabled -eq $false) {
    Write-Host "`nSuccess: The Guest account is officially DISABLED." -ForegroundColor Green
} else {
    Write-Host "`nWarning: The Guest account could not be disabled. Check permissions." -ForegroundColor Red
}
# --- REMEDIATION CODE END ---
