<#
.SYNOPSIS
    PS3: Remediates DISA STIG WN11-CC-000110 (Disable HTTP Printing).
    
.DESCRIPTION
    This script disables the Internet Printing Client by modifying the 
    relevant Policy Registry key. This reduces the network attack surface.

.NOTES
    Author       : Yemisi Daodu
    Lab Step     : PS3 of 10
    STIG-ID      : WN11-CC-000110
    Date         : 2026-03-26
#>

Write-Host "--- Executing PS3: Disabling HTTP Printing (WN11-CC-000110) ---" -ForegroundColor Cyan

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# 1. Create the Registry Path if it does not exist (Policies are often missing by default)
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "[INFO] Created missing Policy path: $regPath" -ForegroundColor Gray
}

# 2. Set 'DisableWebPrinting' to 1 (True/Enabled)
# Note: Setting this to 1 tells Windows to "Enable the Disable" rule.
Set-ItemProperty -Path $regPath -Name "DisableWebPrinting" -Value 1 -Type DWord -Force

# 3. Refresh Group Policy to apply the change immediately
gpupdate /force

Write-Host "`n[SUCCESS] PS3 Applied. HTTP Printing is now disabled." -ForegroundColor Green
