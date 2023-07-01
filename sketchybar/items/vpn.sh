#!/usr/bin/env bash

vpn=(
    icon.font="Hack Nerd Font:Heavy:12"
    update_freq=30
    script="$PLUGINS/vpn.sh"
)

sketchybar --add item vpn right \
    --set vpn "${vpn[@]}"
