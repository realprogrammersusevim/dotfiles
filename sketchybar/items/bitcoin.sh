#!/usr/bin/env bash

sketchybar -m --add item bitcoin right \
    --set bitcoin                      \
    update_freq=10                     \
    background.drawing=off             \
    script="$PLUGINS/bitcoin.sh"
