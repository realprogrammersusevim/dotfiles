#!/usr/bin/env sh

# Add event
sketchybar -m --add event song_update com.apple.iTunes.playerInfo

# Add Music Item
sketchybar -m --add item music right                         \
    --set music script="$PLUGINS/music"                      \
    label.padding_right=10                                   \
    drawing=off                                              \
    --subscribe music song_update
