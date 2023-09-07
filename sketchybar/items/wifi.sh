#!/usr/bin/env bash

sketchybar -m --add item           wifi.control right                      \
    \
    --set wifi.control   icon=$WIFI                                \
    label.drawing=off                       \
    click_script="$POPUP_CLICK_SCRIPT"      \
    popup.background.color=0x70000000       \
    popup.blur_radius=50                    \
    popup.background.corner_radius=5        \
    \
    --add item           wifi.ssid popup.wifi.control            \
    --set wifi.ssid      icon=$NETWORK                                \
    label="${SSID}"                         \
    \
    --add item           wifi.speed     popup.wifi.control       \
    --set wifi.speed     icon=$SPEED                        \
    script="$PLUGINS/wifi_click.sh"        \
    update_freq=10
