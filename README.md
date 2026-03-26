# 🛡️ DISA STIG Automated Remediation & Compliance Lab
**Author:** Yemisi Daodu  
**Focus:** Windows 11 Security Hardening & Vulnerability Management  

---

## 🎯 Project Objective
This project demonstrates the end-to-end process of assessing, auditing, and remediating Windows 11 configurations against **DISA STIG (Security Technical Implementation Guides)** baselines. Using **Tenable.io**, I identified security gaps in a cloud-hosted Azure environment and developed a library of **10 custom PowerShell automation scripts** to programmatically enforce Department of Defense (DoD) security standards.

---

## 🛠️ Tool Suite
* **Vulnerability Management:** Tenable.io (Nessus Cloud)
* **Compliance Framework:** DISA STIG Windows 11 Benchmarks (V1R2)
* **Automation/Scripting:** PowerShell ISE (Advanced Scripting)
* **Infrastructure:** Microsoft Azure (Windows 11 Pro VMs, NSGs, Azure Bastion)
* **Verification Tools:** `secpol.msc`, `regedit`, and Windows Command Line (`net accounts`)

---

## 🚀 The Remediation Methodology

### 1. Manual Audit & Verification (The "Deep Dive")
Before automating, I performed manual remediations to understand how Windows enforces security at the Kernel and Policy levels.
* **The Process:** Navigating the Registry Hive (`HKLM\SOFTWARE\Policies`) and the Local Security Policy console (`secpol.msc`) to manually toggle bits and observe system behavior.
* **Critical Discovery:** Identified a common configuration pitfall where Tenable scans fail due to exact syntax requirements (e.g., using `Event log` with a space instead of the system-required `EventLog`).
* **Why Manual First?** This phase was critical to confirm that the Windows Event Viewer service and Tenable.io compliance plugins specifically require exact Registry key pathing to acknowledge policy changes.

### 2. Automated PowerShell Remediation (The "Scale")
To eliminate human error and ensure repeatable compliance, I developed 10 professional-grade scripts. These scripts:
* **Verification:** Check if the mandatory Registry path exists before attempting to write.
* **Enforcement:** Set the exact `DWORD` or `String` values required by the DoD.
* **Global Refresh:** Execute `gpupdate /force` to apply changes immediately without waiting for the OS background refresh cycle.
* **Auditability:** Each script is documented with the specific STIG-ID it remediates.

---

## 📊 Technical Control Mapping (The "Top 10")

| Seq | STIG ID | Security Control | Manual Verification Method | File Name | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | `WN11-AU-000500` | Audit Log Max Size (32MB) | Event Viewer -> Log Properties | `PS1_WN11-AU-000500.ps1` | ✅ Passed |
| **02** | `WN11-SO-000075` | DoD Legal Notice Banner | Windows Login Screen | `PS2_WN11-SO-000075.ps1` | ✅ Passed |
| **03** | `WN11-CC-000110` | Disable HTTP Printing | `regedit` (DisableWebPrinting) | `PS3_WN11-CC-000110.ps1` | ✅ Passed |
| **04** | `WN11-AC-000010` | Account Lockout (15m) | `cmd` -> `net accounts` | `PS4_WN11-AC-000010.ps1` | ✅ Passed |
| **05** | `WN11-AC-000040` | Require Password on Wakeup | Power Options Settings | `PS5_WN11-AC-000040.ps1` | ✅ Passed |
| **06** | `WN11-AC-000050` | Inactivity Timeout (900s) | `secpol.msc` (Security Options) | `PS6_WN11-AC-000050.ps1` | ✅ Passed |
| **07** | `WN11-CC-000035` | Disable Autoplay | Registry (NoDriveTypeAutoRun) | `PS7_WN11-CC-000035.ps1` | ✅ Passed |
| **08** | `WN11-GE-000010` | Disable Guest Account | `lusrmgr.msc` (Users) | `PS8_WN11-GE-000010.ps1` | ✅ Passed |
| **09** | `WN11-AC-000015` | Password History (24) | `secpol.msc` (Password Policy) | `PS9_WN11-AC-000015.ps1` | ✅ Passed |
| **10** | `WN11-SO-000010` | Restrict Anonymous SIDs | Registry (RestrictAnonymousSAM) | `PS10_WN11-SO-000010.ps1` | ✅ Passed |

---

## 🧠 Skills Demonstrated
* **Security Engineering:** Translating complex DISA STIG requirements into technical configurations.
* **PowerShell Automation:** Scaling security fixes across an enterprise environment using `.ps1` scripting.
* **Troubleshooting:** Identifying "False Negatives" caused by Registry syntax and character spacing errors.
* **Compliance Auditing:** Mastering Tenable.io template creation and audit file integration.

---

## 📸 Evidence & Results

### Initial Baseline Scan
*Description: Initial Tenable.io scan identifying high-severity non-compliance findings across the Windows 11 environment.*
![Baseline Scan Result] <img width="1366" height="613" alt="image" src="https://github.com/user-attachments/assets/bedb18e9-9762-4810-8fb8-05cdede8d9bd" />

### Successful Remediation Example
*Description: Evidence of PowerShell script execution resulting in the mandatory 32MB Application Log size (33,554,432 Bytes).*
![PowerShell Execution] <img width="1366" height="601" alt="image" src="https://github.com/user-attachments/assets/f699414a-40b2-4074-86d5-c4f62241703a" />

---

## 📂 Project Structure
* `/STIG`: Contains 10 PowerShell remediation scripts (`PS1` through `PS10`).
* `/Reports`: Tenable.io scan results (PDF/CSV).
* `/Screenshots`: Visual evidence of successful compliance runs.

---

## 🔗 Connect with Me
- **LinkedIn:** [Yemisi Daodu](https://www.linkedin.com/in/yemisi-daodu/)
- **GitHub:** [yemisi-cybernate1](https://github.com/yemisi-cybernate1)
