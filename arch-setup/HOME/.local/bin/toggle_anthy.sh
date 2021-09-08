#!/bin/sh

FILE="$HOME/.config/running_wlanthy"

if [ -e $FILE ]; then
    pkill -9 wlanthy
    rm $FILE
else
    touch $FILE
    wlanthy
fi
