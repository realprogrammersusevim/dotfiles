local icons = require('icons')
local colors = require('colors')
local stat_graph = require('helpers.stat_graph')
-- local inspect = require('inspect')

local memory_props = stat_graph.props(icons.memory, colors.green)
memory_props.update_freq = 5
local memory = Sbar.add('graph', 'memory', stat_graph.width, memory_props)

memory:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  Sbar.exec('memory_pressure -Q', function(res, code)
    local percent_used = 100 - tonumber(res:match('(%d+)%%'))
    local color = colors.blue
    if percent_used > 90 then
      color = colors.red
    elseif percent_used > 80 then
      color = colors.orange
    elseif percent_used > 70 then
      color = colors.yellow
    end
    memory:push({ percent_used / 100. })
    memory:set({ label = { string = percent_used .. '%' }, graph = stat_graph.graph_colors(color) })
  end)
end)
