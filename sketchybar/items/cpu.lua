local icons = require('icons')
local colors = require('colors')

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
local home = os.getenv('HOME')
Sbar.exec(
  'killall cpu_load >/dev/null; '
  .. home
  .. '/.config/sketchybar/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0'
)

local cpu = Sbar.add('graph', 'cpu', 30, {
  position = 'e',
  graph = { color = colors.tokyo_night_blue },
  icon = { string = icons.cpu, color = colors.tokyo_night_blue },
  label = {
    string = '??%',
  },
})

cpu:subscribe('cpu_update', function(env)
  -- Also available: env.user_load, env.sys_load
  local load = tonumber(env.total_load)
  cpu:push({ load / 100. })

  local color = colors.tokyo_night_blue
  if load > 30 then
    if load < 60 then
      color = colors.tokyo_night_yellow
    elseif load < 80 then
      color = colors.tokyo_night_orange
    else
      color = colors.tokyo_night_red
    end
  end

  cpu:set({
    graph = { color = color },
    label = env.total_load .. '%',
  })
end)

cpu:subscribe('mouse.clicked', function(env)
  Sbar.exec("open -a 'Activity Monitor'")
end)
