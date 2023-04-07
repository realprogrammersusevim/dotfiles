#!/usr/bin/env sh

sketchybar -m --add item space_separator left                         \
    --set space_separator icon=                            \
    padding_left=10                   \
    padding_right=10                  \
    label.drawing=off                 \
    \
    --add item front_app left                               \
    --set front_app       script="$PLUGINS/front_app.sh" \
    icon.drawing=off                  \
    --subscribe front_app front_app_switched
