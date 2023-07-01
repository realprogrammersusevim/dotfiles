#!/bin/sh

PERCENTAGE=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')

sketchybar --set "$NAME" label="${PERCENTAGE}%"
