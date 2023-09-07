#!/usr/bin/env bash

stats=(
    cpu.percent
    memory
    disk
    network
)

hide_stats() {
    args=()
    for item in "${stats[@]}"; do
        args+=(--set "$item" drawing=off)
    done

    sketchybar "${args[@]}" \
        --set separator_right \
        icon="$CHEVRON_RIGHT"
}

show_stats() {
    args=()
    for item in "${stats[@]}"; do
        args+=(--set "$item" drawing=on)
    done

    sketchybar "${args[@]}" \
        --set separator_right \
        icon="$CHEVRON_LEFT"
}

toggle_stats() {
    state=$(sketchybar --query separator_right | jq -r .icon.value)

    case $state in
        "$CHEVRON_RIGHT")
            show_stats
            ;;
        "$CHEVRON_LEFT")
            hide_stats
            ;;
    esac
}

case "$SENDER" in
    "hide_stats")
        hide_stats
        ;;
    "show_stats")
        show_stats
        ;;
    "toggle_stats")
        toggle_stats
        ;;
esac
