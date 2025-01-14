local colors = require('colors')

Sbar.default({
  updates = 'when_shown',
  label = {
    font = 'SF Pro:Bold:14.0',
    color = colors.label,
    padding_left = 5,
    padding_right = 5,
  },
  padding_left = 2,
  padding_right = 2,
  icon = {
    font = 'SF Pro:Bold:17.0',
    padding_left = 5,
    padding_right = 5,
  },
  background = {
    color = colors.bar.bg,
    border_color = colors.white,
    border_width = 1,
    corner_radius = 8,
    padding_right = 2,
    padding_left = 2,
    height = 25,
    drawing = true,
  },
})
