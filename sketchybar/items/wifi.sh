#!/usr/bin/env bash

wifi=(
    padding_right=7
    label.width=0
    icon="$WIFI"
    script="$PLUGINS/wifi.sh"
    background.drawing=off
)

sketchybar --add item wifi right \
    --set wifi "${wifi[@]}" \
    --subscribe wifi wifi_change mouse.clicked
