#!/bin/sh
/usr/bin/tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< low
