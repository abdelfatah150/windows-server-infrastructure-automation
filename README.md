<div align="center">

# 🏢 Windows Server Infrastructure Automation

### Infrastructure as Code (IaC) using Vagrant & PowerShell

Automating the deployment and configuration of a complete Windows Server enterprise environment.

![Windows Server](https://img.shields.io/badge/Windows_Server-2022-0078D4?style=for-the-badge&logo=windows)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-5391FE?style=for-the-badge&logo=powershell)
![Vagrant](https://img.shields.io/badge/Vagrant-2.x-1868F2?style=for-the-badge&logo=vagrant)
![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-183A61?style=for-the-badge&logo=virtualbox)
![Status](https://img.shields.io/badge/Status-In%20Progress-success?style=for-the-badge)

</div>

---

# 📖 Overview

This project demonstrates how to deploy an enterprise Windows Server infrastructure using **Infrastructure as Code (IaC)** principles.

Instead of manually configuring servers through graphical interfaces, the entire environment is provisioned and configured using **Vagrant** and **PowerShell automation**.

The infrastructure simulates a real-world enterprise network with centralized identity management, networking services, file services, web hosting, Group Policy management, virtualization, and backup solutions.

---

# 🎯 Objectives

- Automate Windows Server deployment
- Eliminate repetitive manual configuration
- Learn Infrastructure as Code (IaC)
- Practice Enterprise Windows Administration
- Build a reusable deployment environment
- Manage services through PowerShell

---

# 🏗 Infrastructure

```
                   FINAL.LOCAL
                        │
        ┌───────────────┴───────────────┐
        │                               │
      PDC                             ADC
        │                               │
        └───────────────┬───────────────┘
                        │
                     CLIENT
```

---

# 🖥 Virtual Machines

| Machine | Role |
|----------|------|
| PDC | Primary Domain Controller |
| ADC | Additional Domain Controller |
| CLIENT | Domain Joined Client |

---

# 🚀 Features

## Infrastructure

- Multi-machine Vagrant deployment
- Static IP configuration
- Automated provisioning
- PowerShell automation
- Infrastructure as Code

## Active Directory

- Forest Creation
- Domain Controller Promotion
- Additional Domain Controller
- Organizational Units
- Security Groups
- User Automation
- CSV User Import
- Password Policies

## Networking

- DNS Server
- DHCP Server
- DHCP Scope
- DHCP Failover
- DNS Records

## Web Services

- IIS Installation
- Website Deployment

## File Services

- SMB Shares
- NTFS Permissions
- File Screening
- Storage Quotas
- FSRM

## Group Policy

- Remote Desktop
- Remote Assistance
- USB Restrictions
- Control Panel Restrictions
- Task Manager Restrictions
- Drive Mapping

## Virtualization

- Hyper-V
- Core VM Deployment
- Hyper-V Replica

## Backup

- Windows Server Backup
- Scheduled Backup

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| Windows Server 2022 | Operating System |
| Vagrant | Infrastructure Provisioning |
| VirtualBox | Virtualization |
| PowerShell | Automation |
| Active Directory | Identity Management |
| DNS | Name Resolution |
| DHCP | IP Address Management |
| IIS | Web Hosting |
| Hyper-V | Virtualization |
| Group Policy | Centralized Management |
| FSRM | File Server Management |

---

# 📂 Project Structure

```
windows-server-infrastructure-automation/

│

├── infrastructure/
│   ├── Vagrantfile
│   ├── configs/
│   └── scripts/
│
├── powershell/
│   ├── AD/
│   ├── DHCP/
│   ├── DNS/
│   ├── IIS/
│   ├── GPO/
│   ├── HyperV/
│   ├── Backup/
│   └── FileServer/
│
├── csv/
│
├── docs/
│
├── assets/
│
├── README.md
│
└── LICENSE
```

---

# 📌 Deployment Roadmap

- [ ] Deploy Infrastructure
- [ ] Configure Networking
- [ ] Install Windows Features
- [ ] Deploy Active Directory
- [ ] Configure DNS
- [ ] Configure DHCP
- [ ] Deploy IIS
- [ ] Create Organizational Units
- [ ] Import Users
- [ ] Configure Group Policies
- [ ] Configure File Server
- [ ] Configure Hyper-V
- [ ] Configure Backup

---

# ⚡ Getting Started

Clone the repository

```bash
git clone https://github.com/<username>/windows-server-infrastructure-automation.git
```

Navigate to the infrastructure directory

```bash
cd infrastructure
```

Provision the environment

```bash
vagrant up
```

---

# 📚 Skills Demonstrated

- Infrastructure as Code (IaC)
- Windows Server Administration
- Active Directory
- PowerShell Scripting
- Windows Networking
- Virtualization
- Enterprise Automation
- Disaster Recovery
- High Availability

---

# 🚧 Current Status

> 🚀 The project is currently under active development.

Upcoming milestones include:

- PowerShell automation
- Hyper-V automation
- Backup automation
- Complete enterprise deployment

---

# 🤝 Team

Developed collaboratively as part of a Windows Server Infrastructure Automation project.

---

<div align="center">

### ⭐ If you found this project useful, don't forget to star the repository!

</div>
