local colors = require('colors')
local settings = require('settings')
local omniwm = require('helpers.omniwm')

-- Claude Code sessions, kept current by the hook in helpers/claude_agents.sh.
-- The icon takes the colour of the most urgent state and the label counts the
-- sessions in it: orange needs you, green finished, blue working, grey idle.
local SCRIPT = os.getenv('HOME') .. '/.config/sketchybar/helpers/claude_agents.sh'

-- Claude Code titles its terminal with this glyph
local GLYPH = '✳'

local STATE_COLOR = {
  waiting = colors.orange,
  done = colors.green,
  running = colors.blue,
  idle = colors.grey,
}

local STATE_WORD = {
  waiting = 'needs you',
  done = 'finished',
  running = 'working',
  idle = 'idle',
}

Sbar.add('event', 'claude_agents')

local agents = Sbar.add('item', 'claude_agents', {
  position = 'right',
  icon = {
    string = GLYPH,
    color = colors.grey,
    font = { style = settings.font.style_map['Bold'], size = 15.0 },
    padding_left = 10,
  },
  label = {
    string = '0',
    color = colors.grey,
    font = settings.number_font,
    width = settings.number_width(2) + 10,
    align = 'right',
  },
  -- Ages in the popup and pruning of sessions whose process died
  update_freq = 30,
  popup = { align = 'center' },
})

local rows = {}
local sessions = {}
local finished = 0

local function rebuild_popup()
  for _, row in ipairs(rows) do
    Sbar.remove(row.name)
  end
  rows = {}

  if #sessions == 0 then
    rows[1] = Sbar.add('item', 'claude_agents.row.1', {
      position = 'popup.' .. agents.name,
      icon = { string = 'No Claude Code sessions', color = colors.grey },
      label = { drawing = false },
    })
    return
  end

  for i, s in ipairs(sessions) do
    local row = Sbar.add('item', 'claude_agents.row.' .. i, {
      position = 'popup.' .. agents.name,
      icon = {
        string = '●  ' .. s.project,
        color = STATE_COLOR[s.state] or colors.grey,
        width = 260,
        align = 'left',
      },
      label = {
        string = STATE_WORD[s.state] .. ' · ' .. s.minutes .. 'm',
        color = colors.fg_dark,
        width = 140,
        align = 'right',
      },
    })
    row:subscribe('mouse.clicked', function()
      agents:set({ popup = { drawing = false } })
      Sbar.exec(SCRIPT .. ' focus ' .. s.id)
    end)
    rows[#rows + 1] = row
  end
end

local function refresh()
  Sbar.exec(SCRIPT .. ' render', function(output)
    local lines = {}
    for line in output:gmatch('[^\n]+') do
      lines[#lines + 1] = line
    end

    local w, r, d, i = (lines[1] or ''):match('(%d+) (%d+) (%d+) (%d+)')
    w, r, d, i = tonumber(w) or 0, tonumber(r) or 0, tonumber(d) or 0, tonumber(i) or 0
    finished = d

    local state, count = 'idle', i
    if w > 0 then
      state, count = 'waiting', w
    elseif d > 0 then
      state, count = 'done', d
    elseif r > 0 then
      state, count = 'running', r
    end
    local color = STATE_COLOR[state]

    agents:set({
      icon = { color = color },
      label = { string = tostring(count), color = color },
    })

    sessions = {}
    for n = 2, #lines do
      local id, st, minutes, cwd = lines[n]:match('^([^|]*)|([^|]*)|([^|]*)|(.*)$')
      if id then
        sessions[#sessions + 1] = {
          id = id,
          state = st,
          minutes = minutes,
          -- Last two path parts tell sessions apart without crowding the row
          project = cwd:match('([^/]+/[^/]+)$') or cwd,
        }
      end
    end
    rebuild_popup()
  end)
end

agents:subscribe({ 'claude_agents', 'forced', 'routine', 'system_woke' }, refresh)

-- Looking at a finished session's window counts as having seen it. Only pay
-- for the AppleScript round trip when something is actually finished.
agents:subscribe(omniwm.events.focus, function()
  if finished > 0 then
    Sbar.exec(SCRIPT .. ' seen')
  end
end)

agents:subscribe('mouse.clicked', function(env)
  if env.BUTTON == 'right' then
    -- Jump straight to the most urgent session
    if sessions[1] and sessions[1].state ~= 'idle' then
      Sbar.exec(SCRIPT .. ' focus ' .. sessions[1].id)
    end
  else
    agents:set({ popup = { drawing = 'toggle' } })
  end
end)

agents:subscribe('mouse.exited.global', function()
  agents:set({ popup = { drawing = false } })
end)
