#!/usr/bin/env bash

# Extract the numbers from the CPU usage line
NUMS=$(top -l 1 -n 0 | grep "CPU usage:" | grep -o "[0-9]\+.[0-9]\+")
ARR_NUMS=($NUMS) # Convert the string to an array so it can be indexed
# Floating point math has to be done with bc. Use printf as a poor mans math.floor
PERCENTAGE=$(bc <<< "scale=2; ${ARR_NUMS[0]}+${ARR_NUMS[1]}" | xargs printf '%0.f')

sketchybar --set "$NAME" label="${PERCENTAGE}%"
