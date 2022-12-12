#!/bin/sh

# This script file is used to define all of my personal commands.
# It is sourced by the main zshrc file.
# If you want another command simply create a new function

function zen() {
    python3 -c "import this"
}

# fif() {
#     if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
#     local file
#     file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
#     }
# grep --line-buffered --color=never -r "" * | fzf

# with ag - respects .agignore and .gitignore
# ag --nobreak --nonumbers --noheading . | fzf

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

##
# Interactive search.
# Usage: `ff` or `ff <folder>`.
#
ff() {
    [[ -n $1 ]] && cd $1 # go to provided folder or noop
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
            --preview "rg -i --pretty --context 10 {q} {}" | cut -d":" -f1,2
    )

    [[ -n $selected ]] && nvim $selected # open multiple files in editor
}
