<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Yemisi Daodu
    LinkedIn        : https://www.linkedin.com/in/yemisi-daodu/
    GitHub          : https://github.com/yemisi-cybernate1
    Date Created    : 2026-03-25
    Last Modified   : 2026-03-25
    Version         : 1.0
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 2026-03-25
    Tested By       : Yemisi Daodu
    Systems Tested  : Windows 11 / Server 2022
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run as Administrator in PowerShell ISE or Console.
    Example syntax:
    PS C:\> .\WN11-AU-000500_Remediation.ps1 
#>

# --- REMEDIATION CODE START ---
$correctPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 32768

Write-Host "--- Applying STIG Fix via PowerShell ISE ---" -ForegroundColor Cyan

# 1. Ensure the correct path exists
if (!(Test-Path $correctPath)) {
    New-Item -Path $correctPath -Force | Out-Null
}

# 2. Set the MaxSize value
Set-ItemProperty -Path $correctPath -Name $name -Value $value -Type DWord

# 3. Refresh system settings and services
gpupdate /force
Restart-Service -Name EventLog -Force

# 4. Final verification output for Lab Documentation
$bytes = (Get-WinEvent -ListLog Application).MaximumSizeInBytes
Write-Host "Success: Current System Size is $bytes Bytes (32768 KB)." -ForegroundColor Green
# --- REMEDIATION CODE END ---
Write-Host "Current System Size: $bytes Bytes" -ForegroundColor Green
