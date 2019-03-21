#!/bin/bash

# Terminate any currently running instances
pkill -9 polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar top -c ~/.config/polybar/config &
polybar bottom -c ~/.config/polybar/config &


echo "polybars launched..."
