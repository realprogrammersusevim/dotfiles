local icons = require('icons')
local colors = require('colors')

Sbar.add('event', 'music_update', 'com.apple.Music.playerInfo')

local media_cover = Sbar.add('item', {
  position = 'q',
  background = {
    image = {
      string = 'media.artwork',
      scale = 0.03,
      corner_radius = 5,
    },
    color = colors.transparent,
    padding_right = 8,
  },
  corner_radius = 8,
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

local artwork_path = (os.getenv('TMPDIR') or '/tmp') .. '/sketchybar_media_artwork.jpg'

media_cover:subscribe('music_update', function(env)
  local script = [[
    osascript -e '
      on run argv
        set artworkFile to (item 1 of argv)
        tell application "Music"
          if player state is not playing then return "not_playing"

          set currentTrack to current track
          set trackName to name of currentTrack
          set trackArtist to artist of currentTrack
          set hasArtwork to "false"

          try
            if (count of artworks of currentTrack) > 0 then
              set artData to data of artwork 1 of currentTrack
              set f to open for access artworkFile with write permission
              set eof f to 0
              write artData to f
              close access f
              set hasArtwork to "true"
            end if
          on error
            -- ignore if artwork fails
          end try

          return trackArtist & "\n" & trackName & "\n" & hasArtwork
        end tell
      end run
    ' "]] .. artwork_path .. [["
  ]]

  Sbar.exec(script, function(result)
    if result == 'not_playing\n' or result == '' then
      media_artist:set({ drawing = false })
      media_title:set({ drawing = false })
      media_cover:set({ drawing = false, popup = { drawing = false } })
      animate_detail(false)
      return
    end

    local parts = {}
    for part in result:gmatch('([^\n]+)') do
      table.insert(parts, part)
    end

    local artist = parts[1] or ''
    local title = parts[2] or ''
    local has_artwork = (parts[3] or 'false') == 'true'

    media_artist:set({ drawing = true, label = artist })
    media_title:set({ drawing = true, label = title })

    if has_artwork then
      media_cover:set({
        drawing = true,
        background = { image = { string = artwork_path } },
      })
    else
      media_cover:set({ drawing = false })
    end

    animate_detail(true)
    interrupt = interrupt + 1
    Sbar.delay(5, animate_detail)
  end)
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
