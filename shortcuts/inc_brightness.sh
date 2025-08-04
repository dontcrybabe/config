#!/bin/bash

BRIGHTNESS_FILE="/sys/class/backlight/amdgpu_bl1/brightness"
BRIGHT_MAX="/sys/class/backlight/amdgpu_bl1/max_brightness"

# Check if brightness file exists
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    echo "Error: Brightness file $BRIGHTNESS_FILE not found"
    exit 1
fi

# Check if max brightness file exists
if [ ! -f "$BRIGHT_MAX" ]; then
    echo "Error: Max brightness file $BRIGHT_MAX not found"
    exit 1
fi

# Read current brightness and max brightness
brightness=$(cat "$BRIGHTNESS_FILE")
brightness_max=$(cat "$BRIGHT_MAX")
step=$((brightness_max / 20))

# Calculate new brightness
new_brightness=$((brightness + step))

# Ensure brightness doesn't exceed max_brightness
if [ "$new_brightness" -gt "$brightness_max" ]; then
    new_brightness="$brightness_max"
fi

# Ensure brightness doesn't go below 0
if [ "$new_brightness" -lt 0 ]; then
    new_brightness=0
fi

# Write the new brightness value
echo "$new_brightness" | tee "$BRIGHTNESS_FILE" > /dev/null
