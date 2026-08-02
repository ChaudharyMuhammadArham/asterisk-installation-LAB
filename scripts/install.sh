#!/bin/bash

set -e

###############################################################################
# Project : Asterisk Installation LAB
#
# Author  : Chaudhary Muhammad Arham
# Role    : System Support Engineer - II
#
# Purpose :
# Interactive Asterisk PBX installer for educational and professional lab environments.
#
# Features:
# 1. Automatic Installation
# 2. Manual systemd Learning Mode
# 3. Step-by-Step Learning Mode
#
# Supported:
# Ubuntu / Debian based systems
#
# Note:
# This script was developed with AI assistance and manually reviewed.
# Always test in lab environment before production, because AI make mistakes.
###############################################################################


#############################
# Variables
#############################

ASTERISK_VERSION="20.latest"
SOURCE_DIR="/usr/src"

ASTERISK_TARBALL="asterisk-${ASTERISK_VERSION}.tar.gz"


#############################
# Colors
#############################

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\033[0m"



#############################
# Root Check
#############################

check_root(){

if [ "$EUID" -ne 0 ]; then

echo -e "${RED}"
echo "Please run this script as root or using sudo."
echo -e "${NC}"

exit 1

fi

}



#############################
# Header
#############################

show_header(){

clear

echo -e "${CYAN}"

echo "================================================="
echo "          ASTERISK PBX LAB INSTALLER"
echo "================================================="

echo "The original content was shared with AI and This lab was created with help of AI and AI can make errors. You can read 'READ.md' or use simple installation by choosing install legacy version."
echo "Author  : Chaudhary Muhammad Arham | System Support Engineer -II"

echo "================================================="

echo -e "${NC}"

}



#############################
# Pause
#############################

pause(){

echo

read -p "Press ENTER to continue..."

}



#############################
# System Update
#############################

update_system(){

echo -e "${YELLOW}"
echo "Updating system packages..."
echo -e "${NC}"


apt update

apt upgrade -y


}



#############################
# Dependencies
#############################

install_dependencies(){

echo -e "${YELLOW}"
echo "Installing Asterisk build dependencies..."
echo -e "${NC}"


apt install -y \
build-essential \
wget \
curl \
git \
libssl-dev \
libncurses5-dev \
libnewt-dev \
libxml2-dev \
libsqlite3-dev \
uuid-dev \
libjansson-dev


}



#############################
# Download Asterisk
#############################

download_asterisk(){

echo -e "${YELLOW}"
echo "Downloading Asterisk source..."
echo -e "${NC}"


cd $SOURCE_DIR


if [ -f "$ASTERISK_TARBALL" ]

then

echo "Asterisk source already downloaded."

else

wget http://downloads.asterisk.org/pub/telephony/asterisk/$ASTERISK_TARBALL

fi


}



#############################
# Compile Asterisk
#############################

compile_asterisk(){

echo -e "${YELLOW}"
echo "Extracting Asterisk source..."
echo -e "${NC}"


cd $SOURCE_DIR


tar -xzf $ASTERISK_TARBALL


cd asterisk-20.*



echo "Installing prerequisites"

contrib/scripts/install_prereq install



echo "Configuring Asterisk"

./configure



echo "Compiling Asterisk"

make -j$(nproc)



echo "Installing Asterisk"

make install



echo "Installing sample configuration"

make samples



}





#############################
# Automatic Systemd
#############################

automatic_systemd(){

echo -e "${YELLOW}"
echo "Creating Asterisk systemd service using make config..."
echo -e "${NC}"


cd $SOURCE_DIR/asterisk-20.*


make config


systemctl daemon-reload


echo "Systemd service created."



}



#############################
# Manual Systemd
#############################

create_manual_systemd(){


echo -e "${YELLOW}"
echo "Creating manual Asterisk systemd service..."
echo -e "${NC}"


cat > /etc/systemd/system/asterisk.service <<EOF

[Unit]
Description=Asterisk PBX
After=network.target


[Service]

Type=simple

User=root
Group=root

ExecStart=/usr/sbin/asterisk -f -U root -g

Restart=on-failure

RestartSec=5


[Install]

WantedBy=multi-user.target

EOF



systemctl daemon-reload


systemctl enable asterisk


echo

echo "Manual systemd service created successfully."


echo

echo "Useful commands:"
echo "systemctl start asterisk"
echo "systemctl status asterisk"
echo "systemctl stop asterisk"


}



#############################
# Systemd Menu
#############################

systemd_menu(){


echo

echo "================================"
echo " Systemd Configuration Options"
echo "================================"

echo

echo "1) Automatic systemd (make config)"

echo "2) Manual systemd creation"

echo "3) Skip"

echo


read -p "Choose option: " systemd_choice



case $systemd_choice in


1)

automatic_systemd

;;


2)

create_manual_systemd

;;


3)

echo "Skipping systemd configuration."

;;


*)

echo "Invalid option."

;;


esac



}




#############################
# Verification
#############################

verification(){


echo

echo -e "${GREEN}"
echo "Asterisk installation completed."
echo -e "${NC}"


echo

echo "Verification commands:"
echo

echo "1. Check Asterisk version:"
echo "asterisk -V"

echo

echo "2. Enter Asterisk CLI:"
echo "asterisk -rvvv"

echo

echo "3. Check service:"
echo "systemctl status asterisk"



}




#############################
# Automatic Installation Mode
#############################

automatic_installation(){


echo

echo "Starting automatic installation..."


update_system


install_dependencies


download_asterisk


compile_asterisk


systemd_menu


verification


pause


main_menu


}





#############################
# Manual Learning Mode
#############################

manual_installation(){


clear


echo "======================================="
echo " Manual systemd Learning Mode"
echo "======================================="

echo

echo "This mode installs Asterisk but allows"
echo "you to understand systemd creation manually."

echo

echo "Installation flow:"
echo

echo "1. Update Linux system"

echo "2. Install dependencies"

echo "3. Download Asterisk source"

echo "4. Compile Asterisk"

echo "5. Install Asterisk"

echo "6. Create systemd service manually"

echo


read -p "Press ENTER to start installation..."



update_system


install_dependencies


download_asterisk


compile_asterisk



echo

echo "Now choose systemd method."

systemd_menu



verification



pause


main_menu


}





#############################
# Learning Mode
#############################

learning_mode(){


clear


echo "======================================="
echo " Asterisk Installation Learning Path"
echo "======================================="

echo


echo "Step 1:"
echo "Update Linux packages like with commands apt update && apt upgrade"


echo

echo "Step 2:"
echo "Install compiler and development libraries with the help of wget (a complete command available in the install file of this repo)."


echo

echo "Step 3:"
echo "Download Asterisk source code. You may download asterisk from any official source, an offical downloading link with version 20.latest is available in install file of this repo."


echo

echo "Step 4:"
echo "Extract source files. with the help of tar or any tool you may prefer. One main step, normally extraction is recommended in /usr/src folder but you may choose your own."


echo

echo "Step 5:"
echo "Install Asterisk prerequisites. After getting in asterisk folder and moving to contrib/scripts/install_prereq and running install here all pre-requisites will be installed."


echo

echo "Step 6:"
echo "Run ./configure"


echo

echo "Step 7:"
echo "Compile using make, 'make' it self is a command in asterisk setup for compiling the configurations."


echo

echo "Step 8:"
echo "Install using make install, here too, 'make install' is a complete command for the installation of asterisk."


echo

echo "Step 9:"
echo "Install sample configurations. If any one want to test sample calling using sample extentions, running, 'make sample' is necessary (a detailed guide is also available)."


echo

echo "Step 10:"
echo "Configure PJSIP endpoints, an amendments in 'pjsip.conf' file will be required or you may add extensions according to your use."


echo

echo "Step 11:"
echo "Configure dialplan, its amendment depends how you dealt with 'pjsip.conf', details available in troubleshooting guide of this repo."


echo

echo "Step 12:"
echo "Test inbound/outbound calls, normally in ideal scenerios call will work but some times not, main causes explained in troubleshooting guide of this repo."


echo

echo "Common troubleshooting areas:"

echo "- Endpoint registration"

echo "- Dialplan matching"

echo "- Firewall rules"

echo "- NAT settings"

echo "- For commands and complete steps, you are requested to please refer to my linkedin 'www.linkedin.com/in/chaudhary-muhammad-arham-619825212' where a detailed article is available for the same purposes or you may refer to the install folder of this repo for further details."


echo

pause


main_menu


}




#############################
# Main Menu
#############################

main_menu(){


show_header


echo "Select an option:"

echo

echo "1) Automatic Asterisk Installation"

echo "2) Manual systemd Learning Mode"

echo "3) Learn Installation Steps"

echo "4) Exit"


echo


read -p "Enter choice (1-4): " choice



case $choice in


1)

automatic_installation

;;


2)

manual_installation

;;


3)

learning_mode

;;


4)

echo

echo "Exiting Asterisk PBX Lab Installer. The original content was shared with AI and This lab was created with help of AI and AI can make errors. You can read 'READ.md' or use simple installation by choosing install legacy version."

exit 0

;;


*)

echo

echo "Invalid option."

sleep 2

main_menu

;;


esac



}



#############################
# Script Start
#############################

check_root

main_menu
