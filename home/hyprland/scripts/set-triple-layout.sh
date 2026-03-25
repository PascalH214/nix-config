#!/bin/bash

# Explicitly set triple window layout mode

STATE_FILE="/tmp/hypr_layout_mode"

# Get current monitor name (assumes primary monitor)
if command -v jq &> /dev/null; then
    MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')
else
    MONITOR=$(hyprctl monitors | grep "Monitor" | head -n1 | awk '{print $2}')
fi

echo "triple" > "$STATE_FILE"

# Set resolution to full ultrawide
hyprctl keyword monitor "$MONITOR,5120x1440@120,0x0,1"

# Set master layout for 3 windows (33% each)
hyprctl keyword master:mfact 0.33
hyprctl keyword master:orientation left

# Force layout recalculation
sleep 0.1
hyprctl dispatch layoutmsg orientationcycle
sleep 0.05
hyprctl dispatch layoutmsg orientationcycle

notify-send -t 2000 "Layout Mode" "Triple Window (5120x1440)" -i video-display
