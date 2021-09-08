#!/bin/sh

FILE="$HOME/.config/running_bemenu"

if [ -e $FILE ]; then
    pkill -9 bemenu-run
    rm $FILE
else
    touch $FILE
    bemenu-run --tb "#7AA2F7" --tf "#FFFFFF" --hb "#7AA2F7" --hf "#FFFFFF" --fb "#323232"  --nb "#323232"
    rm $FILE
fi
