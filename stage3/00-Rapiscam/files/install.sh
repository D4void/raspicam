#!/bin/bash

########################################################################################
# Update Firmware - Making sure that your Raspbian firmware is the latest version.
########################################################################################
# update raspbian
apt-get update && apt-get -y upgrade
apt-get install -y vim bash bash-completion wpasupplicant cmake make automake git libasound2-dev liblog4cpp5-dev chrony ffmpeg motion v4l-utils apache2

# NTP
systemctl disable systemd-timesyncd
cp chrony.conf /etc/chrony/

# Disable motion & apache - included but not used
systemctl disable motion.service
systemctl disable apache2.service

########################################################################################
# Install RTSP server
########################################################################################

# Install the RTSP server - clone the rtsp server's git repository, compile and install
git clone https://github.com/mpromonet/v4l2rtspserver.git
cd v4l2rtspserver
cmake . && make
make install
cd ..

# Install the RTSP server - Put system service file for RTSP server into place
cp RTSP-Server.service /etc/systemd/system/RTSP-Server.service

# Install the RTSP server - Set the startup for the service to disabled for our default config.
systemctl enable RTSP-Server.service
