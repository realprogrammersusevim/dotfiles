#!/usr/bin/env sh

sketchybar -m --add item battery right      \
    --set battery                           \
    script="$PLUGINS/battery"               \
    update_freq=30                          \
    background.drawing=off                  \
    --subscribe battery system_woke power_source_change
