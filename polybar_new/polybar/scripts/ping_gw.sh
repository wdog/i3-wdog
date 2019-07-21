#!/bin/bash

#IP=`ip route | grep default | awk '{print $3}'`
IP=$1
PING=`which ping`

if [ $# -eq 0 ]
  then
  IP=$(ip route | head -n 1 | awk '/default via/ {print $3}')
fi



RS="$PING -c 1 $IP "

if [ "`$RS`" > /dev/null ]
then
  OK=`$PING -c 1 $IP | sed '$!d;s|.*/\([0-9.]*\)/.*|\1|'`
  echo $OK 
else
  echo KO
fi
