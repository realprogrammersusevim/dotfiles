local colors = require('colors')
local settings = require('settings')
local app_icons = require('helpers.app_icons')

local spaces = {}

for i = 1, 10, 1 do
  local space = Sbar.add('space', 'space.' .. i, {
    space = i,
    icon = {
      font = { family = settings.font.numbers },
      string = i,
      padding_left = 15,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 20,
      color = colors.grey,
      highlight_color = colors.white,
      font = 'sketchybar-app-font:Regular:16.0',
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      border_color = colors.black,
    },
    popup = { background = { border_width = 5, border_color = colors.black } },
  })

  spaces[i] = space

  -- Single item bracket for space items to achieve double border on highlight
  local space_bracket = Sbar.add('bracket', { space.name }, {
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      border_width = 2,
    },
  })

  -- Padding space
  Sbar.add('space', 'space.padding.' .. i, {
    space = i,
    script = '',
    width = settings.group_paddings,
    background = {
      drawing = false,
    },
  })

  local space_popup = Sbar.add('item', {
    position = 'popup.' .. space.name,
    padding_left = 5,
    padding_right = 0,
    background = {
      drawing = true,
      image = {
        corner_radius = 9,
        scale = 0.2,
      },
    },
  })

  space:subscribe('space_change', function(env)
    local selected = env.SELECTED == 'true'
    local color = selected and colors.grey or colors.bg2
    space:set({
      icon = { highlight = selected },
      label = { highlight = selected },
      background = { border_color = color },
    })
    space_bracket:set({
      background = { border_color = color },
    })
  end)

  space:subscribe('mouse.clicked', function(env)
    if env.BUTTON == 'other' then
      space_popup:set({ background = { image = 'space.' .. env.SID } })
      space:set({ popup = { drawing = 'toggle' } })
    else
      local op = (env.BUTTON == 'right') and '--destroy' or '--focus'
      Sbar.exec('yabai -m space ' .. op .. ' ' .. env.SID)
    end
  end)

  space:subscribe('mouse.exited', function(_)
    space:set({ popup = { drawing = false } })
  end)
end

local space_window_observer = Sbar.add('item', {
  drawing = false,
  updates = true,
})

space_window_observer:subscribe('space_windows_change', function(env)
  local icon_line = ''
  local no_app = true
  for app, _ in pairs(env.INFO.apps) do
    no_app = false
    local lookup = app_icons[app]
    local icon = ((lookup == nil) and app_icons['default'] or lookup)
    icon_line = icon_line .. ' ' .. icon
  end

  if no_app then
    icon_line = ' —'
  end
  Sbar.animate('tanh', 10, function()
    spaces[env.INFO.space]:set({ label = icon_line })
  end)
end)
