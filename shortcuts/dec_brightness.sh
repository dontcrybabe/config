BRIGHTNESS_FILE="/sys/class/backlight/amdgpu_bl1/brightness"
BRIGHT_MAX="/sys/class/backlight/amdgpu_bl1/max_brightness"
brightness=$(cat "$BRIGHTNESS_FILE")
brightness_max=$(cat $BRIGHT_MAX)
step=$((brightness_max / 20))
new_brightness=$((brightness - step))

# Ensure brightness doesn't go below 0
if [ "$new_brightness" -lt 0 ]; then
  new_brightness=0
fi

# Write the new brightness value
echo "$new_brightness" | tee "$BRIGHTNESS_FILE"
