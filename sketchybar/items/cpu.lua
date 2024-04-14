local icons = require('icons')
local colors = require('colors')
local settings = require('settings')

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
local home = os.getenv('HOME')
Sbar.exec(
  'killall cpu_load >/dev/null; '
    .. home
    .. '/.config/sketchybar/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0'
)

local cpu = Sbar.add('graph', 'cpu', 42, {
  position = 'right',
  graph = { color = colors.blue },
  background = {
    -- height = 22,
    -- color = { alpha = 0 },
    -- border_color = { alpha = 0 },
    drawing = false,
  },
  icon = { string = icons.cpu, color = 0xff7aa2f7 },
  label = {
    string = '??%',
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map['Bold'],
      size = 11.0,
    },
    align = 'right',
    padding_right = 0,
    width = 0,
    y_offset = 0,
  },
  padding_right = settings.paddings,
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

-- Background around the cpu item
-- Sbar.add('bracket', 'widgets.cpu.bracket', { cpu.name }, {
--   background = { color = colors.bg1 },
-- })
--
-- -- Background around the cpu item
-- Sbar.add('item', 'widgets.cpu.padding', {
--   position = 'right',
--   width = settings.group_paddings,
-- })