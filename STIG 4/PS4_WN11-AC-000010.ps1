<#
.SYNOPSIS
    This PowerShell script ensures the Account Lockout Duration is set to 15 minutes or greater.

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x
#>

# --- REMEDIATION CODE START ---
Write-Host "--- Applying STIG Fix: Account Lockout Duration ---" -ForegroundColor Cyan

# 1. Set duration and reset window to 15 minutes
net accounts /lockoutduration:15 /lockoutwindow:15

# 2. Refresh Group Policy
gpupdate /force

# 3. Final verification
$check = net accounts | Select-String "Lockout duration"
Write-Host "Success: $check" -ForegroundColor Green
# --- REMEDIATION CODE END ---
