-- Thin wrapper around omniwmctl, OmniWM's IPC client

local omniwm = {}

-- sketchybar events fired by the watcher, one per OmniWM channel
omniwm.events = {
  workspace_bar = 'omniwm_workspace_bar',
  focus = 'omniwm_focus',
  layout_changed = 'omniwm_layout_changed',
  windows_changed = 'omniwm_windows_changed',
}

-- Register the events and start a single long-lived watcher that forwards
-- each (coalesced) OmniWM update as the matching sketchybar event. Any watcher
-- left over from a previous config load is killed first.
function omniwm.start()
  for _, event in pairs(omniwm.events) do
    Sbar.add('event', event)
  end

  Sbar.exec([[
    pkill -f '^omniwmctl watch workspace-bar,focus,layout-changed,windows-changed ';
    omniwmctl watch workspace-bar,focus,layout-changed,windows-changed --reconnect \
      --exec bash -c 'sketchybar --trigger "omniwm_${OMNIWM_EVENT_CHANNEL//-/_}"' \
      >/dev/null 2>&1 &
  ]])
end

-- Run `omniwmctl query <args>` and pass the unwrapped payload to the callback
function omniwm.query(args, callback)
  Sbar.exec('omniwmctl query ' .. args .. ' --format ndjson', function(response)
    if type(response) == 'table' and response.ok == true and response.result ~= nil then
      callback(response.result.payload)
    end
  end)
end

-- Run an omniwmctl action, e.g. `command switch-workspace 2`
function omniwm.run(args)
  Sbar.exec('omniwmctl ' .. args)
end

return omniwm
