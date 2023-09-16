pactl set-sink-volume @DEFAULT_SINK@ +5%

# for plasma osd
NOW=$(show_volume.sh)
qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.volumeChanged ${NOW}
