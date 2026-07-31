#below is the commands that can be used 90% in production. Their are more commands too but these are real-life.

#Asterisk CLI Access
asterisk -rvvv
#View SIP Channels / Show all active channels
core show channels
#Detailed channel list
core show channels verbose
#Machine-readable channel list
core show channels concise
#Show active PJSIP channels
pjsip show channels
#Show active SIP (chan_sip) peers
sip show channels
#Show channel details
core show channel <channel-name>
#Show channel variables
core show channel <channel-name> verbose
#Hangup / clear a specific channel
channel request hangup <channel-name>
#Hangup all channels, before this List channel first:
core show channels
#Alternatively, restart Asterisk (drops all calls):
core restart now

#SIP (chan_sip) Commands
sip show peers
sip show registry
sip show subscriptions
sip reload
sip set debug on
sip set debug off
sip set debug peer <peer-name>

#PJSIP Commands
pjsip show endpoints
pjsip show registrations
pjsip show contacts
pjsip show aor <aor-name>
pjsip show transports
pjsip reload
pjsip set logger on
pjsip set logger off

#Call troubleshooting
core show channels
core show channels <channel-name>
dialplan show
dialplan show <context>

#Media / RTP Debugging
rtp show settings
rtp set debug on
rtp set debug off

#System Status
core show version
core show uptime
core show calls
memory show summary
module show

#Emergency Cleanup Commands
core show channels
channel request hangup <channel-name>
#Reload everything
core reload
