#!/bin/bash

current_brightness=$(xbacklight -get | awk '{printf "%.0f", $1}')
echo "${current_brightness}%"

