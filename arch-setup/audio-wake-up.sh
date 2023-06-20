#!/bin/sh
tee /sys/bus/pci/devices/0000:00:1f.3/remove <<< 1
tee /sys/bus/pci/rescan <<< 1

