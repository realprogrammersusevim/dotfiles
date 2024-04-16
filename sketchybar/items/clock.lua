local colors = require('colors')
local settings = require('settings')

local datetime = function()
  -- Get the current date and time formatted as ISO %a, %h %e - %l:%M %p
  return os.date('%a, %b %d - %I:%M %p')
end

local clock = Sbar.add('item', 'clock', {
  position = 'right',
  background = {
    drawing = false,
  },
  update_freq = 1,
})

clock:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  clock:set({ label = datetime() })
end)
