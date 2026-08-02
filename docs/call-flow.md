# Call Flow

This document provides a high-level overview of how inbound and outbound calls are processed in an Asterisk PBX environment. Understanding the call flow helps in configuring dialplans, troubleshooting call routing issues, and identifying where a call may fail.

---

# Basic Call Flow

An Asterisk PBX acts as the central call-processing engine between endpoints, SIP gateways, SIP trunks, and other VoIP devices.

The basic call flow consists of the following stages:

1. Call Initiation
2. SIP Signaling
3. Dialplan Processing
4. Call Routing
5. RTP (Voice Media) Establishment
6. Call Termination

---

# Outbound Call Flow

An outbound call is initiated by an internal extension or endpoint and routed to another extension or an external destination through a SIP gateway or SIP trunk.

```
Softphone / IP Phone
        │
        ▼
PJSIP Endpoint
        │
        ▼
Asterisk PBX
        │
        ▼
Dialplan (extensions.conf)
        │
        ▼
SIP Gateway / SIP Trunk
        │
        ▼
Destination Number
```

## Outbound Call Process

### Step 1 – Call Initiation

A user dials a destination number using a registered SIP endpoint (for example, extension **100**).

### Step 2 – SIP Registration

The endpoint sends a SIP **INVITE** request to the Asterisk server.

Asterisk verifies:

- Endpoint registration
- Authentication
- Transport configuration
- Context assignment

### Step 3 – Dialplan Matching

The received number is matched against the configured dialplan inside **extensions.conf**.

The dialplan determines how the call should be processed.

Example:

```text
Extension 100
        │
        ▼
Context: local
        │
        ▼
Dial(PJSIP/101)
```

### Step 4 – Call Routing

Depending on the dialplan configuration, Asterisk routes the call to:

- Another local extension
- SIP Gateway
- SIP Trunk
- IVR
- Queue
- Voicemail
- Conference

### Step 5 – RTP Session

After successful SIP signaling, RTP (Real-time Transport Protocol) carries the voice traffic between the communicating parties.

### Step 6 – Call Completion

When either party disconnects, Asterisk processes the **Hangup()** application and releases all allocated resources.

---

# Inbound Call Flow

An inbound call originates from an external source, such as a SIP gateway, SIP trunk, or service provider, and is delivered to the Asterisk PBX.

```
External Caller
        │
        ▼
SIP Gateway / SIP Trunk
        │
        ▼
Asterisk PBX
        │
        ▼
Dialplan (extensions.conf)
        │
        ▼
PJSIP Endpoint
        │
        ▼
Extension 100 / 101
```

## Inbound Call Process

### Step 1 – Incoming SIP Request

A SIP gateway or provider sends an incoming SIP **INVITE** request to Asterisk.

### Step 2 – SIP Authentication

If required, Asterisk validates:

- SIP credentials
- Transport
- IP permissions
- Endpoint configuration

### Step 3 – Dialplan Execution

The incoming call enters the configured dialplan context.

The dialplan determines how the call should be handled.

Examples include:

- Ring an extension
- Play an IVR
- Route to a queue
- Forward to voicemail
- Route to another destination

### Step 4 – Call Routing

Asterisk forwards the call according to the dialplan configuration.

For example:

```
Incoming Call
        │
        ▼
Context: local
        │
        ▼
Dial(PJSIP/100)
```

### Step 5 – RTP Session

Once the called endpoint answers, RTP streams are established between both parties for voice communication.

### Step 6 – Call Termination

When the call ends, Asterisk executes the configured hangup logic and closes the SIP and RTP sessions.

---

# SIP Signaling vs RTP

Understanding the difference between SIP and RTP is essential.

| SIP | RTP |
|-----|-----|
| Call setup and signaling | Voice media transmission |
| Uses messages such as INVITE, ACK, BYE | Carries audio packets |
| Typically uses UDP/TCP port 5060 | Typically uses UDP ports 10000–20000 |

---

# Common Call Routing Components

Asterisk may route calls through different components depending on the dialplan.

- PJSIP Endpoints
- SIP Gateway
- SIP Trunks
- Dialplan
- IVR
- Queues
- Voicemail
- Conference Bridges

---

# Common Troubleshooting Points

If a call does not complete successfully, verify the following:

- Endpoint registration status (`pjsip show endpoints`)
- Dialplan configuration (`dialplan show`)
- SIP signaling messages
- Endpoint authentication
- Codec compatibility
- Firewall configuration
- RTP port availability
- NAT configuration
- Network connectivity

---

# Useful CLI Commands

```bash
asterisk -rvvv

pjsip show endpoints

pjsip show contacts

dialplan show

core show channels

core show channel

core show applications Dial
```

---

# Summary

An Asterisk call is processed by receiving SIP signaling, matching the appropriate dialplan, routing the call to its destination, establishing RTP media for voice communication, and terminating the session when the call ends. Understanding this flow makes troubleshooting significantly easier and provides a strong foundation for configuring more advanced Asterisk features.
