local icons = require('icons')

local disk = Sbar.add('item', 'disk', {
  position = 'right',
  background = {
    drawing = false,
  },
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
    print('disk usage:', percent_used)
    disk:set({ label = { string = percent_used .. '%' } })
  end)
end)
