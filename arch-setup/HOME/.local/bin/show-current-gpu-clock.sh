CLOCK_STATE=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level)
if [ "$CLOCK_STATE" = "manual" ]; then
    echo "Mnal"
elif [ "$CLOCK_STATE" = "auto" ]; then
    echo "Auto"
elif [ "$CLOCK_STATE" = "low" ]; then
    echo "Low"
fi
