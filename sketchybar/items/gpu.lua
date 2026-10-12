local icons = require('icons')
local colors = require('colors')
local stat_graph = require('helpers.stat_graph')

-- Start the GPU binary which fires our events
local home = os.getenv('HOME')
Sbar.exec(
  'killall gpu_load >/dev/null; '
  .. home
  .. '/.config/sketchybar/helpers/event_providers/gpu_load/bin/gpu_load gpu_update 2.0'
)

local gpu = Sbar.add('graph', 'gpu', stat_graph.width,
  stat_graph.props(icons.gpu, colors.teal))

gpu:subscribe('gpu_update', function(env)
  local load = tonumber(env.gpu_usage)
  gpu:push({ load / 100. })

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

  gpu:set({
    graph = stat_graph.graph_colors(color),
    label = load .. '%',
  })
end)

gpu:subscribe('mouse.clicked', function(env)
  Sbar.exec("open -a 'Activity Monitor'")
end)
