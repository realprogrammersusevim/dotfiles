#!/usr/bin/env sh

sketchybar -m --add item clock right   \
    --set clock                        \
    update_freq=1                      \
    background.drawing=off             \
    script="$PLUGINS/clock"
