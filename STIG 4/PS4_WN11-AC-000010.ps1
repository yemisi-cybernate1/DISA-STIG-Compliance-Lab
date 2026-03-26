<#
.SYNOPSIS
    PS4: Remediates DISA STIG WN11-AC-000010 (Account Lockout Duration).
    
.DESCRIPTION
    Ensures that an account remains locked for a minimum of 15 minutes
    to prevent automated rapid-fire brute-force attacks.

.NOTES
    Author       : Yemisi Daodu
    Lab Step     : PS4 of 10
    STIG-ID      : WN11-AC-000010
    Date         : 2026-03-26
#>

Write-Host "--- Executing PS4: Setting Lockout Duration (WN11-AC-000010) ---" -ForegroundColor Cyan

# 1. Apply the fix using the 'net accounts' command
# /lockoutduration:15 sets the time the account stays locked.
# /lockoutwindow:15 sets the time before the fail counter resets.
net accounts /lockoutduration:15 /lockoutwindow:15

# 2. Force Policy Update
gpupdate /force

# 3. Verification Output (This confirms the change in the console)
Write-Host "`n[VERIFICATION] Current Account Policy Settings:" -ForegroundColor Yellow
net accounts | Select-String "Lockout duration"

Write-Host "`n[SUCCESS] PS4 Applied. Account Lockout Duration is now 15 minutes." -ForegroundColor Green
