#!/bin/bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#

# -----------------------------------------------------
# Prevent duplicate launches: only the first parallel
# invocation proceeds; all others exit immediately.
# -----------------------------------------------------
exec 200>/tmp/waybar-launch.lock
flock -n 200 || exit 0

# -----------------------------------------------------
# Quit all running waybar instances
# -----------------------------------------------------
killall waybar || true
killall weather-loop.sh || true
pkill waybar || true
sleep 0.5

# Start SwayNC weather updater
~/.config/swaync/weather-loop.sh &

# Pre-load weather data for matt-waybar3 theme
if [[ "$themestyle" == *"matt-waybar3"* ]]; then
    ~/.config/waybar/themes/matt-waybar3/scripts/weather-preload.sh
fi

# -----------------------------------------------------
# Default theme: /THEMEFOLDER;/VARIATION
# -----------------------------------------------------
themestyle="/matt-waybar3;/matt-waybar3"

# -----------------------------------------------------
# Get current theme information from ~/.config/ml4w/settings/waybar-theme.sh
# -----------------------------------------------------
if [ -f ~/.config/ml4w/settings/waybar-theme.sh ]; then
    themestyle=$(cat ~/.config/ml4w/settings/waybar-theme.sh)
else
    touch ~/.config/ml4w/settings/waybar-theme.sh
    echo "$themestyle" >~/.config/ml4w/settings/waybar-theme.sh
fi

IFS=';' read -ra arrThemes <<<"$themestyle"
echo ":: Theme: ${arrThemes[0]}"

if [ ! -f ~/.config/waybar/themes${arrThemes[1]}/style.css ]; then
    themestyle="/ml4w;/ml4w/light"
fi

# -----------------------------------------------------
# Loading the configuration
# -----------------------------------------------------
config_file="config"
style_file="style.css"

# Standard files can be overwritten with an existing config-custom or style-custom.css
if [ -f ~/.config/waybar/themes${arrThemes[0]}/config-custom ]; then
    config_file="config-custom"
fi
if [ -f ~/.config/waybar/themes${arrThemes[1]}/style-custom.css ]; then
    style_file="style-custom.css"
fi

# Check if waybar-disabled file exists
if [ ! -f $HOME/.config/ml4w/settings/waybar-disabled ]; then
    waybar -c ~/.config/waybar/themes${arrThemes[0]}/$config_file -s ~/.config/waybar/themes${arrThemes[1]}/$style_file &
else
    echo ":: Waybar disabled"
fi

# Explicitly release the lock (optional) -> flock releases on exit
flock -u 200
exec 200>&-