#!/bin/sh

if cat /sys/class/power_supply/AC/online | grep 0 > /dev/null 2>&1
then
    if pgrep steam >/dev/null || pgrep wine >/dev/null; then
        echo "steam or wine running"
    else
        systemctl suspend
    fi
else
    echo "ac online so does not suspend"
fi
