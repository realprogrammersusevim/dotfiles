local icons = require('icons')
local colors = require('colors')

local media_cover = Sbar.add('item', {
  position = 'q',
  background = {
    image = {
      string = 'media.artwork',
      scale = 0.85,
    },
    color = colors.transparent,
    padding_right = 8,
  },
  label = { drawing = false },
  icon = { drawing = false },
  drawing = false,
  updates = true,
  popup = {
    align = 'center',
    horizontal = true,
  },
})

local media_artist = Sbar.add('item', {
  position = 'q',
  drawing = false,
  icon = { drawing = false },
  label = {
    max_chars = 18,
  },
  background = {
    drawing = false,
  },
})

local media_title = Sbar.add('item', {
  position = 'q',
  drawing = false,
  icon = { drawing = false },
  label = {
    max_chars = 16,
  },
  background = {
    drawing = false,
  },
})

Sbar.add('item', {
  position = 'popup.' .. media_cover.name,
  icon = { string = icons.media.back },
  label = { drawing = false },
  click_script = 'nowplaying-cli previous',
})
Sbar.add('item', {
  position = 'popup.' .. media_cover.name,
  icon = { string = icons.media.play_pause },
  label = { drawing = false },
  click_script = 'nowplaying-cli togglePlayPause',
})
Sbar.add('item', {
  position = 'popup.' .. media_cover.name,
  icon = { string = icons.media.forward },
  label = { drawing = false },
  click_script = 'nowplaying-cli next',
})

local interrupt = 0
local function animate_detail(detail)
  if not detail then
    interrupt = interrupt - 1
  end
  if interrupt > 0 and not detail then
    return
  end

  Sbar.animate('tanh', 30, function()
    media_artist:set({ label = { width = detail and 'dynamic' or 0 } })
    media_title:set({ label = { width = detail and 'dynamic' or 0 } })
  end)
end

media_cover:subscribe('media_change', function(env)
  -- if whitelist[env.INFO.app] then
  local drawing = (env.INFO.state == 'playing')
  media_artist:set({ drawing = drawing, label = env.INFO.artist })
  media_title:set({ drawing = drawing, label = env.INFO.title })
  media_cover:set({ drawing = drawing })

  if drawing then
    animate_detail(true)
    interrupt = interrupt + 1
    Sbar.delay(5, animate_detail)
  else
    media_cover:set({ popup = { drawing = false } })
  end
  -- end
end)

media_cover:subscribe('mouse.entered', function(env)
  interrupt = interrupt + 1
  animate_detail(true)
end)

media_cover:subscribe('mouse.exited', function(env)
  animate_detail(false)
end)

media_cover:subscribe('mouse.clicked', function(env)
  media_cover:set({ popup = { drawing = 'toggle' } })
end)

media_title:subscribe('mouse.exited.global', function(env)
  media_cover:set({ popup = { drawing = false } })
end)
