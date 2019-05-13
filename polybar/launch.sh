#!/bin/bash

# Terminate any currently running instances
pkill -9 polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

<<<<<<< HEAD
polybar --reload top -c ~/.config/polybar/config &
polybar --reload bottom-c ~/.config/polybar/config &
=======
polybar top -c ~/.config/polybar/config &
polybar bottom -c ~/.config/polybar/config &
>>>>>>> ab59f07ad799b56c3cb9dfd33e9139c42358da84


echo "polybars launched..."
