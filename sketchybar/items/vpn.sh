#!/usr/bin/env bash

vpn=(
    update_freq=30
    script="$PLUGINS/vpn.sh"
)

sketchybar --add item vpn right \
    --set vpn "${vpn[@]}"
