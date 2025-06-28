#!/bin/sh

FILE="/tmp/running_wmenu"

if [ -e $FILE ]; then
    #if $(pkill -9 wmenu-run); then
        pkill -9 wmenu-run
        rm $FILE
    #fi
else
    touch $FILE
    wmenu-run -f "monospace 14"
    rm $FILE
fi
