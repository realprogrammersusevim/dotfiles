# Shell-agnostic environment variables (POSIX sh).
# Sourced by BOTH zsh (.zshenv) and bash (.bashrc) so every shell — including
# Claude Code's MSYS2 bash — sees the same environment. Keep this file free of
# zsh/bash-only syntax. Interactive-only and shell-specific bits stay in the
# respective rc files.

# --- Editor -------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

# --- bat ----------------------------------------------------------------
export BAT_STYLE="numbers,changes,snip"
export BAT_THEME="OneHalfDark"

# --- TLS / corporate proxy ---------------------------------------------
# BTNet does TLS inspection. MSYS2's OpenSSL-based tools (git, curl, wget,
# pip) need a PEM bundle exported from the Windows cert store. Git for
# Windows uses schannel and ignores this, but MSYS2 tools do not.
export SSL_CERT_FILE="$HOME/ca-bundle.crt"
export GIT_SSL_CAINFO="$HOME/ca-bundle.crt"
export REQUESTS_CA_BUNDLE="$HOME/ca-bundle.crt"
export CURL_CA_BUNDLE="$HOME/ca-bundle.crt"

# --- Go -----------------------------------------------------------------
export GOPATH="$HOME/go"
