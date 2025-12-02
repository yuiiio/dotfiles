CURRENT_MAX_CLOCK=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
echo "${CURRENT_MAX_CLOCK:0:-3}"
