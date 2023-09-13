return {
  s(
    { trig = 'multmath', dscr = 'Multiline aligned LaTeX equation' },
    { t({ '$$', '\\begin{aligned}', '' }), i(1, 'math'), t({ '', '\\end{aligned}', '$$' }) }
  ),
}
