#!/bin/sh

if cat /sys/class/power_supply/AC0/online | grep 0 > /dev/null 2>&1
then
    if pgrep steam >/dev/null; then
        echo "steam running"
    else
        systemctl suspend
    fi
else
    echo "ac online so does not suspend"
fi
