# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

zstyle ':omz:update' mode auto      # update automatically without asking
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

source ~/.config/zsh/aliases.sh

# zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug section
zplug "hlissner/zsh-autopair", from:github, defer:2
zplug "marlonrichert/zsh-autocomplete", from:github, defer:2
zplug "jeffreytse/zsh-vi-mode"

# Load plugins
zplug load

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.cargo/env

source $HOME/.config/zsh/personal_commands.sh

# Zoxide stuff
eval "$(zoxide init zsh)"

source $HOME/.config/broot/launcher/bash/br

source $HOME/.config/broot/launcher/bash/br

# All done
# Show a pretty bonsai tree
cbonsai -p
