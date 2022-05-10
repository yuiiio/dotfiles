sudo udevadm trigger --verbose --type=devices --action=remove --subsystem-match=drm --property-match="MINOR=1"
