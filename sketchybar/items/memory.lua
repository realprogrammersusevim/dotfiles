local icons = require('icons')
local colors = require('colors')

local memory = Sbar.add('item', 'memory', {
  position = 'right',
  background = {
    drawing = false,
  },
  icon = { string = icons.memory, color = 0xff9ece6a },
  update_freq = 5,
})

memory:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  Sbar.exec('memory_pressure -Q', function(res)
    print('reloaded memory')
    local percent_used = 100 - tonumber(res:match('(%d+)%%'))
    local color = colors.label
    if percent_used > 90 then
      color = colors.red
    elseif percent_used > 80 then
      color = colors.orange
    elseif percent_used > 70 then
      color = colors.yellow
    end
    memory:set({ label = { string = percent_used .. '%', color = color } })
  end)
end)
