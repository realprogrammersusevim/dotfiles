#!/usr/bin/env sh

sketchybar -m --add item packages right \
    --set packages update_freq=1800 \
    --set packages script="$PLUGINS/package_monitor.sh" \
    --set packages label=
