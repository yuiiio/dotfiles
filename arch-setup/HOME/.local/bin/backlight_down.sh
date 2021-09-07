#!/bin/sh

if pgrep steam >/dev/null; then
    echo "steam running"
else
    swaymsg "output * dpms off"
fi
