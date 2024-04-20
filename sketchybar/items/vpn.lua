local vpn = Sbar.add('alias', 'Mullvad VPN,Item-0', {
  position = 'right',
  update_freq = 10,
})

vpn:subscribe('mouse.clicked', function()
  Sbar.exec('mullvad status', function(output)
    print(output)
    if output:match('^Disconnected.+') then
      print('Connecting to Mullvad VPN...')
      Sbar.exec('mullvad connect')
    else
      Sbar.exec('mullvad disconnect')
    end
  end)
end)
