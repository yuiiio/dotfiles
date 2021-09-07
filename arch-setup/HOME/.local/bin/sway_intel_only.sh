IGPU=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`

WLR_DRM_DEVICES="$IGPU" sway
