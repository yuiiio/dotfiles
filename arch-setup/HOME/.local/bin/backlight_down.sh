#!/bin/sh

if pgrep steam >/dev/null || pgrep wine >/dev/null; then
    echo "steam or wine running"
else
    #swaymsg "output * dpms off"
    wayout --off DP-2
fi
