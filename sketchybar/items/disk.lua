local icons = require('icons')
local colors = require('colors')
local settings = require('settings')
local island = require('helpers.island')

local disk = Sbar.add('item', 'disk', {
  position = 'e',
  icon = { string = icons.disk, color = colors.magenta, padding_left = 10 },
  label = {
    font = settings.number_font,
    width = settings.number_width(4) + 5 + 10,
    align = 'right',
    padding_right = 10,
  },
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

island('system_stats_bracket', { 'memory', 'cpu', 'gpu', 'disk' })
