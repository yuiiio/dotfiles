#!/bin/sh

WINEDEBUG=-all WINEARCH=win64 WINEPREFIX=$HOME/.wine-lol WINEDLLOVERRIDES="winemenubuilder.exe=d;d3d11=n;d3d9=n;dxgi=n;RiotClientCrashHandler.exe=d;" /usr/bin/wine /home/haibane/.wine-lol/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe
