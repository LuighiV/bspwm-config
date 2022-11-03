#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 
echo "---" | tee -a /tmp/polybar_two_1.log 
polybar mainbar 2>&1 | tee -a /tmp/polybar_two_1.log & disown

# Launch bar bottom
echo "---" | tee -a /tmp/polybar_two_1_bottom.log 
polybar bottom 2>&1 | tee -a /tmp/polybar_two_1_bottom.log & disown

# Launch bar2
echo "---" | tee -a /tmp/polybar_two_2.log 
polybar external 2>&1 | tee -a /tmp/polybar_two_2.log & disown

echo "Bars launched..."
