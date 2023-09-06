#!/usr/bin/env bash

concat() {
    STRING="$1"
    LEN="$2"

    if [[ "${#STRING}" -gt $LEN ]]; then
        printf '%s' "$(echo "$STRING" | cut -c 1-"$LEN")…"
    else
        printf '%s' "$STRING"
    fi
}
