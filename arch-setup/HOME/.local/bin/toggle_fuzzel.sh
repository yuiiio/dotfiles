#!/bin/sh

FILE="/tmp/running_fuzzel"

if [ -e $FILE ]; then
    #if $(pkill -9 fuzzel); then
    pkill -9 fuzzel
    rm $FILE
    #fi
else
    touch $FILE
    $HOME/fuzzel/build/fuzzel
    rm $FILE
fi
