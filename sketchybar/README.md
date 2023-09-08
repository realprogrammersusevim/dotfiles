# SketchyBar

## What is this?

SketchyBar is a status bar for macOS with each of the widgets customized through
shell scripts.

## How do I use it?

Install [sketchybar](https://github.com/FelixKratz/SketchyBar) and copy these
configs to `~/.config/sketchybar/`. You may need to install some dependencies
for the scripts to work. Some of the commonly run plugins are written in Rust
instead of shell script. Build them with `cargo build --release` and copy the
resulting binaries to the `plugins` directory.
