#!/usr/bin/env python3
import sys
import psutil
from time import sleep

def polyPrint(string):
    print(string, flush=True)  # Flush to ensure Polybar reads it immediately

def showBattery():
    battery = psutil.sensors_battery()
    plugged = battery.power_plugged
    percent = int(battery.percent)
    if plugged and percent == 100:
        return f"{percent}%"
    elif plugged:
        return f"{percent}% Charging"
    return f"{percent}%"

while True:
    polyPrint(showBattery())
    sleep(2)
