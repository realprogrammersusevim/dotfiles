# Personal commands — MSYS2/Windows port.

zen() {
  python -c "import this"
}

##
# Interactive Find In File search. Usage: `fif` or `fif <folder>`.
fif() {
  [[ -n $1 ]] && cd "$1"
  RG_DEFAULT_COMMAND="rg -i -l --hidden"
  selected=$(
    FZF_DEFAULT_COMMAND="rg --files" fzf \
      -m -e --ansi --disabled --reverse \
      --bind "ctrl-a:select-all" \
      --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
      --preview "rg -i --context 10 {q} {} | bat --file-name {} -f --plain -H 11 2>/dev/null"
  )
  [[ -n $selected ]] && nvim "$selected"
}

##
# Interactive Find File search. Usage: `ff` or `ff <folder>`.
ff() {
  [[ -n $1 ]] && cd "$1"
  RG_DEFAULT_COMMAND="rg -i"
  FILES="fd -t f -H"
  selected=$(
    FZF_DEFAULT_COMMAND="fd -t f -H" fzf \
      -m -e --ansi --disabled --reverse \
      --bind "ctrl-a:select-all" \
      --bind "change:reload:$FILES | $RG_DEFAULT_COMMAND {q} || true" \
      --preview "bat {} -f --plain 2>/dev/null"
  )
  [[ -n $selected ]] && nvim "$selected"
}

# Switch between Neovim configs via NVIM_APPNAME.
nvims() {
  items=("personal" "plain" "lazy")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="  Neovim config > " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"; return 0
  elif [[ $config == "personal" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim "$@"
}
