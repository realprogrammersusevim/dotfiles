local icons = require('icons')
local colors = require('colors')
-- local inspect = require('inspect')

local memory = Sbar.add('graph', 'memory', 30, {
  position = 'e',
  icon = { string = icons.memory, color = 0xff9ece6a },
  graph = { color = colors.blue },
  update_freq = 5,
})

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
    memory:set({ label = { string = percent_used .. '%' }, graph = { color = color } })
  end)
end)
