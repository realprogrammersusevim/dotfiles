local colors = require('colors')
local font = require('helpers.default_font')

local number_font = {
  family = font.numbers,
  style = font.style_map['Semibold'],
  -- Mono glyphs run wide, so 14 reads about as large as SF Pro 15
  size = 14.0,
}

return {
  bar = {
    height = 32,
    position = 'top',
    sticky = 'off',
    y_offset = 5,
    color = colors.transparent,
    notch_width = 200,
    margin = 10,
    blur_radius = 0,
  },
  paddings = 3,
  island_height = 28,
  group_paddings = 5,

  icons = 'sf-symbols', -- alternatively available: NerdFont

  -- This is a font configuration for SF Pro and SF Mono (installed manually)
  font = font,

  -- Every number in the bar uses this, so digits line up and share a weight
  number_font = number_font,

  -- Width of `chars` glyphs of number_font. Labels whose value changes get a
  -- fixed width from this so their island never resizes (SF Mono advances
  -- 0.6125em per glyph; label.width includes the label's padding, so add it)
  number_width = function(chars)
    return math.ceil(chars * number_font.size * 0.6125)
  end,

  -- Alternatively, this is a font config for JetBrainsMono Nerd Font
  -- font = {
  --   text = "JetBrainsMono Nerd Font", -- Used for text
  --   numbers = "JetBrainsMono Nerd Font", -- Used for numbers
  --   style_map = {
  --     ["Regular"] = "Regular",
  --     ["Semibold"] = "Medium",
  --     ["Bold"] = "SemiBold",
  --     ["Heavy"] = "Bold",
  --     ["Black"] = "ExtraBold",
  --   },
  -- },
}
