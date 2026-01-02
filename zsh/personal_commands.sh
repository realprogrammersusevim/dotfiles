# This script file is used to define all of my personal commands.
# It is sourced by the main zshrc file.
# If you want another command simply create a new function

zen() {
  python3 -c "import this"
}

##
# Interactive Find In File search.
# Usage: `fif` or `fif <folder>`.
#
fif() {
  [[ -n $1 ]] && cd "$1" # go to provided folder or noop
  RG_DEFAULT_COMMAND="rg -i -l --hidden"

  selected=$(
    FZF_DEFAULT_COMMAND="rg --files" fzf \
      -m \
      -e \
      --ansi \
      --disabled \
      --reverse \
      --bind "ctrl-a:select-all" \
      --bind "f12:execute-silent:(subl -b {})" \
      --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
      --preview "rg -i --context 10 {q} {} | bat --file-name {} -f --plain -H 11 2>/dev/null"
  )

  [[ -n $selected ]] && nvim "$selected" # open multiple files in editor
}

##
# Interactive Find File search.
# Usage: `ff` or `fif <folder>`.
ff() {
  [[ -n $1 ]] && cd "$1" # go to provided folder or noop
  RG_DEFAULT_COMMAND="rg -i"
  FILES="fd -t f -H"

  selected=$(
    FZF_DEFAULT_COMMAND="fd -t f -H" fzf \
      -m \
      -e \
      --ansi \
      --disabled \
      --reverse \
      --bind "ctrl-a:select-all" \
      --bind "f12:execute-silent:(subl -b {})" \
      --bind "change:reload:$FILES | $RG_DEFAULT_COMMAND {q} || true" \
      --preview "bat {} -f --plain 2>/dev/null"
  )

  [[ -n $selected ]] && nvim "$selected" # open multiple files in editor
}

nvims() {
  items=("personal" "plain" "lazy")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="  Neovim config > " --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "personal" ]]; then
    config=""
  fi

  NVIM_APPNAME=$config nvim "$@"
}

# Flash the screen until a key is pressed
flasher() {
  while true; do
    printf "\\e[?5h"
    sleep 0.1
    printf "\\e[?5l"
    read -r -s -t 1 -k && break
  done
}

# Start the claudex proxy server and run the claude command
claude() {
  local started_proxy=0

  # Check if proxy is already running
  if ! pgrep -f "claudex.main.*--port 8082" > /dev/null; then
    # Start the proxy server in the background (within a subshell so env changes don't leak)
    (
      cd ~/code/claudex \
      && source .venv/bin/activate \
      && python -m claudex.main --host 0.0.0.0 --port 8082 --reload > /dev/null 2>&1
    ) &
    PROXY_PID=$!
    started_proxy=1

    # Give the server a moment to start
    sleep 3
  fi

  # Run the claude command with the proxy
  ANTHROPIC_BASE_URL=http://localhost:8082 DISABLE_PROMPT_CACHING=1 /opt/homebrew/bin/claude "$@"

  # Stop the proxy server if we started it
  if [[ $started_proxy -eq 1 ]] && kill -0 "$PROXY_PID" 2>/dev/null; then
    kill "$PROXY_PID"
  fi
}

function viewtyp() {
    # Check for argument
    if [[ -z "$1" ]]; then
        echo "Usage: viewtyp <filename.typ>" >&2
        return 1
    fi

    local src="$1"
    
    # Verify source existence
    if [[ ! -f "$src" ]]; then
        echo "Error: File '$src' not found." >&2
        return 1
    fi

    # Construct an ephemeral output path.
    # We preserve the basename so the window title in Skim remains identifiable.
    local base_name
    base_name=$(basename "${src%.*}")
    local pdf_dest="${TMPDIR:-/tmp}/${base_name}_view_$(date +%s).pdf"

    # Compile and Open
    if typst compile "$src" "$pdf_dest"; then
        open -a Skim "$pdf_dest"
    else
        echo "Compilation failed." >&2
        return 1
    fi
}
