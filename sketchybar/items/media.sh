#!/usr/bin/env bash

media=(
    icon.background.drawing=on
    icon.background.image=media.artwork
    icon.background.image.corner_radius=9
    script="$PLUGINS/media"
    background.border_color=0xff414868
    background.border_width=2
    label.max_chars=40
    scroll_texts=on
    updates=on
)

sketchybar --add item media right \
    --set media "${media[@]}" \
    --subscribe media media_change
