#!/bin/sh

# DXVK_FILTER_DEVICE_NAME="UHD Graphics 630" WINEDEBUG=-all WINEARCH=win64 WINEPREFIX=$HOME/.wine-lol WINEDLLOVERRIDES="winemenubuilder.exe=d;d3d11=n;d3d9=b;dxgi=n" /usr/bin/wine /home/haibane/.wine-lol/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe

# WINEDEBUG=-all WINEARCH=win64 WINEPREFIX=$HOME/.wine-lol WINEDLLOVERRIDES="winemenubuilder.exe=d;d3d11=b;d3d9=b;dxgi=b" /usr/bin/wine /home/haibane/.wine-lol/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe

WINEDEBUG=-all WINEARCH=win64 WINEPREFIX=$HOME/.wine-lol WINEDLLOVERRIDES="winemenubuilder.exe=d;d3d11=b;d3d9=b;dxgi=b" /usr/bin/wine /home/haibane/.wine-lol/drive_c/Riot\ Games/Riot\ Client/RiotClientServices.exe
