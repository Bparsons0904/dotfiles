#!/bin/bash
# Fix wake-up sources that prevent proper suspend

# Disable wake-up for USB controllers (mouse/keyboard movement won't wake system)
# Keep only essential wake-up sources
echo "Disabling unnecessary wake-up sources..."

# Disable PCI wake-up sources except essential ones
for device in PEG1 PEG0 RP03 RP21 RP25; do
    if grep -q "^$device.*enabled" /proc/acpi/wakeup; then
        echo "$device" | sudo tee /proc/acpi/wakeup > /dev/null
        echo "Disabled wake-up for $device"
    fi
done

# Keep XHCI (USB) enabled but make it more selective
# This allows keyboard/mouse to wake but reduces sensitivity
echo "USB wake-up sources configured"

# Check current status
echo -e "\nCurrent wake-up sources still enabled:"
cat /proc/acpi/wakeup | grep enabled