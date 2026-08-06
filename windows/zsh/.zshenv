# ~/.zshenv equivalent for MSYS2 (UCRT64). Sourced via ZDOTDIR.
# Windows/MSYS2 port of the macOS dotfiles.

export XDG_CONFIG_HOME="$HOME/.config"

# --- antidote (zsh plugin manager) -------------------------------------
# On MSYS2/Cygwin antidote can't resolve its own home dir and falls back to
# a broken "/antidote" path (cygpath: can't convert empty path), which makes
# the generated .zsh_plugins.zsh point at nonexistent dirs -> all plugins,
# including fast-syntax-highlighting, silently fail to load. Set it
# explicitly so the bundle resolves to real paths.
export ANTIDOTE_HOME="$HOME/.cache/antidote"

# NOTE: PATH is configured in .zshrc, NOT here. MSYS2's /etc/profile runs
# (via /etc/zprofile) AFTER .zshenv and rebuilds PATH from scratch, so any
# additions here would be wiped. .zshrc runs after the profile.

# --- Shared environment -------------------------------------------------
# Shell-agnostic env vars live in ../shell/env.sh so bash (Claude Code's Bash
# tool) and zsh stay in sync. zsh-only env (ZDOTDIR, ANTIDOTE_HOME, XDG) is set
# above. Editor, bat, TLS/CA bundle, and GOPATH come from the shared file.
_dotfiles_shell="$HOME/code/dotfiles/windows/shell"
[[ -f "$_dotfiles_shell/env.sh" ]] && source "$_dotfiles_shell/env.sh"
unset _dotfiles_shell
