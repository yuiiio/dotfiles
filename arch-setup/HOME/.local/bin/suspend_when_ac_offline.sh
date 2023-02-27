#!/bin/sh

if cat /sys/class/power_supply/AC0/online | grep 0 > /dev/null 2>&1
then
    if pgrep steam >/dev/null || pgrep wine >/dev/null; then
        echo "steam or wine running"
    #else
        #maybe after add libliftoff interface, after resume, stack at black screen(UHD630, kernel bug?)
        #systemctl suspend
    fi
else
    echo "ac online so does not suspend"
fi
