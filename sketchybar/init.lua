print('Loading init.lua')
Sbar = require('sketchybar')
print('Loaded sketchybar')

Sbar.begin_config()
print('Began config')

require('bar')
print('Loaded bar')
require('default')
print('Loaded default')
require('items')
print('Loaded items')

Sbar.end_config()
print('Ended config')

--[[
##### Finalizing Setup #####
# The below command is only needed at the end of the initial configuration to
# force all scripts to run the first time, it should never be run in an item script.
--]]

Sbar.event_loop()
