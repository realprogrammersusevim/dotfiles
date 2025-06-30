source $ZDOTDIR/.zshenv
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
HISTFILE=$ZDOTDIR/.zsh_history
HISTZIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd|eza|z)"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

# Disable blinking cursor in the shell
# Prevent blinking cursor.
function __set_beam_cursor {
    echo -ne '\e[6 q'
}

function __set_block_cursor {
    echo -ne '\e[2 q'
}

function zle-keymap-select {
  case $KEYMAP in
    vicmd) __set_block_cursor;;
    viins|main) __set_beam_cursor;;
  esac
}
zle -N zle-keymap-select

precmd_functions+=(__set_beam_cursor)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

zstyle ':omz:update' frequency 7
zstyle ':omz:update' mode auto
plugins=(
    python
    git
    brew
    sudo
    macos
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug section
zplug "hlissner/zsh-autopair", from:github, defer:2
zplug "marlonrichert/zsh-autocomplete", from:github, defer:2
zplug "MichaelAquilina/zsh-you-should-use" defer:2

# Load plugins
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.config/zsh/personal_commands.sh
source ~/.config/zsh/aliases.sh
source ~/.config/zsh/env.sh

# Zoxide stuff
eval "$(zoxide init zsh)"

source $HOME/.config/broot/launcher/bash/br

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"

# All done
# Show a pretty bonsai tree
cbonsai -p
