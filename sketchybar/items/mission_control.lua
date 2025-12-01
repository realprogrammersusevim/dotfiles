local colors = require('colors')
local settings = require('settings')

local spaces = {}
local space_names = {}
local MAX_SPACES = 9

local function update_workspace_selection(focused_workspace)
  if focused_workspace == nil then
    return
  end

  local trimmed = tostring(focused_workspace):match('^%s*(.-)%s*$')
  if trimmed == nil or trimmed == '' then
    return
  end

  for index, space in ipairs(spaces) do
    local selected = tostring(index) == trimmed
    local bg_color = selected and colors.tokyo_night_red or colors.tokyo_night_bg

    Sbar.animate('linear', 5, function()
      space:set({
        background = { color = bg_color },
      })
    end)
  end
end

for i = 1, MAX_SPACES, 1 do
  local space_index = i
  local space = Sbar.add('item', 'space.' .. i, {
    position = 'left',
    icon = {
      font = { family = settings.font.numbers },
      string = i,
      padding_left = 15,
      padding_right = 5,
      color = colors.white,
      highlight_color = colors.tokyo_night_red,
    },

    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.tokyo_night_bg,
    },
    popup = {
      background = { border_width = 5, border_color = colors.tokyo_night_border }
    },
  })

  spaces[i] = space
  table.insert(space_names, space.name)

  -- Padding space
  Sbar.add('item', 'space.padding.' .. i, {
    position = 'left',
    width = settings.group_paddings,
    background = {
      drawing = false,
    },
  })
  table.insert(space_names, 'space.padding.' .. i)

  local space_popup = Sbar.add('item', {
    position = 'popup.' .. space.name,
    padding_left = 5,
    padding_right = 0,
    background = {
      drawing = true,
      image = {
        corner_radius = 15,
        scale = 0.2,
      },
    },
  })

  space:subscribe('mouse.clicked', function(env)
    if env.BUTTON == 'other' then
      space_popup:set({ background = { image = 'space.' .. env.SID } })
      space:set({ popup = { drawing = 'toggle' } })
    else
      Sbar.exec('aerospace workspace ' .. space_index)
    end
  end)

  space:subscribe('mouse.exited', function(_)
    space:set({ popup = { drawing = false } })
  end)
end

Sbar.add('bracket', 'spaces_bracket', space_names, {
  background = {
    color = colors.tokyo_night_bg,
  },
})

local workspace_listener = Sbar.add('item', 'aerospace_workspace_listener', {
  drawing = false,
  position = 'left',
  updates = true,
})

local function refresh_focused_workspace()
  local cmd = "aerospace list-workspaces --focused --format '%{workspace}'"
  Sbar.exec(cmd, function(result, exit_code)
    if exit_code ~= 0 then
      return
    end

    update_workspace_selection(result)
  end)
end

workspace_listener:subscribe(
  { 'aerospace_workspace_change' }, function(
      env)
    print('triggered')
    if env.FOCUSED_WORKSPACE ~= nil then
      update_workspace_selection(env.FOCUSED_WORKSPACE)
      return
    end

    refresh_focused_workspace()
  end)

refresh_focused_workspace()
