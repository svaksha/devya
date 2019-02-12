#!/usr/bin/env bash
################################################################################
# FILE       : apt-install-nonfree.sh
# DESCRIPTION: Bash script to install some Non-Free programs. 
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/BIO
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2015jul22 - Updated:2016mar23
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

# Moved the non-free proprietary non-foss libs that are not needed on the server side.

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yaks-apt-nonfree.log
date +"%c|completed running: $?" >> out-yaks-apt-nonfree.log

# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Change to Debian-Jessie running KDE desktop.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_flashplugin() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    # Restricted extras for FLASH plugin
    sudo apt-get -y install flashplugin-nonfree
    sudo apt-get -y install flashplugin-nonfree-extrasound
    sudo apt-get -y install pepperflashplugin-nonfree
}

# https://wiki.debian.org/skype
function install_skype() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo dpkg --add-architecture i386
    cd
    wget -c http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb
    sudo dpkg -i skype-debian_4.3.0.37-1_i386.deb    
    sudo apt-get -y update
    sudo apt-get -f install
#    sudo dpkg -i skype-install.deb
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CASE
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

install_nonfree='all'

case $install_nonfree in
    flashplugin)
        install_flashplugin
    ;;
    skype)
        install_skype
    ;;
    all)
        install_flashplugin
        install_skype
    ;;
    *)
        echo "Installation of Non-Free packages is in progress!"
    esac
