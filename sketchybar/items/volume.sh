#!/usr/bin/env sh

sketchybar -m --add item volume right \
    --set volume  script="$PLUGINS/volume.sh" \
    --subscribe volume volume_change
