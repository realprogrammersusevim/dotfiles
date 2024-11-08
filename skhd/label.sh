read -r -d '' applescriptCode <<'EOF'
   set dialogText to text returned of (display dialog "Label" default answer "")
   return dialogText
EOF

label=$(osascript -e "$applescriptCode")
curr_space=$(yabai -m query --spaces --space | jq '.index')

yabai -m space "$curr_space" --label "$label"
