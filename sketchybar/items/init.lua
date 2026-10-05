-- Window manager events shared by the items below
require('helpers.omniwm').start()

-- Left items
require('items.mission_control')
require('items.wm_mode')
require('items.front_app')

-- Notch left
require('items.wifi')
require('items.media')

-- Notch right
require('items.memory')
require('items.cpu')
require('items.gpu')
require('items.disk')

-- Right items
require('items.clock')
require('items.battery')
require('items.crec')

-- Logic items
require('items.animator')
