#!/bin/sh

source "$HOME/.config/sketchybar/utils/icons.sh"
source "$HOME/.config/sketchybar/utils/colors.sh"

if [ "$(mullvad status)" = "Disconnected" ]; then
    ICON=$UNLOCKED
    COLOR=$RED
else
    ICON=$LOCKED
    COLOR=$GREEN
fi

sketchybar --set vpn icon="$ICON" icon.color="$COLOR"
