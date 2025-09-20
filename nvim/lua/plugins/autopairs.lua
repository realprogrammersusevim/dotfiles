return {
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    version = '*',
    opts = {
      mappings = {
        ['$'] = {
          action = 'closeopen',
          pair = '$$',
          neigh_pattern = '[^\\].',
          register = { cr = false }
        },
      }
    }
  },
}
