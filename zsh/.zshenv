path+=("$HOME/code/cli-tools/scripts")
path+=("$HOME/.bin")
export MODULAR_HOME="$HOME/.modular"
path+=("$HOME/.modular/pkg/packages.modular.com_mojo/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.dotnet/tools") # /etc/paths.d/dotnet-cli-tools has an unexpanded ~, so it never resolves

# Add Homebrew's executable directory to the front of the PATH
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin:$PATH"

# Language specific path stuff
# Lua needs to know where my rocks are. `luarocks path` costs ~85ms and .zshenv runs for
# every zsh (scripts too), so cache it and regenerate only when luarocks is upgraded.
_luarocks_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/luarocks-path.zsh"
if [[ ! -s $_luarocks_cache || /opt/homebrew/bin/luarocks -nt $_luarocks_cache ]]; then
  mkdir -p ${_luarocks_cache:h}
  /opt/homebrew/bin/luarocks path | grep -E '^export LUA_C?PATH=' >| $_luarocks_cache
fi
source $_luarocks_cache
unset _luarocks_cache
path+=("$HOME/.luarocks/bin")
source $HOME/.cargo/env # Cargo doing it's Rust stuff

export PATH

export XDG_CONFIG_HOME="$HOME/.config"

export BAT_COLOR="always"
export BAT_STYLE="numbers,changes,snip"
export BAT_THEME="OneHalfDark"
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000
