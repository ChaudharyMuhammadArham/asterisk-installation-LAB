# Asterisk Installation LAB

A hands-on Asterisk PBX laboratory project demonstrating the complete installation process from source on Ubuntu/Debian Linux. This repository covers dependency installation, source compilation, PJSIP endpoint configuration, dialplan creation, systemd service configuration, verification, troubleshooting, and supporting documentation for students and professionals learning Asterisk.

---

## Project Objectives

This lab was created to provide practical experience with:

- Installing Asterisk PBX from source
- Understanding the Asterisk build and compilation process
- Configuring PJSIP endpoints
- Creating a basic dialplan
- Managing Asterisk using systemd
- Using common Asterisk CLI commands
- Troubleshooting common installation and configuration issues
- Documenting a repeatable Asterisk lab environment

---

## Features

- Install Asterisk 20 LTS from source
- Install required build dependencies
- Compile and install Asterisk
- Configure sample PJSIP endpoints
- Configure a basic dialplan
- Configure automatic or manual systemd service
- Interactive installation script
- Verification and validation commands
- Troubleshooting guide
- Common Asterisk CLI commands
- Sample configuration files
- Installation screenshots

---

## Tested Environment

Operating System | Ubuntu / Debian | Virtualization | VMware Workstation | PBX Version, Asterisk 20 LTS | SIP Stack, PJSIP

---

## Repository Structure

asterisk-installation-LAB
│
├── README.md
├── LICENSE
│
├── install/
│   ├── dependencies.md
│   ├── compile-from-source.md
│   ├── systemd-service.md
│   └── verification.md
│
├── configs/
│   ├── pjsip.conf
│   └── extensions.conf
│
├── docs/
│   ├── cli-commands.md
│   ├── troubleshooting.md
│   ├── chan-sip-vs-pjsip.md
│   ├── call-flow.md
│   └── faq.md
│
├── scripts/
│   ├── install.sh
    |__ install-legacy.sh
│   └── README.md
│
└── screenshots


## Skills Demonstrated

This project demonstrates practical experience with:

- Linux system administration
- Basic Bash scripting
- Asterisk PBX installation
- Basic PJSIP configuration
- Basic Dialplan configuration
- Source compilation
- systemd service management
- VoIP fundamentals
- Technical documentation
- GitHub project organization

---

## Point to be foucused:

This repository is intended for educational and professional learning purposes. As mentioned content was provided though AI helps in bash scripting and configuring more or less. So, please, always validate configurations and security requirements before using them in a production environment.

---

## Author

**Chaudhary Muhammad Arham** | System Support Engineer – II
