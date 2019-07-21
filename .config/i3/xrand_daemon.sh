#!/bin/bash

STATUS=$(</sys/class/drm/card0/card0-VGA-1/status )  

if [ "connected" == "$STATUS" ]; then  
    /usr/bin/xrandr  --output VGA-1  --auto --mode 1680x1050 --pos 0x0 --output LVDS-1 --off
    i3-msg restart
    exit
else  
    /usr/bin/xrandr   --output LVDS-1 --auto --mode 1280x800 --pos 0x0 --output VGA-1 --off
    i3-msg restart

fi


