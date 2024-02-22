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
  s({ trig = 'span_table', dscr = 'Spanish form table' }, {
    t({ '| Singular | Plural |', '| - | - |', '| ' }),
    i(1, 'yo'),
    t(' | '),
    i(2, 'nosotros'),
    t({ ' |', '| ' }),
    i(3, 'tú'),
    t(' | '),
    i(4, 'vosotros'),
    t({ ' |', '| ' }),
    i(5, 'él/ella/usted'),
    t(' | '),
    i(6, 'ellos/ellas/ustedes'),
    t(' |'),
  }),
}
