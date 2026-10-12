local colors = require('colors')
local settings = require('settings')

-- Shared look for the cpu/gpu/memory graphs: the load history fills the item
-- as a faint area chart and the percentage sits on top of it
local M = {}

-- Room for '100%' over the graph, plus a little history to its left
M.width = 48

-- Line and fill for a graph drawn in `color`
function M.graph_colors(color)
  return {
    color = colors.with_alpha(color, 0.7),
    fill_color = colors.with_alpha(color, 0.2),
  }
end

function M.props(icon, icon_color)
  return {
    position = 'e',
    icon = {
      string = icon,
      color = icon_color,
      padding_left = 10,
      padding_right = 4,
    },
    graph = M.graph_colors(colors.blue),
    label = {
      string = '??%',
      font = settings.number_font,
      -- Zero width + right align draws the text leftwards over the graph
      width = 0,
      align = 'right',
      padding_right = 2,
    },
    -- The graph is drawn into the background's frame, so it must be on
    background = {
      drawing = true,
      color = colors.transparent,
      height = settings.island_height - 8,
    },
    padding_right = 6,
  }
end

return M
