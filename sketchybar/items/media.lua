local icons = require('icons')
local colors = require('colors')
local utils = require('helpers.utils')
local island = require('helpers.island')

Sbar.add('event', 'music_update', 'com.apple.Music.playerInfo')

local media_cover = Sbar.add('item', {
  position = 'q',
  width = 30,
  align = 'center',
  -- A dot tinted by the track's genre
  background = {
    drawing = true,
    color = colors.transparent,
    height = 12,
    corner_radius = 6,
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
    color = colors.fg_dark,
  },
})

local media_title = Sbar.add('item', {
  position = 'q',
  drawing = false,
  icon = { drawing = false },
  label = {
    max_chars = 16,
    padding_right = 10,
  },
})

Sbar.add('item', {
  position = 'popup.' .. media_cover.name,
  icon = { string = icons.media.back },
  label = { drawing = false },
  click_script = "osascript -e 'tell application \"Music\" to previous track'",
})
Sbar.add('item', {
  position = 'popup.' .. media_cover.name,
  icon = { string = icons.media.play_pause },
  label = { drawing = false },
  click_script = "osascript -e 'tell application \"Music\" to playpause'",
})
Sbar.add('item', {
  position = 'popup.' .. media_cover.name,
  icon = { string = icons.media.forward },
  label = { drawing = false },
  click_script = "osascript -e 'tell application \"Music\" to next track'",
})

island('media_bracket', { media_cover.name, media_artist.name, media_title.name })

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

media_cover:subscribe('music_update', function(env)
  if env['INFO']['Player State'] == 'Paused' then
    animate_detail(false)
    return
  elseif env['INFO']['Player State'] == 'Playing' then
    media_artist:set({ drawing = true, label = env['INFO']['Artist'] })
    media_title:set({ drawing = true, label = env['INFO']['Name'] })
    media_cover:set({
      drawing = true,
      background = {
        color = utils.string_to_color_rgba(env['INFO']['Genre'])
      }
    })

    animate_detail(true)
    interrupt = interrupt + 1
    Sbar.delay(5, animate_detail)
  end
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
