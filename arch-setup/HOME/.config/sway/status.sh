date=$(date +"%Y-%m-%d %l:%M %p")
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

echo Battery:$battery_capacity% $date
