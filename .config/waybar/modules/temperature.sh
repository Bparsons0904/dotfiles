#!/bin/bash

# Averages all CPU core temperatures for a stable reading
HWMON_PATH="/sys/class/hwmon/hwmon8"

total=0
count=0

# Read all core temperatures (skip Package id 0)
for temp_input in "$HWMON_PATH"/temp*_input; do
    [ -f "$temp_input" ] || continue

    # Get the corresponding label file
    label_file="${temp_input/_input/_label}"

    # Skip if it's the Package id (we want individual cores)
    if [ -f "$label_file" ]; then
        label=$(cat "$label_file")
        [[ "$label" == "Package id"* ]] && continue
    fi

    # Read temperature and add to total
    temp=$(cat "$temp_input")
    total=$((total + temp))
    count=$((count + 1))
done

# Calculate average and convert to Celsius
if [ $count -gt 0 ]; then
    avg_temp=$((total / count / 1000))
    echo "${avg_temp}°C"
else
    echo "N/A"
fi
