#!/usr/bin/env bash

sketchybar 	--add event hide_stats   	\
    --add event show_stats 					  \
    --add event toggle_stats 					\
    \
    --add item animator right         \
    --set animator drawing=off        \
    updates=on                   		  \
    script="$PLUGINS/toggle_stats.sh" \
    --subscribe	animator hide_stats show_stats toggle_stats

cpu_percent=(
    icon="$CPU"
    icon.color="0xff7aa2f7"
    update_freq=3
    mach_helper="$HELPER"
    script="$PLUGINS/cpu"
    label.width=35
    # width=75
    label.align=right
    icon.align=left
    background.drawing=off
)

sketchybar 	--add item cpu.percent right 					\
    --set cpu.percent "${cpu_percent[@]}"

memory=(
    icon="$MEMORY"
    icon.color=0xff9ece6a
    update_freq=10
    script="$PLUGINS/ram.sh"
    background.drawing=off
)

sketchybar 	--add item memory right 		\
    --set memory "${memory[@]}"

disk=(
    label.color="$TEXT"
    icon="$DISK"
    icon.color="$MAROON"
    update_freq=120
    script="$PLUGINS/disk.sh"
    background.drawing=off
)

sketchybar --add item disk right 		\
    --set disk "${disk[@]}"

network_down=(
    # y_offset=-7
    # label.font="$FONT:Heavy:10"
    label.color="$TEXT"
    icon="$NETWORK_DOWN"
    icon.font="$FONT:Bold:12.0"
    icon.color="$GREEN"
    icon.highlight_color="$BLUE"
    update_freq=3
    background.drawing=off
)

network_up=(
    # background.padding_right=-100
    # y_offset=7
    # label.font="$FONT:Heavy:10"
    label.color="$TEXT"
    icon="$NETWORK_UP"
    icon.font="$FONT:Bold:12.0"
    icon.color="$GREEN"
    icon.highlight_color="$BLUE"
    update_freq=2
    script="$PLUGINS/network.sh"
    background.drawing=off
)

sketchybar 	--add item network.down right 						\
    --set network.down "${network_down[@]}" 	\
    --add item network.up right 							\
    --set network.up "${network_up[@]}"

# systemstats=(
#     background.border_color=0xff414868
#     background.border_width=2
# )
#
# sketchybar --add bracket systemstats cpu.percent memory disk network.down network.up battery \
#     --set systemstats "${systemstats[@]}"
