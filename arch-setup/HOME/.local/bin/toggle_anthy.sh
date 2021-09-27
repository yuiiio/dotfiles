#!/bin/sh

FILE="$HOME/.config/running_wlanthy"

if [ -e $FILE ]; then
    if $(pkill -9 wlanthy); then
        rm $FILE;
    fi
else
    touch $FILE
    wlanthy
fi
