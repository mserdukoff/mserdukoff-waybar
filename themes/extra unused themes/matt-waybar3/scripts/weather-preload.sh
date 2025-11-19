#!/bin/bash

# Pre-fetch weather data to cache for immediate waybar display
~/.config/waybar/themes/matt-waybar3/scripts/wttr.py > /tmp/waybar-weather-cache.json 2>/dev/null &


