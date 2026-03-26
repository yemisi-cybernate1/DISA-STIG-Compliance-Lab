<#
.SYNOPSIS
    This PowerShell script prevents anonymous users from enumerating SAM accounts and shares.

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-SO-000010

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator. 
#>

# --- REMEDIATION CODE START ---
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

Write-Host "--- Applying STIG Fix: Restrict Anonymous Enumeration (WN11-SO-000010) ---" -ForegroundColor Cyan

# 1. Restrict Anonymous access to SAM accounts (Security Accounts Manager)
Set-ItemProperty -Path $regPath -Name "RestrictAnonymousSAM" -Value 1 -Type DWord

# 2. Restrict Anonymous access to shares and pipes
Set-ItemProperty -Path $regPath -Name "RestrictAnonymous" -Value 1 -Type DWord

# 3. Refresh Group Policy
gpupdate /force

Write-Host "`nSuccess: Anonymous enumeration of SIDs and SAM accounts has been restricted." -ForegroundColor Green
# --- REMEDIATION CODE END ---
