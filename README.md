# DISA STIG Compliance & Automated Remediation Lab

## 🎯 Objective
This project demonstrates the end-to-end process of assessing, auditing, and remediating Windows system configurations against **DISA STIG (Security Technical Implementation Guides)** baselines. Using **Tenable.io**, I identified security gaps in a cloud-hosted environment and developed **custom PowerShell automation** to programmatically enforce Department of Defense (DoD) security standards.

---

## 🛠️ Tool Suite
* **Vulnerability Management:** Tenable.io (Nessus Cloud)
* **Compliance Framework:** DISA STIG Windows 11 Benchmarks
* **Automation/Scripting:** PowerShell ISE (Professional Remediation)
* **Infrastructure:** Microsoft Azure (VMs, NSGs, Azure Bastion)
* **Remote Management:** RDP & Windows Remote Management (WinRM)

---

## 🚀 Technical Workflow

### 1. Environment Provisioning & Hardening
* Deployed isolated Windows and Linux instances within an Azure Virtual Network.
* Configured **Network Security Groups (NSGs)** to enforce the Principle of Least Privilege.
* Implemented **Azure Bastion** for secure administrative access, eliminating exposure to the public internet.

### 2. Custom Compliance Scan Template (Tenable.io)
* **Template Creation:** Built a custom compliance scan template in Tenable.io tailored for STIG audits.
* **Audit Selection:** Integrated official DISA STIG Audit Files to benchmark system security.
* **Baseline Assessment:** Executed initial scans to identify "High" and "Medium" severity non-compliance findings (e.g., Audit Log sizes, Account Lockout policies).

### 3. Remediation Strategy: Manual to Automated
* **Manual Validation:** Initially performed manual Registry edits to verify STIG compliance requirements. During this phase, I identified a critical configuration pitfall where a syntax error (using `Event log` with a space instead of the required `EventLog`) caused remediation failure in the scan.
* **Root Cause Analysis:** Confirmed that the Windows Event Viewer service and Tenable.io compliance plugins specifically require exact Registry key pathing (`...\EventLog\Application`) to acknowledge policy changes.
* **PowerShell Automation:** Developed professional remediation scripts in **PowerShell ISE** to eliminate human error. These scripts programmatically build the correct Registry hierarchy, set mandatory DWORD values, and force a system-wide policy refresh.
* **Version Control:** Managed all remediation scripts via GitHub for auditability and peer review.

### 4. Validation & Reporting
* Performed "Post-Remediation" scans to verify a **100% Pass Rate** for targeted controls.
* Documented the transition from "Failed" to "Passed" status as evidence for security audits.

---

## 🧠 Skills Demonstrated
* **Security Engineering:** Translating complex DISA STIG requirements into technical configurations.
* **PowerShell Automation:** Scaling security fixes across an enterprise environment using `.ps1` scripting.
* **Troubleshooting:** Identifying "False Negatives" caused by Registry syntax and character spacing errors.
* **Compliance Auditing:** Mastering Tenable.io template creation and audit file integration.
* **Technical Documentation:** Maintaining clean, commented code and detailed lab reports.

---

## 📂 Project Structure
* `/STIG`: Contains PowerShell remediation scripts (e.g., `WN11-AU-000500_Remediation.ps1`).
* `/Reports`: Tenable.io scan results (PDF/CSV).
* `/Screenshots`: Visual evidence of scan configurations and successful compliance runs.

---

## 📸 Evidence & Results

### STIG Scan Template Configuration
*Description: Custom Tenable.io template configured with Windows 11 STIG Audit files.*
![STIG Scan Template] <img width="1366" height="613" alt="image" src="https://github.com/user-attachments/assets/bedb18e9-9762-4810-8fb8-05cdede8d9bd" />


### Successful Remediation (Example: WN11-AU-000500)
*Description: Evidence of PowerShell script execution resulting in the mandatory 32MB Application Log size (33,554,432 Bytes).*
![PowerShell Execution](screenshots/powershell-ise-result.png)

---

## 🔗 Connect with Me
- **LinkedIn:** [Yemisi Daodu](https://www.linkedin.com/in/yemisi-daodu/)
- **GitHub:** [yemisi-cybernate1](https://github.com/yemisi-cybernate1)
