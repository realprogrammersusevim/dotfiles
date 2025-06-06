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
