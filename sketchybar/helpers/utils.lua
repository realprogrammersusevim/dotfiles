local M = {}

function M.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function M.string_to_color_rgba(str, prc)
  -- Default to darkening by 10% if no percentage is provided
  prc = prc or -10

  -- 1. Generate Hash
  local function hash(word)
    local h = 0
    for i = 1, #word do
      local char = string.byte(word, i)
      h = (char + ((h << 5) - h)) & 0xFFFFFFFF
    end
    return h
  end

  -- 2. Clamp helper
  local function clamp(val)
    if val < 0 then return 0 end
    if val > 255 then return 255 end
    return val
  end

  -- 3. Main Logic
  local h = hash(str)
  local amt = math.floor(2.55 * prc + 0.5)

  -- Extract RGB from hash
  local r = (h >> 16) & 0xFF
  local g = (h >> 8) & 0xFF
  local b = h & 0xFF

  -- Set Alpha to 255 (Fully Opaque)
  -- If you want the hash to determine alpha, change to: local a = (h >> 24) & 0xFF
  local a = 255

  -- Apply shading
  r = clamp(r + amt)
  g = clamp(g + amt)
  b = clamp(b + amt)

  -- 4. Return formatted RGBA Hex string
  return string.format('0x%02x%02x%02x%02x', a, r, g, b)
end

return M
