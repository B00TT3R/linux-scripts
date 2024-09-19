#!/bin/bash

# Fetch current brightness level and format as a percentage
current_brightness=$(xbacklight -get | awk '{printf "%.0f", $1}')

# Output the percentage value
echo "${current_brightness}%"

