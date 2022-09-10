#!/bin/bash

/usr/bin/lsusb -t

sleep 2

# Touchscreen ELAN
echo -n "1-12" > /sys/bus/usb/drivers/usb/unbind

# Video
echo -n "1-9" > /sys/bus/usb/drivers/usb/unbind

# Wireless
echo -n "1-14" > /sys/bus/usb/drivers/usb/unbind

/usr/bin/lsusb -t
