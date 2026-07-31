## install/systemd-service.md
#Add:
# Asterisk Systemd Service
#Check status:
systemctl status asterisk
systemctl start asterisk
systemctl enable asterisk
#if nothing shows with above commands; create your systemd file;
#Also add your custom:
nano /etc/systemd/system/asterisk.service
[Unit]
Description=Asterisk PBX
After=network.target

[Service]
Type=simple
User=root
Group=root
ExecStart=/usr/sbin/asterisk -f -U root -g
Restart=on-failure

[Install]
WantedBy=multi-user.target
