# DISA STIG Compliance & Automated Remediation Lab

## 🎯 Objective
This project demonstrates the end-to-end process of assessing, auditing, and remediating Windows system configurations against **DISA STIG (Security Technical Implementation Guides)** baselines. Using **Tenable.io**, I identified security gaps in a cloud-hosted environment and developed **custom PowerShell automation** to programmatically enforce Department of Defense (DoD) security standards.

---

## 🛠️ Tool Suite
* **Vulnerability Management:** Tenable.io (Nessus Cloud)
* **Compliance Framework:** DISA STIG Windows 11 Benchmarks
* **Automation/Scripting:** PowerShell ISE (Professional Remediation)
* **Infrastructure:** Microsoft Azure (VMs, NSGs, Azure Bastion)
* **Remote Management:** RDP & Windows Remote Management

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

### 3. Automated Remediation (The "Engineering" Phase)
* **Root Cause Analysis:** Identified configuration drift and "False Negatives" caused by manual Registry naming errors (e.g., `Event log` vs. `EventLog`).
* **Script Development:** Authored professional PowerShell remediation scripts in **PowerShell ISE** to:
    * Programmatically create and verify Registry hives.
    * Enforce exact DWORD values for STIG requirements (e.g., Application Log size = 32768 KB).
    * Force System Policy refreshes (`gpupdate /force`) and EventLog service restarts.
* **Version Control:** Managed all remediation scripts via GitHub for auditability and peer review.

### 4. Validation & Reporting
* Performed "Post-Remediation" scans to verify a **100% Pass Rate** for targeted controls.
* Documented the transition from "Failed" to "Passed" status as evidence for security audits.

---

## 🧠 Skills Demonstrated
* **Security Engineering:** Translating complex DISA STIG requirements into technical configurations.
* **PowerShell Automation:** Scaling security fixes across an enterprise environment using `.ps1` scripting.
* **Compliance Auditing:** Mastering Tenable.io template creation and audit file integration.
* **Cloud Infrastructure:** Managing Virtual Machines, Network Security Groups, and secure entry points.
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
![STIG Scan Template](screenshots/stig-scan-template.png)

### Successful Remediation (Example: WN11-AU-000500)
*Description: Evidence of PowerShell script execution resulting in the mandatory 32MB Application Log size (33,554,432 Bytes).*
![PowerShell Execution](screenshots/powershell-ise-result.png)

---

## 🔗 Connect with Me
- **LinkedIn:** [Yemisi Daodu](https://www.linkedin.com/in/yemisi-daodu/)
- **GitHub:** [yemisi-cybernate1](https://github.com/yemisi-cybernate1)
