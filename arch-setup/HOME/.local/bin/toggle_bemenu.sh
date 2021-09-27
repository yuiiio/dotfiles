#!/bin/sh

FILE="$HOME/.config/running_bemenu"

if [ -e $FILE ]; then
    if $(pkill -9 bemenu-run); then
        rm $FILE;
    fi
else
    touch $FILE
    bemenu-run --tb "#285577" --tf "#FFFFFF" --hb "#4C7899" --hf "#FFFFFF" --fb "#333333"  --nb "#333333"
    rm $FILE
fi
