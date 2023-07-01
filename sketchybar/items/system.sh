#!/usr/bin/env bash

sketchybar 	--add event 				hide_stats   					                                      \
    --add event 				show_stats 					                                        \
    --add event 				toggle_stats 					                                      \
    \
    --add item         	animator right                									            \
    --set animator     	drawing=off                  									              \
    updates=on                   									              \
    script="$PLUGINS/toggle_stats.sh"   \
    --subscribe        	animator hide_stats show_stats toggle_stats

source "$UTILS/colors.sh"
source "$UTILS/icons.sh"

FONT="Hack Nerd Font"
NERD_FONT="Hack Nerd Font"

cpu_percent=(
    label.font="$FONT:Heavy:12"
    label.color="$TEXT"
    icon="$CPU"
    icon.color="$BLUE"
    update_freq=2
    mach_helper="$HELPER"
    script="$PLUGINS/cpu.sh"
    label.width=50
    # width=75
    label.align=right
    icon.align=left
)

sketchybar 	--add item cpu.percent right 					\
    --set cpu.percent "${cpu_percent[@]}"

memory=(label.font="$FONT:Heavy:12"
    label.color="$TEXT"
    icon="$MEMORY"
    icon.font="$FONT:Bold:16.0"
    icon.color="$GREEN"
    update_freq=15
    script="$PLUGINS/ram.sh"
)

sketchybar 	--add item memory right 		\
    --set memory "${memory[@]}"

disk=(
    label.font="$FONT:Heavy:12"
    label.color="$TEXT"
    icon="$DISK"
    icon.color="$MAROON"
    update_freq=60
    script="$PLUGINS/disk.sh"
)

sketchybar --add item disk right 		\
    --set disk "${disk[@]}"

network_down=(
    y_offset=-7
    label.font="$FONT:Heavy:10"
    label.color="$TEXT"
    icon="$NETWORK_DOWN"
    icon.font="$NERD_FONT:Bold:16.0"
    icon.color="$GREEN"
    icon.highlight_color="$BLUE"
    update_freq=1
)

network_up=(
    background.padding_right=-70
    y_offset=7
    label.font="$FONT:Heavy:10"
    label.color="$TEXT"
    icon="$NETWORK_UP"
    icon.font="$NERD_FONT:Bold:16.0"
    icon.color="$GREEN"
    icon.highlight_color="$BLUE"
    update_freq=1
    script="$PLUGINS/network.sh"
)

sketchybar 	--add item network.down right 						\
    --set network.down "${network_down[@]}" 	\
    --add item network.up right 							\
    --set network.up "${network_up[@]}"


separator_right=(
    icon=
    icon.font="$NERD_FONT:Regular:16.0"
    background.padding_left=10
    background.padding_right=15
    label.drawing=off
    click_script='sketchybar --trigger toggle_stats'
    icon.color="$TEXT"
)

sketchybar  --add item separator_right right \
    --set separator_right "${separator_right[@]}"
