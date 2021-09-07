#!/bin/sh

if pgrep bemenu-run >/dev/null; then
    pkill -9 bemenu-run
else
    bemenu-run --tb "#7AA2F7" --tf "#FFFFFF" --hb "#7AA2F7" --hf "#FFFFFF" --fb "#323232"  --nb "#323232" | xargs swaymsg exec --
fi
