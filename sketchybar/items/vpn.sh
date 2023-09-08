#!/usr/bin/env bash

sketchybar --add item vpn right \
    --set vpn                   \
    script="$PLUGINS/vpn.sh"    \
    update_freq=10
