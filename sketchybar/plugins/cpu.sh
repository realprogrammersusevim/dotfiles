#!/bin/sh

PERCENTAGE=$(ps -A -o %cpu | awk '{s+=$1} END {print s}' | xargs printf '%0.f')

sketchybar --set "$NAME" label="${PERCENTAGE}%"
