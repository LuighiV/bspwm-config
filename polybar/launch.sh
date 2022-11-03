#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 
echo "---" | tee -a /tmp/polybar1.log 
polybar mainbar 2>&1 | tee -a /tmp/polybar1.log & disown

# Launch bar_bottom
echo "---" | tee -a /tmp/polybar2.log 
polybar bottom 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
