#!/bin/sh
$HOME/.local/bin/lol-launchhelper.sh &
DXVK_FILTER_DEVICE_NAME="UHD Graphics 630" WINEFSYNC=1 WINEDEBUG=-all WINEARCH=win32 WINEPREFIX=~/.wine-lol WINEDLLOVERRIDES="winemenubuilder.exe=d;d3d11=n;d3d9=b;dxgi=n" /opt/wine-lol/bin/wine ~/.wine-lol/drive_c/Riot\ Games/League\ of\ Legends\ \(PBE\)/LeagueClient.exe
