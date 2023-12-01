#!/bin/sh

# This script file is used to define all of my personal commands.
# It is sourced by the main zshrc file.
# If you want another command simply create a new function

zen() {
    python3 -c "import this"
}

##
# Interactive Find In File search.
# Usage: `fif` or `fif <folder>`.
#
fif() {
    [[ -n $1 ]] && cd "$1" # go to provided folder or noop
    RG_DEFAULT_COMMAND="rg -i -l --hidden --no-ignore-vcs"

    selected=$(
        FZF_DEFAULT_COMMAND="rg --files" fzf \
            -m \
            -e \
            --ansi \
            --disabled \
            --reverse \
            --bind "ctrl-a:select-all" \
            --bind "f12:execute-silent:(subl -b {})" \
            --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
            --preview "rg -i --context 10 {q} {} | bat --file-name {} -f --plain -H 11 2>/dev/null"
    )

    [[ -n $selected ]] && nvim "$selected" # open multiple files in editor
}

##
# Interactive Find File search.
# Usage: `ff` or `fif <folder>`.
ff() {
    [[ -n $1 ]] && cd "$1" # go to provided folder or noop
    RG_DEFAULT_COMMAND="rg -i"
    FILES="fd -t f -H"

    selected=$(
        FZF_DEFAULT_COMMAND="fd -t f -H" fzf \
            -m \
            -e \
            --ansi \
            --disabled \
            --reverse \
            --bind "ctrl-a:select-all" \
            --bind "f12:execute-silent:(subl -b {})" \
            --bind "change:reload:$FILES | $RG_DEFAULT_COMMAND {q} || true" \
            --preview "bat {} -f --plain 2>/dev/null"
    )

    [[ -n $selected ]] && nvim "$selected" # open multiple files in editor
}

nvims() {
    items=("personal" "plain" "lazy")
    config=$(printf "%s\n" "${items[@]}" | /opt/homebrew/bin/fzf --prompt="  Neovim config > " --height=~50% --layout=reverse --border --exit-0)

    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif  [[ $config == "personal" ]]; then
        config=""
    fi

    NVIM_APPNAME=$config nvim "$@"
}

# Change the kitty theme
theme() {
    items=("night" "day" "moon" "storm")
    theme=$(printf "%s\n" "${items[@]}" | /opt/homebrew/bin/fzf --prompt=" Theme > " --height=~50% --layout=reverse --border --exit-0) # Use fzf as a theme picker
    cp ~/.config/kitty/themes/tokyonight_"$theme".conf ~/.config/kitty/current.conf # The current.conf is included in the main kitty.conf
    kill -SIGUSR1 $(pgrep -a kitty) # Sending the SIGUSR1 signal to the kitty process reloads the config
}
