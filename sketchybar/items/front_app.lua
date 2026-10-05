local app_icons = require('helpers.app_icons')
local omniwm = require('helpers.omniwm')

local front_app = Sbar.add('item', 'front_app', {
  display = 'active',
  updates = true,
  icon = {
    font = 'sketchybar-app-font:Regular:16.0',
    padding_left = 12,
    padding_right = 0,
    y_offset = -1,
  },
  label = {
    max_chars = 24,
    padding_right = 15,
  }
})

-- Name from the last front_app_switched, for apps OmniWM doesn't manage
local fallback_app = ''

local function show(app_name, title)
  front_app:set({
    icon = { string = app_icons[app_name] or app_icons['Default'] },
    label = { string = (title ~= nil and title ~= '') and title or app_name },
  })
end

-- OmniWM reports every window focus change (including between windows of the
-- same app, and title changes), which front_app_switched alone misses
local function refresh()
  omniwm.query('focused-window', function(result)
    local window = result.window
    if window ~= nil and window.app ~= nil then
      show(window.app.name, window.title)
    else
      show(fallback_app, nil)
    end
  end)
end

front_app:subscribe('front_app_switched', function(env)
  fallback_app = env.INFO
  refresh()
end)

front_app:subscribe(omniwm.events.focus, refresh)

refresh()
