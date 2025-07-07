local icons = require('icons')
local colors = require('colors')
local settings = require('settings')

local disk = Sbar.add('item', 'disk', {
  position = 'e',
  icon = { string = icons.disk, color = 0xffee99a0 },
  update_freq = 60,
})

disk:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  Sbar.exec('df -H', function(output)
    local disk_line = nil
    for line in output:gmatch('[^\n]+') do
      if line:match('/dev/disk3s5') then
        disk_line = line
        break
      end
    end

    local percent_used = tonumber(disk_line:match('(%d+)%%'))
    disk:set({ label = { string = percent_used .. '%' } })
  end)
end)

Sbar.add('bracket', 'system_stats_bracket', { 'memory', 'cpu', 'gpu', 'disk' }, {
  background = {
    color = colors.tokyo_night_bg,
    border_color = colors.tokyo_night_border,
    border_width = 1,
  },
})
