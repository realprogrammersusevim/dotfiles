local datetime = function()
  -- Get the current date and time formatted as ISO %a, %h %e - %l:%M %p
  return os.date('%a %b %d %H:%M')
end

local clock = Sbar.add('item', 'clock', {
  position = 'right',
  update_freq = 1,
})

clock:subscribe({ 'forced', 'routine', 'system_woke' }, function(env)
  clock:set({ label = datetime() })
end)
