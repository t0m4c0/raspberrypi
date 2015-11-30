#!/bin/bash
##################################################
# Name: sensor_temperature.sh
# Description: Check Temperature and Humidity on Rpi
# Script Maintainer: CHERIF Malik
# License: GPLv3
# Last Updated: August 5th 2015
##################################################
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
##################################################
# Variables
#
HUMIDITY=$(/root/scripts/temp_dht11.sh|awk -F, {'print $1'}|sed  's/\.0//g')
TEMP=$(/root/scripts/temp_dht11.sh|awk -F, {'print $2'}|sed  's/\.0//g')
##################################################
# Usage Options
#
usage () {
  echo "Usage: $0 [OPTION]"
  echo "-T      To get temperature"
  echo "-H      To get Humidity"
exit 1
}
##################################################
# Statement part
#until [ -z "$1" ]; do
  case "$1" in
    -T)

if [ "$TEMP" -lt 20 ]
then
        echo "OK - Temp good :" $TEMP
else
        echo "CRITICAL - Temp over the top:" $TEMP
fi
    shift
    ;;
    -H)
if [ "$HUMIDITY" -lt 30 ]
then
        echo "OK - Temp good :" $HUMIDITY
else
        echo "CRITICAL - Temp over the top:" $HUMIDITY
fi
    shift
    ;;
   *)
   usage
   ;;
  esac
#shift
#done

##################################################
# EOF
