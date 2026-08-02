#!/bin/bash

set -e  # Exit immediately if any command fails

###############################################################################
# Project : Asterisk Installation LAB
#
# Author  : Chaudhary Muhammad Arham | System Support Engineer - II
#
# Purpose : Interactive Asterisk PBX installer for educational and 
#           professional lab environments.
#
# Note    : This bash script is compiled by AI. And AI can make errors.
#
# Features
# --------
# 1. Automatic Installation
# 2. Manual systemd Learning
# 3. Learn Installation Steps
#
# Supported OS
# ------------
# Ubuntu / Debian
###############################################################################

# ---------- Colors ----------
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
NC="\033[0m"

# ---------- Header ----------
show_header() {
    clear
    echo -e "${CYAN}"
    echo "=============================================================="
    echo " ASTERISK PBX LAB INSTALLER"
    echo "=============================================================="
    echo "For educational or professional lab environment"
    echo "Author : Chaudhary Muhammad Arham | System Support Engineer - II"
    echo "=============================================================="
    echo -e "${NC}"
}

# ---------- Placeholder Functions ----------
automatic_installation() {
    echo -e "${GREEN}"
    echo "Automatic installation selected."
    echo -e "${NC}"
    echo
    echo "This feature will be added in Version 1.1."
    echo
    pause
    main_menu
}

manual_installation() {
    echo -e "${GREEN}"
    echo "Manual systemd learning selected."
    echo -e "${NC}"
    echo
    echo "This feature will be added in Version 1.2."
    echo
    pause
    main_menu
}

learning_mode() {
    echo -e "${GREEN}"
    echo "Learning mode selected."
    echo -e "${NC}"
    echo
    echo "This feature will be added in Version 1.3."
    echo
    pause
    main_menu
}

# ---------- Pause Function ----------
pause() {
    echo
    read -p "Press ENTER to continue..."
}

# ---------- Main Menu ----------
main_menu() {
    show_header
    echo "Choose an option:"
    echo
    echo "1) Automatic Installation"
    echo "2) Manual systemd Learning"
    echo "3) Learn Installation Steps"
    echo "4) Exit"
    echo
    read -p "Enter your choice (1-4): " choice

    # Input validation
    if ! [[ "$choice" =~ ^[1-4]$ ]]; then
        echo -e "${RED}Invalid option. Please enter 1, 2, 3, or 4.${NC}"
        sleep 2
        main_menu
        return
    fi

    case $choice in
        1) automatic_installation ;;
        2) manual_installation ;;
        3) learning_mode ;;
        4)
            echo
            echo "Thank you for using Asterisk PBX LAB Installer.!...---> Note : This bash script is compiled by AI. And AI can make errors."
            echo
            exit 0
            ;;
    esac
}

# ---------- Start ----------
main_menu
