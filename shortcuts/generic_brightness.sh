#!/bin/bash

# Directory containing backlight interfaces
BACKLIGHT_DIR="/sys/class/backlight"

# Function to find the first available backlight interface
find_backlight_interface() {
    if [ -d "$BACKLIGHT_DIR" ]; then
        backlight=$(ls "$BACKLIGHT_DIR" | head -n 1)
        if [ -z "$backlight" ]; then
            echo "Error: No backlight interface found in $BACKLIGHT_DIR"
            exit 1
        fi
        echo "$BACKLIGHT_DIR/$backlight"
    else
        echo "Error: Backlight directory $BACKLIGHT_DIR not found"
        exit 1
    fi
}

# Function to validate file existence
check_file() {
    local file="$1"
    local description="$2"
    if [ ! -f "$file" ]; then
        echo "Error: $description file $file not found"
        exit 1
    fi
}

# Function to adjust brightness
adjust_brightness() {
    local brightness_file="$1"
    local max_brightness_file="$2"
    local adjustment="$3"  # Positive for increase, negative for decrease

    # Read current brightness and max brightness
    local brightness=$(cat "$brightness_file" 2>/dev/null)
    local brightness_max=$(cat "$max_brightness_file" 2>/dev/null)

    # Validate brightness values
    if ! [[ "$brightness" =~ ^[0-9]+$ ]] || ! [[ "$brightness_max" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid brightness values"
        exit 1
    fi

    # Calculate step size (5% of max brightness)
    local step=$((brightness_max / 20))

    # Apply adjustment
    local new_brightness=$((brightness + adjustment * step))

    # Ensure brightness stays within bounds
    if [ "$new_brightness" -gt "$brightness_max" ]; then
        new_brightness="$brightness_max"
    elif [ "$new_brightness" -lt 0 ]; then
        new_brightness=0
    fi

    # Write the new brightness value (requires root privileges)
    if ! echo "$new_brightness" | sudo tee "$brightness_file" > /dev/null; then
        echo "Error: Failed to set brightness to $new_brightness"
        exit 1
    fi

    echo "Brightness set to $new_brightness (Max: $brightness_max)"
}

# Main script
# Check for usage
if [ $# -eq 0 ]; then
    echo "Usage: $0 <up|down>"
    exit 1
fi

# Get backlight interface
BACKLIGHT_PATH=$(find_backlight_interface)
BRIGHTNESS_FILE="$BACKLIGHT_PATH/brightness"
MAX_BRIGHTNESS_FILE="$BACKLIGHT_PATH/max_brightness"

# Validate backlight files
check_file "$BRIGHTNESS_FILE" "Brightness"
check_file "$MAX_BRIGHTNESS_FILE" "Max brightness"

# Determine adjustment direction
case "$1" in
    up)
        adjust_brightness "$BRIGHTNESS_FILE" "$MAX_BRIGHTNESS_FILE" 1
        ;;
    down)
        adjust_brightness "$BRIGHTNESS_FILE" "$MAX_BRIGHTNESS_FILE" -1
        ;;
    *)
        echo "Error: Invalid argument. Use 'up' or 'down'."
        exit 1
        ;;
esac
