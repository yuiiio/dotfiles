#udevadm info -p /devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card{}
sudo udevadm trigger --verbose --type=devices --action=remove --subsystem-match=drm --property-match="DEVLINKS=/dev/dri/by-path/pci-0000:01:00.0-card"
