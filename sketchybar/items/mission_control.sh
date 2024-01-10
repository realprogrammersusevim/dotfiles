#!/usr/bin/env bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    sketchybar --add space space.$sid left     \
        --set space.$sid associated_space=$sid \
        icon=${SPACE_ICONS[i]}                 \
        background.corner_radius=5             \
        background.color=0xffbb9af7            \
        background.height=20                   \
        label.drawing=off                      \
        script="$PLUGINS/space.sh"             \
        click_script="yabai -m space --focus $sid"
done


sketchybar -m --add item space_separator left \
    --set space_separator                     \
    icon="$CHEVRON_RIGHT"                     \
    padding_left=10                           \
    padding_right=10                          \
    label.drawing=off                         \
    background.drawing=off

sketchybar --add bracket spaces '/space\..*/' space_separator \
