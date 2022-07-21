sudo udevadm trigger --verbose --type=devices --action=remove --subsystem-match=drm --property-match="DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0"
