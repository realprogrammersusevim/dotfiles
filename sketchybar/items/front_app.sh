#!/usr/bin/env bash

front_app=(
    icon.background.drawing=on
    display=active
    script="$PLUGINS/front_app.sh"
    click_script="open -a 'Mission Control'"
    background.drawing=off
)

sketchybar --add item front_app left         \
    --set front_app "${front_app[@]}" \
    --subscribe front_app front_app_switched

# left_side=(
# background.border_color=0xff414868
# background.border_width=2
# )

# sketchybar --add bracket left_side '/space\..*/' space_separator front_app \
    #     --set left_side "${left_side[@]}"
