# Aliases — MSYS2/Windows port.

alias activate="source venv/Scripts/activate"   # Windows venv layout
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias ls="eza --all --long --git --header --icons"
alias cd="z"
alias bt="builtin cd /c/repos/BTNet"
alias lg="lazygit"
alias src="exec zsh"
alias n="nvim"
alias rg="rg --hidden"
help() {
  "$@" --help 2>&1 | bat --plain --language=help
}

# pandoc (install with: pacman -S mingw-w64-ucrt-x86_64-pandoc)
alias pd="pandoc"
alias pddm="pandoc -f docx -t markdown --markdown-headings atx"
alias pdmh="pandoc -f markdown -t html"
alias pdmd="pandoc -f markdown -t docx"
alias pdmp="pandoc -f markdown -t pdf"

# On MSYS2, GNU sed/time are unsuffixed — no gsed/gtime needed.
alias :q="exit"
alias exe="chmod +x"

alias cr="cargo run"
alias crr="cargo run --release"
alias cb="cargo build"
alias cbr="cargo build --release"
alias ccl="cargo clean"
alias ca="cargo add"
alias crm="cargo remove"
alias cbn="cargo bench"
alias ct="cargo test"
alias cf="cargo fmt"
alias cff="cargo fix"

# vit: the taskwarrior TUI. The Rust taskwarrior-tui is a native Windows console
# app that mintty (MSYS2's pre-ConPTY pty) can't host — no input without winpty,
# garbled output with it. vit is a Python/urwid app running on MSYS2's own Python,
# so it speaks mintty's pty natively. Installed in a dedicated msys venv (its bin/
# vit is a shebang script, so invoke via the venv python explicitly).
alias tt="/c/Users/jonathan.milligan/.local/venvs/vit/bin/python3.exe /c/Users/jonathan.milligan/.local/venvs/vit/bin/vit"

# Open a file/dir with the Windows default handler (macOS `open` equivalent)
alias open="start"
