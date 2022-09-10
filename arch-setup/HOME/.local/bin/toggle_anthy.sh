#!/bin/sh

FILE="$HOME/.config/running_wlanthy"

if [ -e $FILE ]; then
    #if $(pkill -9 wlanthy); then
    pkill -9 wlanthy;
        rm $FILE;
    #fi
else
    touch $FILE
    wlanthy
fi
