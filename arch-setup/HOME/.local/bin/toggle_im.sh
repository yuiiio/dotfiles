#!/bin/sh

FILE="/tmp/running_fcitx5"

if [ -e $FILE ]; then
    #if $(pkill -9 fcitx5); then
    pkill -9 fcitx5;
    pkill -9 mozc;
    rm $FILE;
    #fi
else
    touch $FILE
    fcitx5
fi
