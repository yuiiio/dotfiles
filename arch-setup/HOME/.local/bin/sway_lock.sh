#!/bin/sh

if pgrep steam >/dev/null || pgrep wine || pgrep rpcs3 >/dev/null; then
    echo "steam or wine running"
else
    swaylock -f
fi
