#!/bin/sh
FILE="/tmp/cpu_max_clock_set"

# 1: state+, 2: state-
CYCLE_DIR=$1

if [ -e $FILE ]; then
    # 1: 0.8GHz, 2: 1.8GHz, 3: 4.4GHz
    VAR=$(cat $FILE)
    if [ $CYCLE_DIR = "1" ]; then
        if [ $VAR = "1" ]; then
            sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 1800000
            echo "2" > $FILE
        elif [ $VAR = "2" ]; then
            sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 4400000
            echo "3" > $FILE
        elif [ $VAR = "3" ]; then # cycle
            sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 800000
            echo "1" > $FILE
        fi
    elif [ $CYCLE_DIR = "2" ]; then # reverse
        if [ $VAR = "1" ]; then # cycle
            sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 4400000
            echo "3" > $FILE
        elif [ $VAR = "2" ]; then
            sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 800000
            echo "1" > $FILE
        elif [ $VAR = "3" ]; then
            sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 1800000
            echo "2" > $FILE
        fi
    fi
else
    # if not file exist(first run), set at 2: 1.8GHz and create tmp file.
    sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq <<< 1800000
    touch $FILE
    echo "2" > $FILE
fi
