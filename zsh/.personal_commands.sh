#!/bin/sh

# This script file is used to define all of my personal commands.
# It is sourced by the main zshrc file.
# If you want another command simply create a new function

function pynew() {
    if [ "$1" != "" ]; then
        echo "Initializing project $1"
        mkdir -p $1

        # Create the Python files
        touch $1/__init__.py
        touch $1/__main__.py
        echo "print('Hello, world!')" >> $1/__main__.py
        touch $1/requirements.txt

        # Initialize the git repository
        git init $1 >> /dev/null
        touch $1/.gitignore
        echo "**/__pycache__" >> $1/.gitignore

        # Create the virtual environment
        python3 -m venv $1/venv
        source $1/venv/bin/activate
        echo "venv/**" >> $1/.gitignore

        # Create the license file
        touch $1/LICENSE
        YEAR=$(date +%Y)
        echo """MIT License

Copyright (c) $YEAR Jonathan Milligan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the \"Software\"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.""" >> $1/LICENSE

        cd $1
    else
        echo "Usage: pynew <name of project>"
        exit 1
    fi
}

function zen() {
    python3 -c "import this"
}

function snake() {
    # Convert a folder or file to snake case
    if [ "$1" != "" ]; then
        echo $1 | sed -e "s/\([A-Z]\)/-\L\1/g" -e "s/^-//"
    else
        echo "Usage: snake <name>"
        exit 1
    fi
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

# function hacking() {
#     tmux new -s hacking
#     tmux send-keys -t "hacking" "cmatrix"
#     tmux split-window -h
#     tmux send-keys -t "hacking" "pipes.sh"
#     tmux split-window -v
#     tmux send keys -t "hacking" "echo \"Connecting to government mainframe...\""
#     sleep 1
#     tmux send-keys -t "hacking" "echo \"Checking for vulnerabilities...\""
#     sleep 1
#     tmux send-keys -t "hacking" "echo \"Vulnerabilities found!\""
#     sleep 1
#     tmux send-keys -t "hacking" "echo \"Delivering payload...\""
#     sleep 1
#     tmux send-keys -t "hacking" "echo \"Payload delivered!\""
#     sleep 1
#     tmux send-keys -t "hacking" "echo \"Hacking complete!\""
# }
