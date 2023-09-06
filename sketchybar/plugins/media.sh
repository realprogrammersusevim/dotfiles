#!/usr/bin/env bash

source "$UTILS/functions.sh"

STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
    # TITLE="$(concat "$(echo "$INFO" | jq -r '.title')" 20)"
    TITLE="$(echo "$INFO" | jq -r '.title')"
    # ARTIST="$(concat "$(echo "$INFO" | jq -r '.artist')" 20)"
    ARTIST="$(echo "$INFO" | jq -r '.artist')"
    APP="$(echo "$INFO" | jq -r ".app")"
    MEDIA="$(printf "%s" "$APP: $TITLE  $ARTIST")"
    sketchybar --set "$NAME" label="$MEDIA" drawing=on
else
    sketchybar --set "$NAME" drawing=off
fi
