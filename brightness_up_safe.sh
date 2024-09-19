#!/bin/bash

# Get the current brightness value
current_brightness=$(xbacklight -get | awk '{printf "%d", $1}')

# Define the increment value
increment=5

# Calculate the new brightness value
new_brightness=$((current_brightness + increment))

# Ensure the brightness doesn't exceed 100%
if [ "$new_brightness" -gt 100 ]; then
    new_brightness=100
fi

# Set the new brightness value
xbacklight -set "$new_brightness"
~/scripts/get_brightness.sh
