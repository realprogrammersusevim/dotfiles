local icons = require('icons')
local colors = require('colors')
local settings = require('settings')
local island = require('helpers.island')

-- Start the network_load helper
local home = os.getenv('HOME')
Sbar.exec(
  'killall network_load >/dev/null; '
  .. home
  .. '/.config/sketchybar/helpers/event_providers/network_load/bin/network_load '
  .. 'network_update 2.0'
)

-- network_load pads to three digits ('013KBps', '000 Bps'); drop the
-- padding and spell the unit as a rate
local function format_rate(rate)
  local value, unit = rate:match('^(%d+)%s*(%a+)$')
  if value == nil then
    return rate
  end
  return tonumber(value) .. ' ' .. (unit:gsub('Bps$', 'B/s'))
end

local wifi_down = Sbar.add('item', 'wifi2', {
  position = 'q',
  icon = {
    string = icons.wifi.download,
  },
  label = {
    color = colors.blue,
    string = '--',
    font = settings.number_font,
    -- Fixed and right-aligned so the unit stays put as digits come and go
    width = settings.number_width(8) + 10,
    align = 'right',
  },
})

local wifi_up = Sbar.add('item', 'wifi1', {
  position = 'q',
  icon = {
    string = icons.wifi.upload,
    padding_left = 10,
  },
  label = {
    color = colors.red,
    string = '--',
    font = settings.number_font,
    width = settings.number_width(8) + 5 + 10,
    align = 'right',
    padding_right = 10,
  },
})

wifi_up:subscribe('network_update', function(env)
  local up_color = (env.upload == '000 Bps') and colors.grey or colors.red
  local down_color = (env.download == '000 Bps') and colors.grey or colors.blue
  wifi_up:set({
    icon = { color = up_color },
    label = {
      string = format_rate(env.upload),
      color = up_color,
    },
  })
  wifi_down:set({
    icon = { color = down_color },
    label = {
      string = format_rate(env.download),
      color = down_color,
    },
  })
end)

island('wifi_bracket', { 'wifi1', 'wifi2' })
