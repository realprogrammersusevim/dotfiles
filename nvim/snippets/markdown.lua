return {
  s(
    { trig = 'multmath', dscr = 'Multiline aligned LaTeX equation' },
    { t({ '$$', '\\begin{aligned}', '' }), i(1, 'math'), t({ '', '\\end{aligned}', '$$' }) }
  ),
  s({
    trig = 'fraction',
    desc = 'LaTeX fraction',
  }, {
    t('\\frac{'),
    i(1),
    t('}{'),
    i(2),
    t('}'),
  }),
}
