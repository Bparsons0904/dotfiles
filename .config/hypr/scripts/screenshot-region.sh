#!/usr/bin/env bash
# Screenshot script that saves to file and copies to clipboard
# Saves screenshot and displays notification with file path

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="$SCREENSHOT_DIR/screenshot_${TIMESTAMP}.png"

# Take screenshot, save to file, and copy image data to clipboard
grimblast --notify copysave area "$FILENAME"

# Show notification with file path
if [ -f "$FILENAME" ]; then
    notify-send "Screenshot saved" "$FILENAME" -t 3000
fi
