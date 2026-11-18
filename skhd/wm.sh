# Shared helpers for the skhd → OmniWM scripts. Sourced, not executed.
# All state lives in OmniWM itself (scratchpad slots and window marks).

export PATH="/opt/homebrew/bin:$PATH"

# Window ids for a bundle id, most recently used first.
# Pass --scratchpad or --no-scratchpad to filter.
wm_windows() {
  local bundle_id=$1 filter=${2:-}
  local select='.'
  case $filter in
    --scratchpad) select='select(.isScratchpad)' ;;
    --no-scratchpad) select='select(.isScratchpad | not)' ;;
  esac
  omniwmctl query windows --bundle-id "$bundle_id" --sort mru \
    --fields id,is-scratchpad --format json |
    jq -r ".result.payload.windows[] | $select | .id"
}

wm_focused_id() {
  omniwmctl query focused-window --format json | jq -r '.result.payload.window.id // empty'
}

wm_active_workspace() {
  omniwmctl query active-workspace --format json | jq -r '.result.payload.workspace.rawName'
}

# Ids of windows with a mark starting with $1, as "<window id> <rest of mark name>".
wm_marked() {
  omniwmctl window mark list --json | jq -r --arg p "$1" \
    '.result.payload.marks[] | select(.name | startswith($p)) | "\(.id) \(.name | ltrimstr($p))"'
}

# Focus the most recent window in the list, or cycle to the least recent one if
# a window from the list is already focused (repeated presses walk through all).
wm_focus_or_cycle() {
  local ids=("$@") focused
  ((${#ids[@]})) || return 1
  focused=$(wm_focused_id)
  if [[ ${ids[0]} == "$focused" ]]; then
    ((${#ids[@]} > 1)) && omniwmctl window focus "${ids[${#ids[@]}-1]}" >/dev/null
  else
    omniwmctl window focus "${ids[0]}" >/dev/null
  fi
  return 0
}

# Wait for a window id for $1 that is not in the newline-separated list $2.
wm_wait_new_window() {
  local bundle_id=$1 before=$2 new_id
  for _ in $(seq 60); do
    new_id=$(comm -13 <(sort <<<"$before") <(wm_windows "$bundle_id" | sort) | head -n 1)
    [[ -n $new_id ]] && { echo "$new_id"; return 0; }
    sleep 0.1
  done
  return 1
}

# Show scratchpad slot $1 holding window $2. When another scratchpad is showing,
# OmniWM's first toggle sometimes only hides that one, so toggle again if needed.
wm_scratchpad_show() {
  for _ in 1 2; do
    omniwmctl command scratchpad toggle "$1" >/dev/null
    for _ in $(seq 10); do
      omniwmctl query windows --window "$2" --fields is-visible --format json |
        jq -e '.result.payload.windows[0].isVisible' >/dev/null && return 0
      sleep 0.05
    done
  done
  return 1
}

# Show scratchpad slot $1 (holding window $2 of app $3) centered on screen.
# OmniWM remembers a floating window's spot, so this is only needed when a
# window first goes into a slot; after that a plain toggle puts it back there.
wm_scratchpad_show_centered() {
  wm_scratchpad_show "$1" "$2"
  sleep 0.3 # let the reveal finish, or it restores the old frame over ours
  wm_center_front_window "$3"
  omniwmctl window focus "$2" >/dev/null
}

# Center an app's front window on the current display at a fixed fraction of the
# usable screen.
# usage: wm_center_front_window <bundle-id> [width-fraction] [height-fraction]
wm_center_front_window() {
  local bundle_id=$1 wf=${2:-0.6} hf=${3:-0.75} geometry
  # OmniWM reports Cocoa coordinates (origin bottom-left of the main display);
  # Accessibility wants top-left, so flip y using the main display's height.
  geometry=$(omniwmctl query displays --fields is-main,is-current,frame,visible-frame --format json |
    jq -r --argjson wf "$wf" --argjson hf "$hf" '
      .result.payload.displays as $d
      | ($d[] | select(.isMain) | .frame.height) as $mainH
      | ($d[] | select(.isCurrent) | .visibleFrame) as $v
      | ($v.width * $wf | floor) as $w | ($v.height * $hf | floor) as $h
      | [($v.x + ($v.width - $w) / 2 | floor),
         ($mainH - ($v.y + ($v.height - $h) / 2) - $h | floor), $w, $h]
      | @tsv')
  read -r x y w h <<<"$geometry"
  [[ -n $h ]] || return 1
  osascript -e "tell application \"System Events\" to tell (first process whose bundle identifier is \"$bundle_id\")
    set win to first window whose subrole is \"AXStandardWindow\"
    set position of win to {$x, $y}
    set size of win to {$w, $h}
  end tell" >/dev/null
}
