#!/bin/sh
/usr/bin/tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< manual
/usr/bin/tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< auto
# seems need toggle twice after sleep

/usr/bin/tee /sys/class/drm/card0/device/power_dpm_force_performance_level <<< manual

/usr/bin/tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "s 0 1200"
/usr/bin/tee /sys/class/drm/card0/device/pp_od_clk_voltage <<< "c"

# set gpu minimum clock to 1200Mhz.(for gaming)
# if using apu, cpu power waste and will be limits at like ~2.5GHz if gpu usage is high.
# but if gpu usage is low, cpu can clock at High(~4GHz)
# so expects no other negative effect.
