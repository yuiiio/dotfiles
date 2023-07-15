#!/bin/sh

WINEDEBUG=-all WINEARCH=win64 WINEPREFIX=$HOME/.wine-lol WINEDLLOVERRIDES="winemenubuilder.exe=d;d3d11=b;d3d9=b;dxgi=b;RiotClientCrashHandler.exe=d;LeagueCrashHandler64.exe=d" /usr/bin/wine /home/haibane/.wine-lol/drive_c/Riot\ Games/Riot\ Client/RiotClientServices.exe
