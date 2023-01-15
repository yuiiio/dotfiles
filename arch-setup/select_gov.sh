#!/bin/sh

if cat /sys/class/power_supply/AC0/online | grep 0 > /dev/null 2>&1
then
	cpupower frequency-set -g conservative
	tee /sys/devices/system/cpu/cpufreq/policy*/energy_performance_preference <<< power
	tee /sys/module/pcie_aspm/parameters/policy <<< powersupersave
	tee /sys/devices/system/cpu/intel_pstate/energy_efficiency <<< 1
	tee /sys/devices/system/cpu/intel_pstate/no_turbo <<< 1
else
	cpupower frequency-set -g ondemand
	tee /sys/devices/system/cpu/cpufreq/policy*/energy_performance_preference <<< balance_performance
	tee /sys/module/pcie_aspm/parameters/policy <<< default
	tee /sys/devices/system/cpu/intel_pstate/energy_efficiency <<< 0
	tee /sys/devices/system/cpu/intel_pstate/no_turbo <<< 0
fi
