local colors = require('colors')
local settings = require('settings')
local app_icons = require('helpers.app_icons')
local omniwm = require('helpers.omniwm')

local spaces = {}
local space_paddings = {}
local space_names = {}
local MAX_SPACES = 9

-- Latest workspace-bar data, keyed by raw workspace name
local workspaces = {}
-- Number of window rows currently in each space's popup
local popup_rows = {}

local function app_icon(app_name)
  return app_icons[app_name] or app_icons['Default']
end

local function update_workspace_selection(focused_workspace)
  for index, space in ipairs(spaces) do
    local selected = tostring(index) == focused_workspace
    local bg_color = selected and colors.tokyo_night_red or colors.tokyo_night_bg

    Sbar.animate('linear', 5, function()
      space:set({
        background = { color = bg_color },
      })
    end)
  end
end

-- One icon per app on the workspace, in OmniWM's order
local function workspace_app_icons(workspace)
  local seen = {}
  local glyphs = {}
  for _, app in ipairs(workspace.windows) do
    if not seen[app.appName] then
      seen[app.appName] = true
      table.insert(glyphs, app_icon(app.appName))
    end
  end
  return table.concat(glyphs, ' ')
end

-- Rebuild a space's popup as one clickable row per window on that workspace
local function show_window_popup(index)
  local space = spaces[index]
  for row = 1, popup_rows[index] or 0, 1 do
    Sbar.remove(space.name .. '.window.' .. row)
  end
  popup_rows[index] = 0

  local workspace = workspaces[tostring(index)]
  if workspace == nil then
    return
  end

  for _, app in ipairs(workspace.windows) do
    for _, window in ipairs(app.allWindows) do
      popup_rows[index] = popup_rows[index] + 1
      local title = window.title ~= '' and window.title or app.appName
      local row = Sbar.add('item', space.name .. '.window.' .. popup_rows[index], {
        position = 'popup.' .. space.name,
        icon = {
          string = app_icon(app.appName),
          font = 'sketchybar-app-font:Regular:16.0',
          color = window.isFocused and colors.tokyo_night_red or colors.white,
          padding_left = 10,
        },
        label = {
          string = title,
          max_chars = 50,
          padding_right = 10,
        },
        background = { drawing = false },
      })

      row:subscribe('mouse.clicked', function(_)
        space:set({ popup = { drawing = false } })
        omniwm.run('window navigate ' .. window.id)
      end)
    end
  end

  space:set({ popup = { drawing = popup_rows[index] > 0 } })
end

for i = 1, MAX_SPACES, 1 do
  local space_index = i
  local space = Sbar.add('item', 'space.' .. i, {
    position = 'left',
    icon = {
      font = { family = settings.font.numbers },
      string = i,
      padding_left = 15,
      padding_right = 15,
      color = colors.white,
      highlight_color = colors.tokyo_night_red,
    },
    label = {
      font = 'sketchybar-app-font:Regular:16.0',
      color = colors.white,
      padding_left = 0,
      padding_right = 15,
      y_offset = -1,
      drawing = false,
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
  local padding_item = Sbar.add('item', 'space.padding.' .. i, {
    position = 'left',
    width = settings.group_paddings,
    background = {
      drawing = false,
    },
  })
  space_paddings[i] = padding_item
  table.insert(space_names, 'space.padding.' .. i)

  space:subscribe('mouse.clicked', function(env)
    if env.BUTTON == 'right' or env.BUTTON == 'other' then
      show_window_popup(space_index)
    else
      omniwm.run('command switch-workspace ' .. space_index)
    end
  end)

  -- .global so the popup stays open while the mouse moves into it
  space:subscribe('mouse.exited.global', function(_)
    space:set({ popup = { drawing = false } })
  end)
end

Sbar.add('bracket', 'spaces_bracket', space_names, {
  background = {
    color = colors.tokyo_night_bg,
  },
})

local workspace_listener = Sbar.add('item', 'omniwm_workspace_listener', {
  drawing = false,
  position = 'left',
  updates = true,
})

-- Show workspaces that have windows (plus the focused one) with their app
-- icons, and highlight the focused workspace on the monitor OmniWM is
-- currently interacting with
local function refresh_workspaces()
  omniwm.query('workspace-bar', function(bar)
    workspaces = {}
    local focused_workspace = nil
    for _, monitor in ipairs(bar.monitors) do
      for _, workspace in ipairs(monitor.workspaces) do
        workspaces[workspace.rawName] = workspace
        if workspace.isFocused and monitor.id == bar.interactionMonitorId then
          focused_workspace = workspace.rawName
        end
      end
    end

    for index, space in ipairs(spaces) do
      local workspace = workspaces[tostring(index)]
      local has_windows = workspace ~= nil and #workspace.windows > 0
      local is_visible = has_windows or (workspace ~= nil and workspace.isFocused)

      space:set({
        drawing = is_visible,
        icon = { padding_right = has_windows and 8 or 15 },
        label = {
          drawing = has_windows,
          string = has_windows and workspace_app_icons(workspace) or '',
        },
      })
      local padding = space_paddings[index]
      if padding ~= nil then
        padding:set({ drawing = is_visible })
      end
    end

    update_workspace_selection(focused_workspace)
  end)
end

workspace_listener:subscribe(omniwm.events.workspace_bar, refresh_workspaces)

refresh_workspaces()
