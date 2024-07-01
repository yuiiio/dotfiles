CLOCK_STATE=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level)
if [ "$CLOCK_STATE" = "manual" ]; then
    echo "1200"
elif [ "$CLOCK_STATE" = "auto" ]; then
    echo "auto"
fi
