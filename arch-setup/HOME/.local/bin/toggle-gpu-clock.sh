#!/bin/sh
FILE="/tmp/manual_gpu_clock"

# 1: state+, 2: state-
CYCLE_DIR=$1

if [ -e $FILE ]; then
    # 1: low, 2: auto, 3: manual(1200MHz)
    VAR=$(cat $FILE)
    if [ $CYCLE_DIR = "1" ]; then
        if [ $VAR = "1" ]; then
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
            echo "2" > $FILE
        elif [ $VAR = "2" ]; then
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "manual"
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
            # seems need toggle twice after sleep

            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "manual"
            sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "s 0 1200"
            sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "c"
            echo "3" > $FILE
        elif [ $VAR = "3" ]; then # cycle
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "low"
            echo "1" > $FILE
        fi
    elif [ $CYCLE_DIR = "2" ]; then # reverse
        if [ $VAR = "1" ]; then # cycle
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "manual"
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
            # seems need toggle twice after sleep

            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "manual"
            sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "s 0 1200"
            sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "c"
            echo "3" > $FILE
        elif [ $VAR = "2" ]; then
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "low"
            echo "1" > $FILE
        elif [ $VAR = "3" ]; then
            sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
            echo "2" > $FILE
        fi
    fi
else
    # if not exist(first run), set at auto and create tmp file 
    sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
    touch $FILE
    echo "2" > $FILE
fi
