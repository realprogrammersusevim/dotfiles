local icons = require('icons')
local colors = require('colors')
local settings = require('settings')

local draw_colors = {
  { watts = 35, color = colors.red },
  { watts = 25, color = colors.orange },
  { watts = 15, color = colors.yellow },
}

local battery = Sbar.add('item', 'battery', {
  position = 'right',
  icon = {
    font = {
      style = settings.font.style_map['Regular'],
      size = 18.0,
    },
  },
  -- Wide enough for '100%', so 9% -> 10% -> 100% never resizes the island
  label = {
    font = settings.number_font,
    width = settings.number_width(4) + 10,
    align = 'right',
  },
  update_freq = 60,
  popup = { align = 'center' },
})

local remaining_time = Sbar.add('item', {
  position = 'popup.' .. battery.name,
  icon = {
    string = 'Time remaining:',
    width = 100,
    align = 'left',
  },
  label = {
    string = '??:??h',
    width = 100,
    align = 'right',
  },
})

local power_draw = Sbar.add('item', {
  position = 'popup.' .. battery.name,
  icon = {
    string = 'Power draw:',
    width = 100,
    align = 'left',
  },
  label = {
    string = '?? W',
    width = 100,
    align = 'right',
  },
})

local last_total, last_count, watts

local function sample_power(callback)
  Sbar.exec('ioreg -rn AppleSmartBattery', function(ioreg)
    local load = tonumber(ioreg:match('"SystemLoad"=(%d+)'))
    local total = tonumber(ioreg:match('"AccumulatedSystemLoad"=(%d+)'))
    local count = tonumber(ioreg:match('"SystemLoadAccumulatorCount"=(%d+)'))
    if not (load and total and count) then
      return callback(nil)
    end

    if last_count and count > last_count then
      watts = (total - last_total) / (count - last_count) / 1000
    elseif not last_count or count < last_count then
      -- First sample, or the counters reset: fall back to the latest reading
      watts = load / 1000
    end
    -- Otherwise the gauge hasn't refreshed yet, so keep the previous average
    last_total, last_count = total, count
    callback(watts)
  end)
end

battery:subscribe({ 'forced', 'routine', 'power_source_change', 'system_woke' },
  function()
    Sbar.exec('pmset -g batt', function(batt_info)
      local icon = '!'
      local label = '?'

      local found, _, charge = batt_info:find('(%d+)%%')
      if found then
        charge = tonumber(charge)
        label = charge .. '%'
      end

      local color = colors.green
      local charging, _, _ = batt_info:find('AC Power')

      if charging then
        icon = icons.battery.charging
      else
        if found and charge > 80 then
          icon = icons.battery._100
        elseif found and charge > 60 then
          icon = icons.battery._75
        elseif found and charge > 40 then
          icon = icons.battery._50
        elseif found and charge > 20 then
          icon = icons.battery._25
          color = colors.orange
        else
          icon = icons.battery._0
          color = colors.red
        end
      end

      sample_power(function(draw)
        local label_color = colors.label
        if draw then
          power_draw:set({ label = string.format('%.1f W', draw) })

          if not charging then
            for _, level in ipairs(draw_colors) do
              if draw >= level.watts then
                label_color = level.color
                break
              end
            end
          end
        end

        battery:set({
          icon = {
            string = icon,
            color = color,
          },
          label = {
            string = label,
            color = label_color,
          },
        })
      end)
    end)
  end)

battery:subscribe('mouse.clicked', function(env)
  local drawing = battery:query().popup.drawing
  battery:set({ popup = { drawing = 'toggle' } })

  if drawing == 'off' then
    Sbar.exec('pmset -g batt', function(batt_info)
      local found, _, remaining = batt_info:find(' (%d+:%d+) remaining')
      local label = found and remaining .. 'h' or 'No estimate'
      remaining_time:set({ label = label })
    end)
  end
end)
