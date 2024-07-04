#!/bin/bash

LOGFILE="/home/bobparsons/scripts/logs/connect_speakers.log"
DEVICE_MAC="FC:E8:06:38:AF:83"

if ! command -v /usr/bin/bluetoothctl &> /dev/null; then
    echo "bluetoothctl could not be found, please install it." >> $LOGFILE 2>&1
    exit 0
fi

# Connect to the Bluetooth device
/usr/bin/bluetoothctl <<EOF >> $LOGFILE 2>&1
power on
agent on
default-agent
connect $DEVICE_MAC
EOF

# Adding a delay to wait for the connection to establish
sleep 3

# Check if the device is connected
if /usr/bin/bluetoothctl info $DEVICE_MAC | grep -q "Connected: yes"; then
    echo "Successfully connected to $DEVICE_MAC." >> $LOGFILE 2>&1
else
    echo "Failed to connect to $DEVICE_MAC. Retrying..." >> $LOGFILE 2>&1
    /usr/bin/bluetoothctl connect $DEVICE_MAC >> $LOGFILE 2>&1
    sleep 5
    if /usr/bin/bluetoothctl info $DEVICE_MAC | grep -q "Connected: yes"; then
        echo "Successfully connected to $DEVICE_MAC." >> $LOGFILE 2>&1
    else
        echo "Failed to connect to $DEVICE_MAC after retrying." >> $LOGFILE 2>&1
        exit 1
    fi
fi
