IGPU_CARD=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`

WLR_DRM_DEVICES="$IGPU_CARD" INTEL_DEBUG=noccs $HOME/gamescope/build/gamescope --prefer-vk-device 8086:3e9b -H 1080 -i -f -r 60 -o 60 -- $1
