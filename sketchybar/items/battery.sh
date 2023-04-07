#!/usr/bin/env sh

sketchybar -m --add item battery right                            \
    --set battery script="$PLUGINS/battery.sh"       \
    update_freq=120                       \
    --subscribe battery system_woke power_source_change
