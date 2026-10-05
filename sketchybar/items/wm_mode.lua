local colors = require('colors')
local icons = require('icons')
local omniwm = require('helpers.omniwm')

-- Shows the focused workspace's layout (niri/dwindle), or floating when the
-- focused window floats. (Fullscreen isn't shown: OmniWM emits no event for it.)
-- Left click toggles the layout, right click toggles floating.
local wm_mode = Sbar.add('item', 'wm_mode', {
  position = 'left',
  updates = true,
  icon = {
    string = icons.wm.niri,
    color = colors.tokyo_night_blue,
    padding_left = 10,
    padding_right = 10,
  },
  label = { drawing = false },
})

local function refresh()
  omniwm.query('workspaces --focused', function(result)
    local workspace = result.workspaces and result.workspaces[1]
    if workspace == nil then
      return
    end

    omniwm.query('windows --focused', function(window_result)
      local window = window_result.windows and window_result.windows[1]
      local icon, color = icons.wm[workspace.layout] or icons.wm.niri, colors.tokyo_night_blue
      if window ~= nil and window.mode == 'floating' then
        icon, color = icons.wm.float, colors.tokyo_night_yellow
      end

      wm_mode:set({ icon = { string = icon, color = color } })
    end)
  end)
end

wm_mode:subscribe({
  omniwm.events.focus,
  omniwm.events.layout_changed,
  omniwm.events.windows_changed,
}, refresh)

wm_mode:subscribe('mouse.clicked', function(env)
  if env.BUTTON == 'right' then
    omniwm.run('command toggle-focused-window-floating')
  else
    omniwm.run('command toggle-workspace-layout')
  end
end)

refresh()
