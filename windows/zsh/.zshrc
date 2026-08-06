# MSYS2 (UCRT64) zsh config. Windows port of the macOS .zshrc.

# --- PATH ---------------------------------------------------------------
# Set here (not .zshenv) because MSYS2's /etc/profile rebuilds PATH after
# .zshenv. The actual additions live in ../shell/path.sh (shared with bash so
# Claude Code's Bash tool gets the same dotnet/node/cargo/pnpm PATH). That file
# is POSIX and idempotent, so re-sourcing via `exec zsh` won't duplicate entries.
_dotfiles_shell="$HOME/code/dotfiles/windows/shell"
[[ -f "$_dotfiles_shell/path.sh" ]] && source "$_dotfiles_shell/path.sh"
unset _dotfiles_shell
typeset -gU path   # dedupe (zsh-side belt-and-suspenders)

# --- History ------------------------------------------------------------
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit|eza|z)"

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# --- Cursor shape per vi mode ------------------------------------------
function __set_beam_cursor { echo -ne '\e[6 q'; }
function __set_block_cursor { echo -ne '\e[2 q'; }
function zle-keymap-select {
  case $KEYMAP in
    vicmd) __set_block_cursor;;
    viins|main) __set_beam_cursor;;
  esac
}
zle -N zle-keymap-select
precmd_functions+=(__set_beam_cursor)

DISABLE_AUTO_UPDATE="true"

# --- Plugins (antidote) -------------------------------------------------
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins
[[ -f "$HOME/.antidote/antidote.zsh" ]] && source "$HOME/.antidote/antidote.zsh"
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
source ${zsh_plugins}.zsh

# --- zsh-autosuggestions: force synchronous (NO async) ------------------
# zsh-autosuggestions defaults to async, which forks a zpty subprocess on
# every keystroke to search history. Cygwin/MSYS2 fork() costs ~40ms, so
# async makes the line repaint on every key (cursor visibly jumps back and
# forth). Synchronous is ~600x faster here (in-process, ~0.1ms) because it
# skips the fork. The plugin enables async merely by *setting* the var
# (line: typeset -g ZSH_AUTOSUGGEST_USE_ASYNC=), so unset it after sourcing.
unset ZSH_AUTOSUGGEST_USE_ASYNC

# --- Completion menu keys ----------------------------------------------
bindkey '^I' menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# --- fzf (pacman: mingw-w64-ucrt-x86_64-fzf) ---------------------------
if [[ -d /ucrt64/share/fzf ]]; then
  source /ucrt64/share/fzf/key-bindings.zsh
  source /ucrt64/share/fzf/completion.zsh
fi

# --- Personal config ----------------------------------------------------
source $ZDOTDIR/aliases.sh
source $ZDOTDIR/personal_commands.sh

# --- zoxide -------------------------------------------------------------
eval "$(zoxide init zsh)"

# --- starship -----------------------------------------------------------
eval "$(starship init zsh)"

# --- Taskwarrior: list pending tasks on shell startup -------------------
# Guarded so a shell without taskwarrior installed doesn't error out.
if command -v task >/dev/null 2>&1; then
  task next 2>/dev/null
fi
