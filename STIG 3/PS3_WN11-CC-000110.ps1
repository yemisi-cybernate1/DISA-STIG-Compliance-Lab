<#
.SYNOPSIS
    This PowerShell script disables HTTP Printing (Internet Printing Protocol) to reduce the attack surface.

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-26
    Last Modified   : 2026-03-26
    Version         : 1.0
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator. 
#>

# --- REMEDIATION CODE START ---
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$name = "DisableWebPrinting"
$value = 1

Write-Host "--- Applying STIG Fix: Disable HTTP Printing ---" -ForegroundColor Cyan

# 1. Ensure the correct path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# 2. Set 'DisableWebPrinting' to 1 (Enabled/True)
Set-ItemProperty -Path $regPath -Name $name -Value $value -Type DWord

# 3. Refresh Group Policy
gpupdate /force

Write-Host "`nSuccess: HTTP Printing has been disabled." -ForegroundColor Green
# --- REMEDIATION CODE END ---
