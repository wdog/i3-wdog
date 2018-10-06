#!/bin/bash

#IP=`ip route | grep default | awk '{print $3}'`
IP=$1
PING=`which ping`

RS="$PING -c 1 $IP "

if [ "`$RS`" > /dev/null ]
then
  OK=`$PING -c 1 $IP | sed '$!d;s|.*/\([0-9.]*\)/.*|\1|'`
  echo '${color green}' $OK '${color}'
else
  echo '${color red}KO${color}'
fi

