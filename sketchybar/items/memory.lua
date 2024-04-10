local icons = require('icons')

local memory = Sbar.add('item', 'memory', {
  position = 'right',
  background = {
    drawing = false,
  },
  icon = { string = icons.memory, color = 0xff9ece6a },
  update_freq = 5,
})

memory:subscribe('forced', 'routine', 'system_woke', function(env)
  Sbar.exec('memory_pressure -Q', function(res)
    local percent_free = tonumber(res:match('(%d+)%%'))
    memory:set({ label = { string = (100 - percent_free) .. '%' } })
  end)
end)
