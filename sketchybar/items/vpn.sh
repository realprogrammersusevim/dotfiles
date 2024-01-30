#!/usr/bin/env bash

# other=(
#     background.border_color=0xff414868
#     background.border_width=2
# )

sketchybar --add alias "Mullvad VPN" right \
    --set "Mullvad VPN" alias.scale=0.9    \
    alias.update_freq=5                    \
    background.drawing=off                 \
    click_script="open -a Mullvad\ VPN"    \
    # --add bracket other "Mullvad VPN" volume wifi clock \
    # --set other "${other[@]}"
