local icons = require('icons')
local colors = require('colors')

local disk = Sbar.add('item', 'disk', {
  position = 'e',
  icon = { string = icons.disk, color = 0xffee99a0 },
  update_freq = 60,
})

disk:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  Sbar.exec('df -H /System/Volumes/Data', function(output)
    local disk_line = nil
    for line in output:gmatch('[^\n]+') do
      if line:match('/System/Volumes/Data$') then
        disk_line = line
        break
      end
    end

    if not disk_line then
      return
    end

    local percent_used = disk_line:match('(%d+)%%')
    if not percent_used then
      return
    end

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
