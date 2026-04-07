local colors   = require('colors')

-- Artemis II / Orion "Integrity"
-- Launched: April 1, 2026 22:35:12 UTC  (Unix: 1775082912)
local LAUNCH_T = 1775082912

local PHASES   = {
  { 90480,     'Earth Orbit',      colors.blue },
  { 367680,    'Translunar Coast', colors.teal },
  { 433860,    'Lunar Approach',   colors.yellow },
  { 499920,    'Lunar Flyby',      colors.orange },
  { 782940,    'Return Coast',     colors.teal },
  { 783720,    'Entry',            colors.red },
  { math.huge, 'Splashdown!',      colors.green },
}

local EVENTS   = {
  { 90480,  'TLI burn' },
  { 173280, 'TCM-1' },
  { 263280, 'TCM-2' },
  { 361740, 'TCM-3' },
  { 367680, 'Lunar SOI entry' },
  { 433860, 'Closest Moon approach' },
  { 499920, 'Lunar SOI exit' },
  { 523740, 'Return TCM-1' },
  { 620400, 'Manual pilot demo' },
  { 707340, 'Return TCM-2' },
  { 764940, 'Return TCM-3' },
  { 782940, 'Entry interface' },
  { 783720, 'Splashdown' },
}

local function format_duration(secs)
  secs = math.floor(math.abs(secs))
  local d = math.floor(secs / 86400)
  local h = math.floor((secs % 86400) / 3600)
  local m = math.floor((secs % 3600) / 60)
  if d > 0 then
    return string.format('%dd %dh', d, h)
  elseif h > 0 then
    return string.format('%dh %dm', h, m)
  else
    return string.format('%dm', m)
  end
end

local function get_phase(elapsed)
  for _, p in ipairs(PHASES) do
    if elapsed < p[1] then return p[2], p[3] end
  end
  return PHASES[#PHASES][2], PHASES[#PHASES][3]
end

local function get_next_event(elapsed)
  for _, e in ipairs(EVENTS) do
    if elapsed < e[1] then return e[2], e[1] - elapsed end
  end
  return nil, nil
end

-- Three bar items
local orion_phase       = Sbar.add('item', 'orion_phase', {
  position    = 'q',
  update_freq = 60,
  icon        = { drawing = false },
  label       = { string = 'Orion ...' },
})

local orion_traj        = Sbar.add('item', 'orion_traj', {
  position = 'q',
  icon     = { drawing = false },
  label    = { string = '...' },
})

local orion_event       = Sbar.add('item', 'orion_event', {
  position = 'q',
  icon     = { drawing = false },
  label    = { string = '...' },
})

local cached_traj_text  = '...'
local cached_traj_color = colors.tokyo_night_comment

local function update_local()
  local elapsed = os.time() - LAUNCH_T
  if elapsed < 0 then return end

  local phase, phase_color     = get_phase(elapsed)
  local event_name, event_secs = get_next_event(elapsed)

  orion_phase:set({
    label = {
      string = string.format('%s  T+%s', phase, format_duration(elapsed)),
      color  = phase_color,
    },
  })

  orion_traj:set({
    label = { string = cached_traj_text, color = cached_traj_color },
  })

  if event_name then
    local next_color = event_secs < 3600 and colors.red
        or event_secs < 14400 and colors.yellow
        or colors.tokyo_night_comment
    orion_event:set({
      label = {
        string = string.format('%s in %s', event_name, format_duration(event_secs)),
        color  = next_color,
      },
    })
  else
    orion_event:set({ label = { string = '' } })
  end
end

local function fetch_orion()
  local now    = os.date('!%Y-%m-%d %H:%M')
  local stop_t = os.date('!%Y-%m-%d %H:%M', os.time() + 120)

  local cmd    = string.format([[
    curl -sG 'https://ssd.jpl.nasa.gov/api/horizons.api' \
      --data-urlencode 'format=json' \
      --data-urlencode "COMMAND='-1024'" \
      --data-urlencode 'MAKE_EPHEM=YES' \
      --data-urlencode 'EPHEM_TYPE=VECTORS' \
      --data-urlencode "CENTER='500@399'" \
      --data-urlencode "START_TIME='%s'" \
      --data-urlencode "STOP_TIME='%s'" \
      --data-urlencode 'STEP_SIZE=1m' \
      --data-urlencode 'CSV_FORMAT=YES' | python3 -c '
import sys, json, re, math
data = json.load(sys.stdin)
m = re.search(r"\$\$SOE(.*?)\$\$EOE", data.get("result", ""), re.DOTALL)
if not m: sys.exit(1)
cols = [c.strip() for c in m.group(1).strip().split("\n")[0].split(",")]
x,y,z    = float(cols[2]), float(cols[3]), float(cols[4])
vx,vy,vz = float(cols[5]), float(cols[6]), float(cols[7])
rr = float(cols[10])
dist  = math.sqrt(x*x + y*y + z*z) - 6371
speed = math.sqrt(vx*vx + vy*vy + vz*vz)
print(f"{dist:.0f},{speed:.3f},{rr:.4f}")
'
  ]], now, stop_t)

  Sbar.exec(cmd, function(output)
    local dist, speed, rr = output:match('(%S+),(%S+),(%S+)')
    dist                  = tonumber(dist)
    speed                 = tonumber(speed)
    rr                    = tonumber(rr)
    if not (dist and speed and rr) then return end

    local approaching = rr < 0
    local arrow       = approaching and '↓' or '↑'

    cached_traj_text  = string.format('%s%s  %.2f km/s', dist, arrow, speed)
    cached_traj_color = approaching and colors.yellow or colors.teal
    update_local()
  end)
end

local call_count = 0
orion_phase:subscribe({ 'routine', 'system_woke' }, function()
  call_count = call_count + 1
  update_local()
  if call_count % 5 == 0 then fetch_orion() end -- API every 5 min
end)

orion_phase:subscribe('forced', function()
  update_local()
  fetch_orion()
end)

-- Initial load
update_local()
fetch_orion()
