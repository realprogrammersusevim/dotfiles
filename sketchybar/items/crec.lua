local icons = require('icons')
local colors = require('colors')
local settings = require('settings')

-- Reads a cache a launchd agent keeps warm; never touches the network, so
-- a sleeping laptop greys out instead of blocking the bar on a timeout.
local RENDER = os.getenv('HOME') .. '/code/crec/mac/refresh.py --render'
local REFRESH = os.getenv('HOME') .. '/code/crec/mac/refresh.py'

-- Swap for figure.strengthtraining.traditional if you paste one out of the
-- SF Symbols app; this one is already in icons.lua and is known to render.
local GLYPH = icons.activity

local VERDICT_COLOR = {
  quieter = colors.green,
  normal = colors.orange,
  busier = colors.red,
  unknown = colors.grey,
  offline = colors.grey,
}

local crec = Sbar.add('item', 'crec', {
  position = 'right',
  icon = {
    string = GLYPH,
    color = colors.grey,
    font = { style = settings.font.style_map['Regular'], size = 15.0 },
  },
  label = { string = '--' },
  update_freq = 60,
  popup = { align = 'center' },
})

local function popup_row(label)
  return Sbar.add('item', {
    position = 'popup.' .. crec.name,
    icon = { string = label, width = 120, align = 'left' },
    label = { string = '--', width = 110, align = 'right' },
  })
end

local row_now = popup_row('Right now')
local row_usual = popup_row('Usual for now')
local row_best = popup_row('Best window today')

crec:subscribe({ 'forced', 'routine', 'system_woke' }, function()
  Sbar.exec(RENDER, function(output)
    local line = output:gsub('%s+$', '')
    -- Seven positional fields; the pattern allows empties so indices hold.
    local f = {}
    for field in (line .. '|'):gmatch('([^|]*)|') do
      f[#f + 1] = field
    end

    local verdict, count, capacity = f[1] or 'offline', f[2], f[3]
    local usual, best, stale, closed = f[4], f[5], f[6], f[7]

    local color = VERDICT_COLOR[verdict] or colors.grey
    -- A stale number must not get a confident colour.
    if stale == 'stale' then
      color = colors.grey
    end

    local label = '--'
    if verdict == 'offline' then
      label = 'offline'
    elseif closed == 'closed' then
      label = 'closed'
    elseif count ~= '' and capacity ~= '' then
      label = count .. '/' .. capacity
    end

    crec:set({
      icon = { string = GLYPH, color = color },
      label = { string = label, color = color },
    })

    row_now:set({ label = (count ~= '' and count .. ' people') or '--' })
    row_usual:set({
      -- Honest until the baseline has the samples to mean anything.
      label = (usual ~= '' and usual) or 'no baseline yet',
    })
    row_best:set({ label = (best ~= '' and best) or 'not enough history' })
  end)
end)

crec:subscribe('mouse.clicked', function(env)
  if env.BUTTON == 'right' then
    -- Fetch now instead of waiting for launchd, then redraw from the cache.
    Sbar.exec(REFRESH, function()
      Sbar.exec('sketchybar --trigger forced')
    end)
  else
    crec:set({ popup = { drawing = 'toggle' } })
  end
end)
