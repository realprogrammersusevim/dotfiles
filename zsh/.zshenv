path+=("/opt/homebrew/opt/python@3.10/bin")
path+=("$HOME/Library/Python/3.10/bin")
path+=("/opt/homebrew/opt/node@16/bin")
path+=("$HOME/code/cli-tools/scripts")
path+=("$HOME/.bin")
export MODULAR_HOME="$HOME/.modular"
path+=("$HOME/.modular/pkg/packages.modular.com_mojo/bin")

# Add Homebrew's executable directory to the front of the PATH
path+=("/opt/homebrew/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin")
path+=("/opt/homebrew/sbin")

# Language specific path stuff
eval $(/opt/homebrew/bin/luarocks path) # Lua needs to know where my rocks are
source $HOME/.cargo/env # Cargo doing it's Rust stuff

export PATH

export PATH=/opt/homebrew/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"

export BAT_COLOR="always"
export BAT_STYLE="numbers"
export BAT_THEME="OneHalfDark"
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"
