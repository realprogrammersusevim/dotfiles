local colors = require('colors')

Sbar.bar({
  height = 27,
  position = 'top',
  sticky = 'off',
  y_offset = 5,
  color = colors.bar.bg,
  notch_width = 200,
  corner_radius = 10,
  margin = 10,
})
