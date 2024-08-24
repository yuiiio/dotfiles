CLOCK_STATE=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level)
if [ "$CLOCK_STATE" = "manual" ]; then
    echo "mnal"
elif [ "$CLOCK_STATE" = "auto" ]; then
    echo "auto"
elif [ "$CLOCK_STATE" = "low" ]; then
    echo "low"
fi
