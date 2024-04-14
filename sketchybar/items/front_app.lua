local front_app = Sbar.add('item', 'front_app', {
  display = 'active',
  icon = { drawing = false },
  updates = true,
})

front_app:subscribe('front_app_switched', function(env)
  front_app:set({ label = { string = env.INFO } })
end)
