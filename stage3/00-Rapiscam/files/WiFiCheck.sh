#!/bin/bash
# 
#
# sudo crontab -e:
# */5 * * * * /usr/local/bin/WiFiCheck.sh <IP DEST>
# /etc/crontab if read-only sd:
# */5 * * * * root /usr/local/bin/WiFiCheck.sh <IP DEST>
#
##################################################################
lockfile='/var/run/WiFi_Check.pid'
logfile='/var/log/WiFiCheck.log'
wlan='wlan0'
##################################################################
echo
echo "Wifi connection check for $wlan"
echo 

if [ -e $lockfile ]; then
    pid=`cat $lockfile`
    if kill -0 &>1 > /dev/null $pid; then
        exit 1
    else
        rm $lockfile
    fi
fi

echo $$ > $lockfile

if ping -c 4 $1 ; then
	echo $(date '+%Y/%m/%d-%Hh%Mm%Ss:') "Connection ok."
else
    echo $(date '+%Y/%m/%d-%Hh%Mm%Ss:') "Wifi connection down! Attempting reconnection." >> $logfile
    /usr/sbin/wpa_cli -i wlan0 reconfigure >> $logfile
fi

echo 
echo
 
rm $lockfile
exit 0


