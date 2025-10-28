#!/bin/bash
# Load hostname-specific monitor configuration for Hyprland

HOSTNAME=$(hostname)
MONITOR_DIR="$HOME/.config/hypr/config/monitors"
HOST_CONFIG="$MONITOR_DIR/$HOSTNAME.conf"
FALLBACK_CONFIG="$MONITOR_DIR/fallback.conf"

if [ -f "$HOST_CONFIG" ]; then
    echo "Loading monitor config for $HOSTNAME"

    # Read and apply each monitor line from the config
    while IFS= read -r line; do
        # Skip comments and empty lines
        if [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "$line" ]]; then
            if [[ "$line" =~ ^monitor ]]; then
                # Extract monitor configuration and apply it
                hyprctl keyword "$line"
            fi
        fi
    done < "$HOST_CONFIG"
else
    echo "No config found for $HOSTNAME, using fallback"

    # Read and apply fallback config
    while IFS= read -r line; do
        if [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "$line" ]]; then
            if [[ "$line" =~ ^monitor ]]; then
                hyprctl keyword "$line"
            fi
        fi
    done < "$FALLBACK_CONFIG"
fi
