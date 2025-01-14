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
  graph = { color = colors.blue },
  icon = { string = icons.cpu, color = 0xff7aa2f7 },
  label = {
    string = '??%',
  },
})

cpu:subscribe('cpu_update', function(env)
  -- Also available: env.user_load, env.sys_load
  local load = tonumber(env.total_load)
  cpu:push({ load / 100. })

  local color = colors.blue
  if load > 30 then
    if load < 60 then
      color = colors.yellow
    elseif load < 80 then
      color = colors.orange
    else
      color = colors.red
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
