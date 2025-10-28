#!/bin/bash
# Setup hostname-specific monitor configuration for Hyprland

HOSTNAME=$(hostname)
MONITOR_DIR="$HOME/.config/hypr/config/monitors"
SYMLINK="$MONITOR_DIR/current.conf"
HOST_CONFIG="$MONITOR_DIR/$HOSTNAME.conf"
FALLBACK_CONFIG="$MONITOR_DIR/fallback.conf"

echo "Setting up Hyprland monitor configuration for: $HOSTNAME"

if [ -f "$HOST_CONFIG" ]; then
    echo "✓ Found configuration for $HOSTNAME"
    ln -sf "$HOST_CONFIG" "$SYMLINK"
    echo "✓ Symlink created: current.conf -> $HOSTNAME.conf"
else
    echo "⚠ No configuration found for $HOSTNAME"
    echo "  Using fallback configuration"
    ln -sf "$FALLBACK_CONFIG" "$SYMLINK"
    echo "✓ Symlink created: current.conf -> fallback.conf"
    echo ""
    echo "To create a configuration for this computer:"
    echo "  1. Copy a template: cp $MONITOR_DIR/laptop-template.conf $HOST_CONFIG"
    echo "  2. Edit the configuration: nvim $HOST_CONFIG"
    echo "  3. Run this script again: $0"
fi

echo ""
echo "To reload Hyprland configuration:"
echo "  hyprctl reload"
