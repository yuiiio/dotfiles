#!/bin/sh

FILE="/tmp/running_fuzzel"

if [ -e $FILE ]; then
    #if $(pkill -9 fuzzel); then
    rm $FILE
    pkill -9 fuzzel
    #fi
else
    touch $FILE
    $HOME/fuzzel/build/fuzzel
    rm $FILE
fi
