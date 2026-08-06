# Shell-agnostic PATH setup (POSIX sh).
# Sourced by BOTH zsh (.zshrc) and bash (.bashrc), AFTER MSYS2's /etc/profile
# has rebuilt PATH — otherwise these additions get wiped.
#
# Uses a helper that prepends/appends only if the dir isn't already present,
# so re-sourcing (e.g. `exec zsh`) never duplicates entries and works in plain
# sh without zsh's `typeset -gU path`.

_prepend_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}
_append_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

# --- Prepended (highest priority, reverse order) ------------------------
# ucrt64/bin: rg, fd, fzf, bat etc. live here. MSYS2's default profile PATH
# only carries mingw64, so prepend ucrt64 or ripgrep/fd don't resolve in bash.
_prepend_path "/c/msys64/ucrt64/bin"
# Git for Windows FIRST: lazygit/delta/nvim git plugins are Windows-native and
# need git to emit Windows paths (C:/...); MSYS2 git emits /c/... and crashes
# lazygit on chdir. cmd/ holds only git frontends, so it won't shadow ls/sed.
_prepend_path "/c/Program Files/Git/cmd"
# nvm-for-windows' active-version junction must beat /ucrt64/bin's stray
# node.exe. The junction follows `nvm use`, so node stays per-project switchable.
_prepend_path "/c/nvm4w/nodejs"

# --- Appended (lower priority) -----------------------------------------
_append_path "/c/Program Files/Neovim/bin"
_append_path "$HOME/AppData/Local/Microsoft/WinGet/Links"
_append_path "$HOME/AppData/Local/Microsoft/WinGet/Packages/JesseDuffield.lazygit_Microsoft.Winget.Source_8wekyb3d8bbwe"
# Databricks CLI: winget installs the exe in its package dir but never adds a
# shim to WinGet/Links, so it must be listed explicitly.
_append_path "$HOME/AppData/Local/Microsoft/WinGet/Packages/Databricks.DatabricksCLI_Microsoft.Winget.Source_8wekyb3d8bbwe"
_append_path "$HOME/.local/bin"
_append_path "$HOME/.cargo/bin"
_append_path "$HOME/go/bin"
# .NET SDK: installed under Program Files but MSYS2's /etc/profile rebuilds
# PATH and drops it, so `dotnet` (build/test for BTNet) is otherwise unfound.
_append_path "/c/Program Files/dotnet"
# pnpm global bin (corepack-managed pnpm installs globals here).
_append_path "$HOME/AppData/Local/pnpm"
# Docker Desktop CLI: its installer adds resources/bin to the Windows system
# PATH, but MSYS2's /etc/profile rebuilds PATH and drops it, so `docker`/
# `docker-compose` are otherwise unfound.
_append_path "/c/Program Files/Docker/Docker/resources/bin"
# sqlcmd (ODBC Client SDK tools): richgate.ps1 / databaseupdate_v4.ps1 shell out
# to sqlcmd for DB migrations. It's in the Windows User PATH but MSYS2's
# /etc/profile rebuilds PATH and drops it; worse, databaseupdate_v4.ps1 reports
# a missing sqlcmd as success and silently skips every migration.
_append_path "/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn"
# Azure CLI: on the machine PATH but not the user PATH, so MSYS2's /etc/profile
# rebuild drops it. The ADO MCP server authenticates via AzureCliCredential,
# which shells out to bare `az` and reports a missing binary as "Azure CLI could
# not be found ... use 'az login'" even when the login session is healthy.
_append_path "/c/Program Files/Microsoft SDKs/Azure/CLI2/wbin"

export PATH
unset -f _prepend_path _append_path
