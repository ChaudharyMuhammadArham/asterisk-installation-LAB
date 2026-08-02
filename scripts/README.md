# Installation Scripts

This directory contains the installation scripts used throughout this Asterisk PBX laboratory project. Two installation methods are provided to support different learning objectives and user preferences.

---

## Available Scripts

### install.sh

An interactive installation script designed for educational and professional learning environments.

#### Features

- Interactive menu-driven interface
- Automatic Asterisk installation
- Automatic dependency installation
- Source code download
- Source compilation and installation
- Automatic or manual systemd configuration
- Installation verification
- Step-by-step learning mode
- Educational prompts and guidance

#### Recommended For

- Students learning Asterisk
- Beginners exploring PBX installation
- Users who want an interactive installation experience
- Professional and training environments

---

### install-legacy.sh

A traditional sequential installation script that performs the complete installation process without interactive menus.

#### This Script Performs

- System update
- Dependency installation
- Asterisk source download
- Source extraction
- Asterisk compilation
- Asterisk installation
- Sample configuration installation
- Automatic systemd service creation using `make config`
- Basic installation verification

#### Recommended For

- Users familiar with Linux
- Quick laboratory deployments
- Automated testing environments
- Users who prefer a straightforward installation process

---

## Choosing the Right Script

*install.sh* | Interactive installation with learning guidance and systemd options
*install-legacy.sh* | Fast, direct installation using a traditional sequential workflow

---

## Requirements

Before running either installation script, ensure that:

- You are using a supported Ubuntu or Debian-based Linux distribution.
- You may use you own Linux environment besides above mentioned, if so, then please change commands slightly according to your use.
- The script is executed with **root** or **sudo** privileges.
- An active Internet connection muse be available to download packages and Asterisk source code.

Example:

```bash
sudo chmod +x install.sh
sudo ./install.sh
```

or

```bash
sudo chmod +x install-legacy.sh
sudo ./install-legacy.sh
```

---

## Disclaimer

These scripts are intended for educational and laboratory use. Review and test all configurations before deploying Asterisk in a production environment.
