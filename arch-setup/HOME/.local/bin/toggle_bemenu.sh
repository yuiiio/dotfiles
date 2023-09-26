#!/bin/sh

FILE="/tmp/running_bemenu"

if [ -e $FILE ]; then
    #if $(pkill -9 bemenu-run); then
        pkill -9 bemenu-run;
        rm $FILE;
    #fi
else
    touch $FILE
    # bemenu-run --tb "#285577" --tf "#FFFFFF" --hb "#4C7899" --hf "#FFFFFF" --fb "#333333"  --nb "#333333" --fn 'monospace 14'
    bemenu-run --tb "#88c0d0" --tf "#2e3440" --hb "#88c0d0" --hf "#2e3440" --fb "#2E3440" --nb "#2E3440" --ab "#d8dee9" --af "#2e3440" --fn 'monospace 13'
    rm $FILE
fi
