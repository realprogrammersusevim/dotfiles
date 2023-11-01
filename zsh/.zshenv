# Add Homebrew's executable directory to the front of the PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:~/.dotnet/tools:/Library/Apple/usr/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands"
export PATH="/opt/homebrew/sbin:$PATH"

export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export PATH="$HOME/Library/Python/3.10/bin:$PATH"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="$PATH:$HOME/code/cli-tools/scripts"
export PATH=$PATH:"$HOME/.bin"
export MODULAR_HOME="$HOME/.modular"
export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="$PATH:/Applications/Safari"
export PATH="$PATH:$HOME/.bin"

# Make sure Lua is aware of my installed Luarocks
eval $(luarocks path)

export XDG_CONFIG_HOME="$HOME/.config"

BAT_COLOR="always"
BAT_STYLE="numbers"
BAT_THEME="OneHalfDark"
. "$HOME/.cargo/env"
EDITOR="nvim"
VISUAL="nvim"
GIT_EDITOR="nvim"
