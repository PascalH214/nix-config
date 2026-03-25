#!/bin/bash

# Toggle between ultrawide triple layout and dual split for screen sharing
STATE_FILE="/tmp/hypr_layout_mode"

# Get current monitor name (assumes primary monitor)
# If jq is not available, falls back to first monitor
if command -v jq &> /dev/null; then
    MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')
else
    MONITOR=$(hyprctl monitors | grep "Monitor" | head -n1 | awk '{print $2}')
fi

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "dual" ]; then
    # Switch to TRIPLE mode (full ultrawide)
    echo "triple" > "$STATE_FILE"
    
    # Set resolution to full ultrawide
    hyprctl keyword monitor "$MONITOR,5120x1440@120,0x0,1"
    
    # Set master layout for 3 windows (33% each)
    hyprctl keyword master:mfact 0.33
    hyprctl keyword master:orientation left
    
    # Force layout recalculation by cycling and triggering refresh
    sleep 0.1
    hyprctl dispatch layoutmsg orientationcycle
    sleep 0.05
    hyprctl dispatch layoutmsg orientationcycle
    
    notify-send -t 2000 "Layout Mode" "Triple Window (5120x1440)" -i video-display
else
    # Switch to DUAL mode (for screen sharing)
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
fi
