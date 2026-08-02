#!/bin/bash

# version 0.9...to be continued
# Asterisk PBX Lab Installation Script
# Tested with Asterisk 20 LTS

set -e

ASTERISK_VERSION="20.latest"
SOURCE_DIR="/usr/src"

echo "===========''This LAB is for educational and learning purpose only''==========================="
echo "Updating system packages"
echo "======================================"

sudo apt update
sudo apt upgrade -y


echo "======================================"
echo "Installing build dependencies"
echo "======================================"

sudo apt install -y \
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


echo "======================================"
echo "Moving to source directory"
echo "======================================"

cd $SOURCE_DIR


echo "======================================"
echo "Downloading Asterisk source"
echo "======================================"

sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VERSION}.tar.gz
if [ -f "asterisk-${ASTERISK_VERSION}.tar.gz" ]; then
    echo "Source archive already exists. Skipping download."
else
    sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VERSION}.tar.gz
fi


echo "======================================"
echo "Extracting Asterisk source"
echo "======================================"

sudo tar -xzf asterisk-20.latest.tar.gz


cd asterisk-20.*


echo "======================================"
echo "Installing Asterisk prerequisites"
echo "======================================"

sudo contrib/scripts/install_prereq install


echo "======================================"
echo "Configuring Asterisk"
echo "======================================"

./configure


echo "======================================"
echo "Compiling Asterisk"
echo "======================================"

make -j$(nproc)


echo "======================================"
echo "Installing Asterisk"
echo "======================================"

sudo make install


echo "======================================"
echo "Installing sample configurations"
echo "======================================"

sudo make samples


echo "======================================"
echo "Installing system service"
echo "======================================"

sudo make config


echo "======================================"
echo "Asterisk installation completed"
echo "======================================"

echo
echo "======================================"
echo "Installation completed successfully."
echo "======================================"
echo
echo "Useful verification commands:"
echo
echo "asterisk -rvvv"
echo "core show version"
echo "systemctl status asterisk"
echo
