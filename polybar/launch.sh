#!/bin/bash

# Terminate any currently running instances
pkill -9 polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar --reload top -c ~/.config/polybar/config &

# Launch bar(s)
# polybar dummy -q &
# polybar top -q &
# polybar bottom -q  &

echo "polybars launched..."
