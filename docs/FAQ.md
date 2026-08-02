# Frequently Asked Questions (FAQ)

This document answers common questions that beginners and learners may encounter while installing, configuring, and troubleshooting Asterisk PBX in a laboratory environment.

---

# General Questions

## What is Asterisk?

Asterisk is an open-source Private Branch Exchange (PBX) software that enables voice communication over IP (VoIP). It supports SIP, PJSIP, IAX2, voicemail, IVR, conferencing, queues, call routing, and many other telephony features.

---

## What is PJSIP?

PJSIP is the modern SIP channel driver used by Asterisk. It provides improved flexibility, better security, and active development compared to the legacy chan_sip module.

---

## What is chan_sip?

chan_sip is the legacy SIP channel driver previously used by Asterisk. It has been deprecated in recent Asterisk releases and is no longer recommended for new deployments.

---

## Why does this repository use PJSIP instead of chan_sip?

Asterisk 20 LTS recommends PJSIP for new installations. It is actively maintained and supports modern SIP features.

---

# Installation Questions

## Which operating systems are supported?

This project has been tested on:

- Ubuntu
- Debian

Other Linux distributions may require different package names.

---

## Why is Asterisk installed from source instead of using the package manager?

Installing from source allows learners to understand:

- Dependency installation
- Source compilation
- Build configuration
- Manual installation process
- System integration

It also provides better insight into how Asterisk is built.

---

## What are sample configuration files?

Running:

```bash
make samples
```

installs default configuration files under:

```text
/etc/asterisk/
```

These files provide a starting point for configuring Asterisk.

---

# Configuration Questions

## Where is the PJSIP configuration stored?

```text
/etc/asterisk/pjsip.conf
```

---

## Where is the dialplan configured?

```text
/etc/asterisk/extensions.conf
```

---

## What is an endpoint?

An endpoint represents a SIP device such as:

- Softphone
- IP Phone
- SIP Client

Each endpoint contains authentication, transport, codec, and context information.

---

## What is an AOR?

An Address of Record (AOR) stores contact information for an endpoint.

---

## What is an Auth section?

The authentication section stores the username and password used during SIP registration.

---

## Why do I need a dialplan?

The dialplan defines how Asterisk processes incoming and outgoing calls. It determines where calls should be routed and which applications should be executed.

---

# Troubleshooting Questions

## Why does `pjsip show endpoints` return no endpoints?

Common causes include:

- Incorrect syntax in `pjsip.conf`
- Configuration not reloaded
- Endpoint definitions missing
- Incorrect context assignment

Verify the configuration and reload Asterisk.

---

## Why does `sip show peers` not work?

Because this laboratory uses PJSIP.

Instead, use:

```bash
pjsip show endpoints
```

---

## Why are my endpoints not registering?

Possible reasons include:

- Incorrect username or password
- Incorrect transport configuration
- Firewall restrictions
- Invalid SIP client configuration
- Network connectivity issues

---

## Why is there no audio during a call?

Possible causes include:

- Firewall blocking RTP
- NAT configuration
- Codec mismatch
- RTP port restrictions

Open the required ports:

```bash
5060/UDP
10000-20000/UDP
```

---

## Why do I hear one-way audio?

One-way audio is commonly caused by:

- NAT issues
- Firewall configuration
- Incorrect RTP settings
- Incorrect network routing

---

## Why does Asterisk fail to start?

Check:

```bash
systemctl status asterisk
```

Then review:

```bash
journalctl -xe
```

and

```bash
asterisk -rvvv
```

for additional details.

---

# Systemd Questions

## Why create a manual systemd service?

Creating a service manually helps learners understand:

- Linux service management
- systemd unit files
- Startup configuration
- Service lifecycle

---

## What does `make config` do?

The command:

```bash
make config
```

creates a default systemd service (or init script depending on the operating system), allowing Asterisk to start automatically during system boot.

---

# Laboratory Questions

## Why was VMware used?

VMware provides an isolated environment for safely installing, configuring, and testing Asterisk without affecting the host operating system.

---

## Can this repository be used in production?

No.

This repository is intended for:

- Learning
- Laboratory practice
- Educational purposes
- Understanding Asterisk installation and configuration

Production deployments require additional security, redundancy, monitoring, and hardening.

---

# Repository Questions

## Why are there two installation scripts?

Two installation approaches are provided:

### install.sh

An interactive installer designed for learning and guided installation.

### install-legacy.sh

A traditional sequential installer for users who prefer a direct installation process.

---

## Can I modify these configurations?

Yes.

The sample configurations are intended as a starting point. You are encouraged to adapt them to suit your own laboratory or learning environment.

---

# Learning Questions

## I am new to Asterisk. Where should I start?

A recommended learning path is:

1. Install Linux.
2. Install Asterisk from source.
3. Understand the compilation process.
4. Configure PJSIP endpoints.
5. Create a simple dialplan.
6. Verify endpoint registration.
7. Learn Asterisk CLI commands.
8. Understand inbound and outbound call flow.
9. Practice troubleshooting.

---

## What should I learn after completing this laboratory?

Recommended next topics include:

- SIP Trunks
- IAX2
- Voicemail
- IVR
- Queues
- Conference Bridges
- Codec configuration
- NAT configuration
- Security hardening
- RTP troubleshooting
