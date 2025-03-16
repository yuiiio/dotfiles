#!/usr/bin/env bash

for f in /dev/shm/u1000-*; do
        if fuser "$f" >/dev/null 2>/dev/null; then
                continue
        fi
        rm "$f"
done;
