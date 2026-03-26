<#
.SYNOPSIS
    Enforces a password history of 24 to prevent password reuse and improve credential security.

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-AC-000015

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator. 
#>

# --- REMEDIATION CODE START ---
Write-Host "--- Applying STIG Fix: Password History (WN11-AC-000015) ---" -ForegroundColor Cyan

# 1. Use the 'net accounts' command to enforce the history length of 24.
# This is the most direct way to update the local SAM database.
net accounts /uniquepw:24

# 2. Refresh Group Policy to ensure the change is registered by the OS.
gpupdate /force

# 3. Final verification output
$check = net accounts | Select-String "Length of password history maintained"
Write-Host "`nSuccess: $check" -ForegroundColor Green
# --- REMEDIATION CODE END ---
