#!/bin/sh

if pgrep steam >/dev/null || pgrep wine >/dev/null; then
    echo "steam or wine running"
else
    wayout --off eDP-1
    #swaymsg "output * dpms off"
fi
