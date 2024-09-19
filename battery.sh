#!/bin/bash

# Variables to store the previous battery status and percentage
prev_status=""
prev_percentage=""

while true; do
    # Get the battery information using acpi
    battery_info=$(acpi -b)
    
    # Extract the percentage and charging status
    percentage=$(echo "$battery_info" | grep -oP '\d+%' | tr -d '%')
    status=$(echo "$battery_info" | grep -oP 'Charging|Discharging|Full')

    # Only update Polybar if the status or percentage has changed
    if [[ "$percentage" != "$prev_percentage" || "$status" != "$prev_status" ]]; then
        # Output the battery percentage and status
        echo "$percentage% ($status)"

        # Update previous status and percentage
        prev_percentage="$percentage"
        prev_status="$status"
    fi

    # If charging state changes, check more frequently
    if [[ "$status" == "Charging" || "$status" == "Discharging" ]]; then
        sleep 2  # Check more frequently when there's a status change
    else
        sleep 30  # Otherwise, check less frequently
    fi
done

