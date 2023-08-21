#!/usr/bin/env sh

sketchybar -m --add item btc right \
    --set btc icon= \
    --set btc update_freq=20 \
    --set btc script="$PLUGINS/btc.py"
