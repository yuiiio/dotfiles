#!/bin/sh
FILE="/tmp/manual_gpu_clock"

if [ -e $FILE ]; then
    sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
    # echo "exit gamemode"
    rm $FILE
else
    touch $FILE
    sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "manual"
    sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "auto"
    # seems need toggle twice after sleep

    sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< "manual"
    sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "s 0 1200"
    sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "c"
    # echo "gamemode gpu clock"
fi
