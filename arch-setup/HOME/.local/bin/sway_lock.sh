#!/bin/sh

if pgrep steam >/dev/null || pgrep wine >/dev/null; then
    echo "steam or wine running"
else
    swaylock -f
fi