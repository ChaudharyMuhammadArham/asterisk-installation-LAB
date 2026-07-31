#Troublshooting can vary according to the scenario user are facing, but these are some troubleshooting steps that anyone can face.:

#Like, Endpoints not showing
pjsip show endpoints #was empty because active endpoint definitions were not present.
#(Two main reasons, if you are using sample configurations, then your configurations in .confg, file is commented or you need to add your own sample configurations at the end of the same file).

#Like, sip show peers not working
#(Same as of 'Endpoints not showing', because their is only difference of name in chan_sip and pjsip commands).

#Like, Mute call / No audio / One-way audio
#(The all above can be caused due to any firewall blocking or NAT or due to RTP ports or due to VMware networking).

#A detailed guide of troubleshooting


Troubleshooting: 
Please be noted that 'Pulling / Downloading, Installation or Configuration' of 'Asterisk PBX' is not only the benchmark. Right after the mentioned steps, the real-world of 'opportunities' begin with a plenty of 'troubleshooting real-world scenarios' though attempting the same in 'Practical environment or on VM'.

No sample extensions:

'Sample extensions' or 'End points' were not showing because the provided extension configurations files having in a full detailed yet commented, so not showing initially.

In pjsip, ''pjsip show endpoints'' will shown information about any available 'extensions or end-points'  and in chan_sip, ''sip show peers'' will work the same as mentioned above.

And this issue will get resolved by adding two sample extensions like 100 & 101 with help of ChatGPT, any one want more, can add the similar. But in the very last of the below mentioned '.conf' file. 

nano /etc/asterisk/pjsip.conf

Most of the times, after ''Asterisk installation'' and ''Sample files configurations'', if an optional command was missed, i.e.;

make config
Then, you are unable to start asterisk because your system not known either 'Asterisk' installed or not, because of system service limitations.

System service / Daemon service: are services that will manage to enable software's during the system boot.

And all systemd services will be managed with;

systemctl <usecase> <service_name>
Asterisk will unable to start:

At first after completion of installation of 'Asterisk', this will be easy to check the status of asterisk with any mentioned commands;

asterisk -rvvvvvvvvvvv #for connecting asterisk cli
core show version #inside asterisk cli
core show channels
sip show peers #for available extensions/SIP
pjsip show endpoints #for available extensions/SIP
But just after a single reboot of your system or VM, you are unable to further use the above mentioned or any asterisk command in your shell, because the process of asterisk goes offline, if you were not use the command for making asterisk default configurations;

make config
Now, either we can execute asterisk every time after the system rebooting on ''Fore Ground'' and for the same two consecutive terminal will be required for 'Linux CLI' on in which command for running asterisk will get executed and in the other to opening asterisk CLI;

asterisk -f
And we can avoid the second terminal for executing;

asterisk -rvvvvv
After the above command for running asterisk in ''Fore Ground'' with;

asterisk -fvvvv
Orr, we can add a configurations file in system services from which the asterisk too will boot up during the machine boot;

***If anyone want's to 'start' any service with the server 'boot', one should need to configure that service with the system with reference to their 'system daemon' service so that upon server boot that service got up. Same is for 'Asterisk' too.

Linking command, 'make configuration' during the 'asterisk setup' create a 'system daemon' so once that created whenever server got rebooted or booted, asterisk do the same. Though, that was mentioned as optional in the configurations and if some one missed, one may have to figure out some alternative like,: need to create system daemon service or manually practice the starting of 'asterisk' on server reboot or boot everytime.

For manual using 'Asterisk' with out creating or struggling for system daemon service, one way out is,; to start 'Asterisk' and connect directly to its 'CLI',

#if asterisk wasn't running
asterisk -c
The other way of manually catering 'Asterisk' every time after a 'server reboot or boot', is to create a;

systemd service:

For manually creating a daemon file;

cd /etc/systemd/system
Create a .service file:

nano asterisk.service
Copy service script:

[Unit]
Description=Asterisk PBX and Telephony Daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/sbin/asterisk -f -U asterisk -G asterisk
ExecStop=/usr/sbin/asterisk -rx "core stop now"
Restart=always
RestartSec=5

User=asterisk
Group=asterisk

LimitCORE=infinity
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
Here, in the line ''ExecStart=/usr/sbin/asterisk'', you need to choose the path where your asterisk configurations will be, normally using default settings it will be at the mentioned path, or you need to mention the exact path after locating your installed asterisk.

Asterisk path checking:

which asterisk
Reloading service:

After the completion of asterisk service file, system service needs to be reloaded or system needs to get a reboot;

systemctl daemon-reload
systemctl enable asterisk
systemctl start asterisk
systemctl status asteris
Testing Calls / No Voice / Mute:

While testing your configured test or sample extensions, we may suffer with issues like 'One sided voice' / 'Mute Calls' or 'No Voice' in the call either on 'callee' or 'called' party. This can be caused due to multiple factors contributing for 'voice transformation' but in this 'lab environment', ''Firewall'' can be something that can be contributing for this issue that can be fixed with the following firewall entries;

sudo firewall-cmd --permanent --add-port=5060/udp
sudo firewall-cmd --permanent --add-port=10000-20000/udp
sudo firewall-cmd --reload
