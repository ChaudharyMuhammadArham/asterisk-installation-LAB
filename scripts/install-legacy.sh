#!/bin/bash

# Asterisk PBX Lab Installation Script
# Tested with Ubuntu / Debian Linux

set -e

SOURCE_DIR="/usr/src"  # to change directory edit this file and add your preferred path

echo "===========This lab is for educational and professional learning purposes only.!.--->>Please note that this bash script is compiled by AI, and AI can make errors.=============="
echo "Updating system packages"
echo "========================================"

sudo apt update
sudo apt upgrade -y

echo "========================================"
echo "Installing build dependencies"
echo "========================================"

sudo apt install -y \
build-essential wget curl git libssl-dev libncurses5-dev \
libnewt-dev libxml2-dev libsqlite3-dev uuid-dev libjansson-dev

echo "========================================"
echo "Asterisk Version Selection"
echo "========================================"
echo
echo "Choose Asterisk version to install:"
echo "  1) Latest version (20.latest) - Recommended"
echo "  2) Specific version (enter manually)"
echo
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        ASTERISK_VERSION="20.latest"
        echo "Selected: Latest version (20.latest)"
        ;;
    2)
        read -p "Enter Asterisk version (e.g., 20.7.2, 21.0.0): " ASTERISK_VERSION
        if [ -z "$ASTERISK_VERSION" ]; then
            echo "Error: Version cannot be empty"
            exit 1
        fi
        echo "Selected: Version $ASTERISK_VERSION"
        ;;
    *)
        echo "Error: Invalid choice. Please enter 1 or 2"
        exit 1
        ;;
esac

echo
echo "========================================"
echo "Moving to source directory"
echo "========================================"

cd $SOURCE_DIR || { echo "Failed to change to $SOURCE_DIR"; exit 1; }

echo "========================================"
echo "Downloading Asterisk source"
echo "========================================"

if [ ! -f "asterisk-${ASTERISK_VERSION}.tar.gz" ]; then
    echo "Downloading asterisk-${ASTERISK_VERSION}.tar.gz..."
    sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VERSION}.tar.gz || \
        { echo "Download failed"; exit 1; }
else
    echo "Archive already exists, skipping download"
fi

echo "========================================"
echo "Extracting Asterisk source"
echo "========================================"

sudo tar -xzf asterisk-${ASTERISK_VERSION}.tar.gz || \
    { echo "Extraction failed"; exit 1; }

echo "========================================"
echo "Entering Asterisk directory and installing"
echo "========================================"

cd asterisk-20.* || { echo "Asterisk directory not found"; exit 1; }

sudo contrib/scripts/install_prereq install || { echo "Prerequisite installation failed"; exit 1; }
./configure || { echo "Configuration failed"; exit 1; }
make -j$(nproc) || { echo "Compilation failed"; exit 1; }
sudo make install || { echo "Installation failed"; exit 1; }
sudo make samples || { echo "Sample installation failed"; exit 1; }
sudo make config || { echo "Service configuration failed"; exit 1; }

echo "========================================"
echo "Installation completed successfully!"
echo "========================================"
echo
echo "Useful verification commands:"
echo "  asterisk -rvvv"
echo "  core show version"
echo "  systemctl status asterisk"
