sudo tee /sys/devices/virtual/misc/uhid/0005:054C:0CE6.*/leds/*/brightness <<< 0
sudo tee /sys/class/leds/input*:rgb:indicator/brightness <<< 0
sudo tee /sys/class/leds/input*/brightness <<< 0

cat /sys/class/power_supply/ps-controller-battery-88:03:4c:3d:ad:da/capacity
