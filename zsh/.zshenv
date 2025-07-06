path+=("$HOME/code/cli-tools/scripts")
path+=("$HOME/.bin")
export MODULAR_HOME="$HOME/.modular"
path+=("$HOME/.modular/pkg/packages.modular.com_mojo/bin")
path+=("$HOME/.local/bin")

# Add Homebrew's executable directory to the front of the PATH
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin:$PATH"

# Language specific path stuff
eval $(/opt/homebrew/bin/luarocks path) # Lua needs to know where my rocks are
source $HOME/.cargo/env # Cargo doing it's Rust stuff

export PATH

export XDG_CONFIG_HOME="$HOME/.config"

export BAT_COLOR="always"
export BAT_STYLE="numbers,changes,snip"
export BAT_THEME="OneHalfDark"
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"
