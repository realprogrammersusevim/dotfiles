return {
  text = 'SF Pro',     -- Used for text
  -- Used for numbers. 'SF Mono' isn't registered as a system font (it lives
  -- in Terminal.app), so CoreText silently falls back to a proportional face;
  -- '.SF NS Mono' is the system copy macOS ships for the UI
  numbers = '.SF NS Mono',

  -- Unified font style map
  style_map = {
    ['Regular'] = 'Regular',
    ['Medium'] = 'Medium',
    ['Semibold'] = 'Semibold',
    ['Bold'] = 'Bold',
    ['Heavy'] = 'Heavy',
    ['Black'] = 'Black',
  },
}
