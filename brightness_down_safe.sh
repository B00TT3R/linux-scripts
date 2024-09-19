#!/bin/bash

# Get the current brightness value
current_brightness=$(xbacklight -get | awk '{printf "%d", $1}')

# Define the decrement value
decrement=5

# Calculate the new brightness value
new_brightness=$((current_brightness - decrement))

# Ensure the brightness doesn't go below 10%
if [ "$new_brightness" -lt 10 ]; then
    new_brightness=5
fi

# Set the new brightness value
xbacklight -set "$new_brightness"
~/scripts/get_brightness.sh
