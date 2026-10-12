local colors = require('colors')
local settings = require('settings')

-- The one background style in the bar: a raised pill wrapped around a group
-- of items, which draw no backgrounds of their own
return function(name, members)
  return Sbar.add('bracket', name, members, {
    background = {
      drawing = true,
      color = colors.island.bg,
      border_color = colors.island.border,
      border_width = 1,
      height = settings.island_height,
      corner_radius = settings.island_height / 2,
    },
  })
end
