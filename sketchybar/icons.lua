local settings = require('settings')

local icons = {
  sf_symbols = {
    plus = '􀅼',
    loading = '􀖇',
    apple = '􀣺',
    gear = '􀍟',
    cpu = '􀫥',
    clipboard = '􀉄',

    disk = '􀨪',
    memory = '􀧖',
    gpu = '􀧻', -- no gpu icon so just using circle square
    network = '􀤆',
    network_down = '􀄩',
    network_up = '􀄨',
    preferences = '􀺽',
    activity = '􀒓',
    lock = '􀒳',
    logout = '',
    power = '',
    reboot = '',
    sleep = '⏾',
    bell = '􀋚',
    bell_dot = '􀝗',

    switch = {
      on = '􁏮',
      off = '􁏯',
    },
    volume = {
      _100 = '􀊩',
      _66 = '􀊧',
      _33 = '􀊥',
      _10 = '􀊡',
      _0 = '􀊣',
    },
    battery = {
      _100 = '􀛨',
      _75 = '􀺸',
      _50 = '􀺶',
      _25 = '􀛩',
      _0 = '􀛪',
      charging = '􀢋',
    },
    wifi = {
      upload = '􀄨',
      download = '􀄩',
      connected = '􀙇',
      disconnected = '􀙈',
      router = '􁓤',
    },
    media = {
      back = '􀊊',
      forward = '􀊌',
      play_pause = '􀊈',
    },
  },

  -- Alternative NerdFont icons
  nerdfont = {
    plus = '',
    gear = '',
    clipboard = 'Missing Icon',

    loading = '􀖇',
    apple = '􀣺',
    preferences = '􀺽',
    activity = '􀒓',
    lock = '􀒳',
    logout = '',
    power = '',
    reboot = '',
    sleep = '⏾',
    bell = '􀋚',
    bell_dot = '􀝗',

    -- Battery
    battery100 = '􀛨',
    battery75 = '􀺸',
    battery50 = '􀺶',
    battery25 = '􀛩',
    battery0 = '􀛪',
    charging = '􀋦',

    cpu = '􀧓',
    disk = '􀨪',
    memory = '􀧖',
    network = '􀤆',
    network_down = '􀄩',
    network_up = '􀄨',

    -- Git Icons
    git_issue = '􀍷',
    git_discussion = '􀒤',
    git_pull_request = '􀙡',
    git_commit = '􀡚',
    git_indicator = '',

    -- Media icons
    back = '􀊊',
    play = '􀊄',
    pause = '􀊆',
    play_pause = '􀊈',
    next = '􀊌',
    shuffle = '􀊝',
    repeated = '􀊞',
    loved = '􀊵',

    -- Yabai Icons
    yabai_stack = '􀏭',
    yabai_fullscreen_zoom = '􀏜',
    yabai_parent_zoom = '􀥃',
    yabai_float = '􀢌',
    yabai_grid = '􀧍',

    locked = '􀎡',
    unlocked = '􀎥',

    -- Dividers
    chevron_left = '􀆉',
    chevron_right = '􀆊',
    switch = {
      on = '󱨥',
      off = '󱨦',
    },
    volume = {
      _100 = '',
      _66 = '',
      _33 = '',
      _10 = '',
      _0 = '',
    },
    battery = {
      _100 = '',
      _75 = '',
      _50 = '',
      _25 = '',
      _0 = '',
      charging = '',
    },
    wifi = {
      upload = '',
      download = '',
      connected = '󰖩',
      disconnected = '󰖪',
      router = 'Missing Icon',
    },
    media = {
      back = '',
      forward = '',
      play_pause = '',
    },
  },
}

if not (settings.icons == 'NerdFont') then
  return icons.sf_symbols
else
  return icons.nerdfont
end
