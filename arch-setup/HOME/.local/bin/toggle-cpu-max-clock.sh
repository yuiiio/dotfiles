#!/bin/sh
FILE="/tmp/cpu_max_clock_set"

if [ -e $FILE ]; then
    sudo cpupower frequency-set --max 4.4Ghz
    rm $FILE
else
    touch $FILE
    sudo cpupower frequency-set --max 1.8Ghz
fi
