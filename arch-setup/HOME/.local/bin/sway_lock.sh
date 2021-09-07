#!/bin/sh

if pgrep steam >/dev/null; then
    echo "steam running"
else
    swaylock -f -i /usr/local/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png
fi
