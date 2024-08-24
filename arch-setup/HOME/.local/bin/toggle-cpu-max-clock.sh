#!/bin/sh
FILE="/tmp/cpu_max_clock_set"

if [ -e $FILE ]; then
    #sudo cpupower frequency-set --max 4.4Ghz
    sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 4400000
    rm $FILE
else
    touch $FILE
    #sudo cpupower frequency-set --max 1.8Ghz
    sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 1800000
fi
