#Troublshooting can vary according to the scenario user are facing, but these are some troubleshooting steps that anyone can face.:

#Like, Endpoints not showing
pjsip show endpoints #was empty because active endpoint definitions were not present.
#(Two main reasons, if you are using sample configurations, then your configurations in .confg, file is commented or you need to add your own sample configurations at the end of the same file).

#Like, sip show peers not working
#(Same as of 'Endpoints not showing', because their is only difference of name in chan_sip and pjsip commands).

#Like, Mute call / No audio / One-way audio
#(The all above can be caused due to any firewall blocking or NAT or due to RTP ports or due to VMware networking).
