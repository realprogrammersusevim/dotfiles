source $ZDOTDIR/.zshenv
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

# zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug section
zplug "hlissner/zsh-autopair", from:github, defer:2
zplug "marlonrichert/zsh-autocomplete", from:github, defer:2
zplug "jeffreytse/zsh-vi-mode"

# Load plugins
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.config/zsh/personal_commands.sh
source ~/.config/zsh/aliases.sh

# Zoxide stuff
eval "$(zoxide init zsh)"

source $HOME/.config/broot/launcher/bash/br

# All done
# Show a pretty bonsai tree
cbonsai -p
