local settings = require("settings")

-- Add custom events
Sbar.add("event", "lock", "com.apple.screenIsLocked")
Sbar.add("event", "unlock", "com.apple.screenIsUnlocked")

-- Create the animator item (hidden, just for logic)
local animator = Sbar.add("item", "animator", {
  drawing = false,
  updates = true,
})

-- Lock animation: hide the bar
animator:subscribe("lock", function()
  Sbar.bar({
    y_offset = -32,
    margin = -200,
    notch_width = 0,
    blur_radius = 0,
    color = 0x00000000, -- Fully transparent
  })
end)

-- Unlock animation: restore the bar
animator:subscribe("unlock", function()
  Sbar.animate("sin", 25, function()
    Sbar.bar({
      y_offset = settings.bar.y_offset,
      margin = settings.bar.margin,
      notch_width = settings.bar.notch_width,
      color = settings.bar.color,
    })
  end)
end)
