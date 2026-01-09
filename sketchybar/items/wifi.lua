local icons = require('icons')
local colors = require('colors')
local settings = require('settings')

-- Get the active network interface
Sbar.exec('scutil --nwi', function(result)
  local interface = result:match('Network interfaces: (%l%l%d)')
  local home = os.getenv('HOME')
  Sbar.exec(
    'killall network_load >/dev/null; '
    .. home
    .. '/.config/sketchybar/helpers/event_providers/network_load/bin/network_load '
    .. interface
    .. ' network_update 2.0'
  )
end)

local wifi_down = Sbar.add('item', 'wifi2', {
  position = 'q',
  width = 90,
  icon = {
    string = icons.wifi.download,
  },
  label = {
    color = colors.blue,
    string = '??? Bps',
    font = settings.font.numbers,
  },
})

local wifi_up = Sbar.add('item', 'wifi1', {
  position = 'q',
  width = 90,
  icon = {
    string = icons.wifi.upload,
  },
  label = {
    color = colors.red,
    string = '??? Bps',
    font = settings.font.numbers,
  },
})

wifi_up:subscribe('network_update', function(env)
  local up_color = (env.upload == '000 Bps') and colors.grey or colors.red
  local down_color = (env.download == '000 Bps') and colors.grey or colors.blue
  wifi_up:set({
    icon = { color = up_color },
    label = {
      string = env.upload,
      color = up_color,
    },
  })
  wifi_down:set({
    icon = { color = down_color },
    label = {
      string = env.download,
      color = down_color,
    },
  })
end)

Sbar.add('bracket', 'wifi_bracket', { 'wifi1', 'wifi2' },
  {
    background = {
      color = colors.tokyo_night_bg
    }
  })
