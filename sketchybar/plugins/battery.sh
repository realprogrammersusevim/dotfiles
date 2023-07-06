#!/bin/sh

source "$HOME/.config/sketchybar/utils/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
IS_CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
    9[0-9]|100) ICON=$BATTERY100
        ;;
    [6-8][0-9]) ICON=$BATTERY75
        ;;
    [3-5][0-9]) ICON=$BATTERY50
        ;;
    [1-2][0-9]) ICON=$BATTERY25
        ;;
    *) ICON=$BATTERY0
esac

if [ "$IS_CHARGING" != "" ]; then
    ICON=$CHARGING
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
