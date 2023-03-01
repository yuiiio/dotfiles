#!/bin/sh

if pgrep steam >/dev/null || pgrep wine >/dev/null; then
    echo "steam or wine running"
else
    IGPU_CARD=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`\ WLR_DRM_DEVICES="$IGPU_CARD" swaylock -f
fi
