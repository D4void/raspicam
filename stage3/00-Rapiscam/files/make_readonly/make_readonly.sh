#!/bin/bash
# Make Raspbian buster fs read-only
# https://medium.com/swlh/make-your-raspberry-pi-file-system-read-only-raspbian-buster-c558694de79

sudo apt-get update
sudo apt-get -y upgrade

sudo systemctl disable  apt-daily.service
sudo systemctl disable  apt-daily-upgrade.service 

sudo apt-get -y remove --purge triggerhappy logrotate dphys-swapfile
sudo apt-get -y autoremove --purge

sudo cp -f boot-cmdline /boot/cmdline.txt

sudo apt-get -y install busybox-syslogd
sudo apt-get -y remove --purge rsyslog

sudo cp -f fstab /etc/fstab

sudo rm -rf /var/lib/dhcp /var/lib/dhcpcd5 /var/spool /etc/resolv.conf
sudo ln -s /tmp /var/lib/dhcp
sudo ln -s /tmp /var/lib/dhcpcd5
sudo ln -s /tmp /var/spool
sudo touch /tmp/dhcpcd.resolv.conf
sudo ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf

sudo rm /var/lib/systemd/random-seed
sudo touch /tmp/random-seed
sudo ln -s /tmp/random-seed /var/lib/systemd/random-seed

sudo cp -f systemd-random-seed.service /lib/systemd/system/

sudo cat rorw-prompt | sudo tee -a /etc/bash.bashrc

sudo cat bash-logout | sudo tee -a /etc/bash.bash_logout

cat /dev/null > ~/.bash_history

