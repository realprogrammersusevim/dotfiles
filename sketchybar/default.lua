local colors = require('colors')
local settings = require('settings')

Sbar.default({
  updates = 'when_shown',
  label = {
    font = {
      family = settings.font.text,
      style = settings.font.style_map['Semibold'],
      size = 15.0,
    },
    color = colors.label,
    padding_left = 5,
    padding_right = 5,
  },
  padding_left = 2,
  padding_right = 2,
  icon = {
    font = {
      family = settings.font.text,
      style = settings.font.style_map['Regular'],
      size = 17.0,
    },
    padding_left = 5,
    padding_right = 5,
  },
  -- Items draw nothing behind themselves; each group sits on one island
  -- (helpers/island.lua) instead
  background = {
    drawing = false,
  },
  popup = {
    background = {
      color = colors.popup.bg,
      border_color = colors.popup.border,
      border_width = 1,
      corner_radius = 10,
      shadow = { drawing = true },
    },
    blur_radius = 30,
  },
})
