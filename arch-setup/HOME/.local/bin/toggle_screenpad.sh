#!/bin/sh

state_file="/tmp/screenpad_status"

if [ -f $state_file ]; then
    echo "file found"
else
    touch $state_file
    echo off > $state_file
    #echo 0 > $state_file
fi

current_state=$(cat $state_file)

#change=$1

#case $change in
#    "up" )
#        value=$current_state + 10
#        if [ $value -gt 255 ]; then
#            value=255
#        fi
#        echo $value > /sys/class/leds/asus::screenpad/brightness
#        echo $value > $state_file;;
#    "down" )
#        value=$current_state-10
#        if [ $value -lt 0 ]; then
#            value=0
#        fi
#        echo $value > /sys/class/leds/asus::screenpad/brightness
#        echo $value > $state_file;;
#esac

case $current_state in
    "on" )
        echo 0 > /sys/class/leds/asus::screenpad/brightness
        echo off > $state_file
        echo "off";;
    "off" )
        MAIN_DISPLAY_BACKLIGHT=`cat /sys/class/backlight/intel_backlight/brightness`

        LEVEL=$(($MAIN_DISPLAY_BACKLIGHT / 600))
        echo $LEVEL > /sys/class/leds/asus::screenpad/brightness
        echo on > $state_file
        echo "on";;
     * )
        rm $state_file
esac
