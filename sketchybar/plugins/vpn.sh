#!/bin/sh

if [ "$(mullvad status | rg "^Connected")" ]; then
    ICON="locked"
    COLOR=0xffa6da95
else
    ICON="unlocked"
    COLOR=0xffed8796
fi

sketchybar --set vpn icon="$ICON" icon.color="$COLOR"
