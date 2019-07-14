#!/bin/bash

# Terminate any currently running instances
pkill -9 polybar

# Pause while killall completes
while pgrep -x polybar > /dev/null; do sleep 1; done

polybar --reload top -c ~/.config/polybar/Polybar &
polybar --reload bottom -c ~/.config/polybar/Polybar &

#polybar top -c ~/.config/polybar/Polybar &
#polybar bottom -c ~/.config/polybar/Polybar &

# Launch bar(s)
# polybar dummy -q &
# polybar top -q &
# polybar bottom -q  &

echo "polybars launched..."
