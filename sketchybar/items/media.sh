#!/usr/bin/env bash

media=(
    icon.background.drawing=on
    icon.background.image=media.artwork
    icon.background.image.corner_radius=9
    script="$PLUGINS/media"
    label.max_chars=30
    scroll_texts=on
    updates=on
)

sketchybar --add item media right \
    --set media "${media[@]}" \
    --subscribe media media_change
