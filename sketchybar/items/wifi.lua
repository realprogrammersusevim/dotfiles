local icons = require('icons')
local colors = require('colors')
local settings = require('settings')

-- Get the active network interface
Sbar.exec('scutil --nwi', function(result)
  local interface = result:match('Network interfaces: (%l%l%d)')
  local home = os.getenv('HOME')
  -- Execute the event provider binary which provides the event "network_update"
  -- for the network interface "en9", which is fired every 2.0 seconds.
  Sbar.exec(
    'killall network_load >/dev/null; '
      .. home
      .. '/.config/sketchybar/helpers/event_providers/network_load/bin/network_load '
      .. interface
      .. ' network_update 2.0'
  )
end)

local popup_width = 250

local wifi_up = Sbar.add('item', 'widgets.wifi1', {
  position = 'right',
  icon = {
    string = icons.wifi.upload,
  },
  label = {
    color = colors.red,
    string = '??? Bps',
    font = settings.font.numbers,
  },
})

local wifi_down = Sbar.add('item', 'widgets.wifi2', {
  position = 'right',
  icon = {
    string = icons.wifi.download,
  },
  label = {
    color = colors.blue,
    string = '??? Bps',
    font = settings.font.numbers,
  },
})

local wifi = Sbar.add('item', 'widgets.wifi.padding', {
  position = 'right',
  label = { drawing = false },
})

-- Background around the item
local wifi_bracket = Sbar.add('bracket', 'widgets.wifi.bracket', {
  wifi.name,
  wifi_up.name,
  wifi_down.name,
}, {
  popup = { align = 'center', height = 30 },
})

local ssid = Sbar.add('item', {
  position = 'popup.' .. wifi_bracket.name,
  icon = {
    string = icons.wifi.router,
  },
  width = popup_width,
  align = 'center',
  label = {
    max_chars = 18,
    string = '????????????',
    font = settings.font.numbers,
  },
})

local hostname = Sbar.add('item', {
  position = 'popup.' .. wifi_bracket.name,
  icon = {
    align = 'left',
    string = 'Hostname:',
    font = settings.font.numbers,
    width = popup_width / 2,
  },
  label = {
    max_chars = 20,
    string = '????????????',
    font = settings.font.numbers,
    width = popup_width / 2,
    align = 'right',
  },
})

local ip = Sbar.add('item', {
  position = 'popup.' .. wifi_bracket.name,
  icon = {
    align = 'left',
    string = 'IP:',
    width = popup_width / 2,
  },
  label = {
    string = '???.???.???.???',
    font = settings.font.numbers,
    width = popup_width / 2,
    align = 'right',
  },
})

local mask = Sbar.add('item', {
  position = 'popup.' .. wifi_bracket.name,
  icon = {
    align = 'left',
    string = 'Subnet mask:',
    width = popup_width / 2,
  },
  label = {
    string = '???.???.???.???',
    font = settings.font.numbers,
    width = popup_width / 2,
    align = 'right',
  },
})

local router = Sbar.add('item', {
  position = 'popup.' .. wifi_bracket.name,
  icon = {
    align = 'left',
    string = 'Router:',
    width = popup_width / 2,
  },
  label = {
    string = '???.???.???.???',
    font = settings.font.numbers,
    width = popup_width / 2,
    align = 'right',
  },
})

Sbar.add('item', { position = 'right', width = settings.group_paddings })

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

wifi:subscribe({ 'wifi_change', 'system_woke' }, function(env)
  Sbar.exec('ipconfig getifaddr en9', function(ip)
    local connected = not (ip == '')
    wifi:set({
      icon = {
        string = connected and icons.wifi.connected or icons.wifi.disconnected,
        color = connected and colors.white or colors.red,
      },
    })
  end)
end)

local function hide_details()
  wifi_bracket:set({ popup = { drawing = false } })
end

local function toggle_details()
  local should_draw = wifi_bracket:query().popup.drawing == 'off'
  if should_draw then
    wifi_bracket:set({ popup = { drawing = true } })
    Sbar.exec('networksetup -getcomputername', function(result)
      hostname:set({ label = result })
    end)
    Sbar.exec('ipconfig getifaddr en9', function(result)
      ip:set({ label = result })
    end)
    Sbar.exec(
      "ipconfig getsummary en9 | awk -F ' SSID : '  '/ SSID : / {print $2}'",
      function(result)
        ssid:set({ label = result })
      end
    )
    Sbar.exec(
      "networksetup -getinfo AX88179A | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'",
      function(result)
        mask:set({ label = result })
      end
    )
    Sbar.exec(
      "networksetup -getinfo AX88179A | awk -F 'Router: ' '/^Router: / {print $2}'",
      function(result)
        router:set({ label = result })
      end
    )
  else
    hide_details()
  end
end

wifi_up:subscribe('mouse.clicked', toggle_details)
wifi_down:subscribe('mouse.clicked', toggle_details)
wifi:subscribe('mouse.clicked', toggle_details)
wifi:subscribe('mouse.exited.global', hide_details)

local function copy_label_to_clipboard(env)
  local label = Sbar.query(env.NAME).label.value
  Sbar.exec('echo "' .. label .. '" | pbcopy')
  Sbar.set(env.NAME, { label = { string = icons.clipboard, align = 'center' } })
  Sbar.delay(1, function()
    Sbar.set(env.NAME, { label = { string = label, align = 'right' } })
  end)
end

ssid:subscribe('mouse.clicked', copy_label_to_clipboard)
hostname:subscribe('mouse.clicked', copy_label_to_clipboard)
ip:subscribe('mouse.clicked', copy_label_to_clipboard)
mask:subscribe('mouse.clicked', copy_label_to_clipboard)
router:subscribe('mouse.clicked', copy_label_to_clipboard)
