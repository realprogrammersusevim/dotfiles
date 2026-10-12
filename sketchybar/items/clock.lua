local colors = require('colors')
local settings = require('settings')

-- Date as the quieter icon, time as the label. Both use the number font so
-- they share a baseline, and both are fixed width so the island never shifts
local clock = Sbar.add('item', 'clock', {
  position = 'right',
  update_freq = 1,
  icon = {
    color = colors.fg_dark,
    font = settings.number_font,
    width = settings.number_width(10) + 4,
    align = 'right',
    padding_left = 4,
    padding_right = 0,
  },
  label = {
    color = colors.white,
    font = settings.number_font,
    width = settings.number_width(5) + 9 + 12,
    align = 'right',
    padding_left = 9,
    padding_right = 12,
  },
})

clock:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  clock:set({
    icon = os.date('%a %b %d'),
    label = os.date('%H:%M'),
  })
end)
