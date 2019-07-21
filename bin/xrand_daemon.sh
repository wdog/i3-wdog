#!/bin/bash

# Get out of town if something errors
set -e

STATUS=$(</sys/class/drm/card0/card0-VGA-1/status )  

if [ "connected" == "$STATUS" ]; then  
    /usr/bin/xrandr  --output VGA-1  --auto --mode 1680x1050 --pos 0x0 --output LVDS-1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "LVDS plugged in"
else  
    /usr/bin/xrandr   --output LVDS-1 --auto --mode 1280x800 --pos 0x0 --output VGA-1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi
