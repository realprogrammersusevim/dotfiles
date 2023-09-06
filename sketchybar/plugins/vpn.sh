#!/bin/sh

source "$UTILS/icons.sh"
source "$UTILS/colors.sh"

if [ "$(mullvad status)" = "Disconnected" ]; then
    ICON=$UNLOCKED
    COLOR=$RED
else
    ICON=$LOCKED
    COLOR=$GREEN
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR"
