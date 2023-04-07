#!/usr/bin/env sh

sketchybar -m --add item clock right                        \
    --set clock   update_freq=1                  \
    script="$PLUGINS/clock.sh"
