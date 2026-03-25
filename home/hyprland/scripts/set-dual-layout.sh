#!/bin/bash

# Explicitly set dual window layout mode (for screen sharing)

STATE_FILE="/tmp/hypr_layout_mode"

# Get current monitor name (assumes primary monitor)
if command -v jq &> /dev/null; then
    MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')
else
    MONITOR=$(hyprctl monitors | grep "Monitor" | head -n1 | awk '{print $2}')
fi

echo "dual" > "$STATE_FILE"

# Set resolution to half width
hyprctl keyword monitor "$MONITOR,2560x1440@120,0x0,1"

# Set master layout for 2 windows (50% each)
hyprctl keyword master:mfact 0.50
hyprctl keyword master:orientation left

# Force layout recalculation
sleep 0.1
hyprctl dispatch layoutmsg orientationcycle
sleep 0.05
hyprctl dispatch layoutmsg orientationcycle

notify-send -t 2000 "Layout Mode" "Dual Window (2560x1440)" -i video-display
