#!/usr/bin/env bash

STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
    TITLE="$(echo "$INFO" | jq -r '.title' | cut -c 1-20)"
    ARTIST="$(echo "$INFO" | jq -r '.artist' | cut -c 1-20)"
    APP="$(echo "$INFO" | jq -r ".app")"
    MEDIA="$(printf "%s" "$APP: $TITLE  $ARTIST")"
    sketchybar --set "$NAME" label="$MEDIA" drawing=on
else
    sketchybar --set "$NAME" drawing=off
fi
