#!/usr/bin/env bash
# Claude Code session states for the sketchybar `claude_agents` item.
#
#   claude_agents.sh hook        Claude Code hook: reads the event JSON on stdin
#   claude_agents.sh render      counts line, then one line per session
#   claude_agents.sh focus <id>  focus the Ghostty terminal running a session
#   claude_agents.sh seen        a finished session in the focused terminal goes idle
#
# One file per session in $STATE, a single tab-separated line:
#   state  since  pid  tty  cwd
# States: running, waiting (needs you), done (finished, not looked at yet), idle.
export PATH="/opt/homebrew/bin:/usr/bin:/bin"

STATE="${XDG_STATE_HOME:-$HOME/.local/state}/claude-agents"
mkdir -p "$STATE"

# Tools that stop and wait on you even though no permission prompt fires
ASKS_YOU='^(AskUserQuestion|ExitPlanMode)$'

# The claude process above us, as "pid tty". Hooks run in a shell it spawned.
claude_proc() {
  local pid=$PPID ppid tty comm
  for _ in 1 2 3 4 5 6; do
    read -r ppid tty comm < <(ps -o ppid=,tty=,comm= -p "$pid") || return 1
    [[ ${comm##*/} == claude ]] && { echo "$pid $tty"; return 0; }
    pid=$ppid
    ((pid > 1)) || return 1
  done
  return 1
}

set_state() { # sid new_state cwd
  local f="$STATE/$1" old="" since pid tty
  [[ -f $f ]] && IFS=$'\t' read -r old since pid tty _ <"$f"
  [[ $old == "$2" ]] && return 1
  if [[ -z $pid ]]; then
    read -r pid tty < <(claude_proc) || { pid=0; tty='??'; }
  fi
  printf '%s\t%s\t%s\t%s\t%s\n' "$2" "$(date +%s)" "$pid" "$tty" "$3" >"$f.tmp" && mv "$f.tmp" "$f"
}

hook() {
  local event sid cwd tool ntype current=""
  # \x1f, not tabs: read collapses runs of whitespace IFS, shifting empty fields
  IFS=$'\x1f' read -r event sid cwd tool ntype < <(
    jq -r '[.hook_event_name, .session_id, .cwd, (.tool_name // ""), (.notification_type // "")] | join("\u001f")'
  )
  [[ -n $sid ]] || return
  [[ -f $STATE/$sid ]] && current=$(cut -f1 "$STATE/$sid")

  local next=""
  case $event in
    SessionStart) next=idle ;;
    UserPromptSubmit) next=running ;;
    PermissionRequest) next=waiting ;;
    Notification)
      [[ $ntype == permission_prompt || $ntype == elicitation_dialog ]] && next=waiting ;;
    PreToolUse)
      [[ $tool =~ $ASKS_YOU ]] && next=waiting ;;
    PostToolUse | PostToolUseFailure)
      # Back to work once the prompt you were asked is answered
      [[ $current == waiting ]] && next=running ;;
    Stop) next=done ;;
    SessionEnd)
      rm -f "$STATE/$sid"
      sketchybar --trigger claude_agents >/dev/null 2>&1
      return ;;
  esac
  [[ -n $next ]] && set_state "$sid" "$next" "$cwd" &&
    sketchybar --trigger claude_agents >/dev/null 2>&1
}

# First line: "waiting running done idle". Then "sid|state|minutes|project".
# Sessions whose claude process is gone (crash, killed window) are dropped.
render() {
  local now w=0 r=0 d=0 i=0 rows="" f state since pid tty cwd
  now=$(date +%s)
  for f in "$STATE"/*; do
    [[ -f $f && $f != *.tmp ]] || continue
    IFS=$'\t' read -r state since pid tty cwd <"$f"
    if ((pid > 0)) && ! kill -0 "$pid" 2>/dev/null; then
      rm -f "$f"; continue
    fi
    case $state in
      waiting) ((w++)) ;; running) ((r++)) ;; done) ((d++)) ;; *) ((i++)) ;;
    esac
    rows+="${f##*/}|$state|$(((now - since) / 60))|${cwd/#$HOME/~}"$'\n'
  done
  echo "$w $r $d $i"
  # Needs-you first, then working, finished, idle; newest first within each
  printf '%s' "$rows" | awk -F'|' '
    { o = ($2=="waiting") ? 0 : ($2=="running") ? 1 : ($2=="done") ? 2 : 3
      print o "|" $3 "|" $0 }' | sort -t'|' -k1,1n -k2,2n | cut -d'|' -f3-
}

focus() {
  local tty
  [[ -f $STATE/$1 ]] || return 1
  tty=$(cut -f4 "$STATE/$1")
  [[ $tty == ttys* ]] || return 1
  osascript - "/dev/$tty" <<'EOF' >/dev/null
on run argv
  tell application "Ghostty"
    repeat with w in windows
      repeat with t in tabs of w
        repeat with term in terminals of t
          if tty of term is item 1 of argv then
            focus term
            return
          end if
        end repeat
      end repeat
    end repeat
  end tell
end run
EOF
}

seen() {
  local tty f
  tty=$(osascript -e 'tell application "Ghostty"
    if frontmost then return tty of focused terminal of selected tab of front window
  end tell' 2>/dev/null) || return
  [[ -n $tty ]] || return
  for f in "$STATE"/*; do
    [[ -f $f && $f != *.tmp ]] || continue
    IFS=$'\t' read -r state since pid ftty cwd <"$f"
    if [[ $state == done && /dev/$ftty == "$tty" ]]; then
      set_state "${f##*/}" idle "$cwd" && sketchybar --trigger claude_agents >/dev/null 2>&1
    fi
  done
}

case ${1:-} in
  hook) hook ;;
  render) render ;;
  focus) focus "$2" ;;
  seen) seen ;;
  *) echo "usage: ${0##*/} hook|render|focus <session>|seen" >&2; exit 2 ;;
esac
exit 0
