#!/bin/sh

if pgrep wlanthy >/dev/null; then
    pkill -9 wlanthy
else
    wlanthy
fi
