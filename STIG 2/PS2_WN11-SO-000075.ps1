<#
.SYNOPSIS
    Remediates DISA STIG WN11-SO-000075 by enforcing a Legal Notice at logon.
    
.DESCRIPTION
    This script programmatically sets the required 'legalnoticecaption' and 
    'legalnoticetext' registry keys to ensure DoD compliance.

.NOTES
    Author       : Yemisi Daodu
    STIG-ID      : WN11-SO-000075
    Date         : 2026-03-25
#>

Write-Host "--- Initiating STIG Remediation: WN11-SO-000075 (Legal Notice) ---" -ForegroundColor Cyan

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$caption = "US Department of Defense Warning Statement"
$text    = "You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By using this IS, you consent to the following: The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations."

# 1. Enforce Legal Notice Caption
Set-ItemProperty -Path $regPath -Name "legalnoticecaption" -Value $caption -Force

# 2. Enforce Legal Notice Text Body
Set-ItemProperty -Path $regPath -Name "legalnoticetext" -Value $text -Force

# 3. Force Policy Refresh
gpupdate /force

Write-Host "`n[SUCCESS] Registry updated. System restart required to initialize Logon UI changes." -ForegroundColor Green
