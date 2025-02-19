#!/bin/bash

# Add debug output to a log file
exec 1> >(tee -a "/tmp/file-manager-debug.log") 2>&1
echo "Script started at $(date)"

# Prioritize nautilus since it's installed
if command -v nautilus >/dev/null 2>&1; then
    echo "Using nautilus"
    echo nautilus
elif command -v thunar >/dev/null 2>&1; then
    echo "Using thunar"
    echo thunar
elif command -v pcmanfm >/dev/null 2>&1; then
    echo "Using pcmanfm"
    echo pcmanfm
else
    echo "No file manager found, defaulting to xdg-open"
    echo xdg-open
fi
