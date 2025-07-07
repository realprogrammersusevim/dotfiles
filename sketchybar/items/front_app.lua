local front_app = Sbar.add('item', 'front_app', {
  display = 'active',
  icon = { drawing = false },
  updates = true,
  label = {
    padding_right = 15,
  }
})

front_app:subscribe('front_app_switched', function(env)
  front_app:set({ label = { string = env.INFO } })
end)
