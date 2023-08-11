return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')

      npairs.setup({
        check_ts = true,
      })

      local rule = require('nvim-autopairs.rule')
      local ts_conds = require('nvim-autopairs.ts-conds')

      npairs.add_rules({
        rule('*', '*', 'markdown'):with_pair(ts_conds.is_not_ts_node({
          'code_fence_content',
          'code_span',
          'strong_emphasis',
          'strong_emphasis_delimiter',
        })),
        rule('_', '_', 'markdown'):with_pair(ts_conds.is_not_ts_node({
          'code_fence_content',
          'code_span',
          'emphasis',
          'emphasis_delimiter',
        })),
        rule('~', '~', 'markdown'):with_pair(ts_conds.is_not_ts_node({
          'code_fence_content',
          'code_span',
          'strikethrough',
          'strikethrough_delimiter',
        })),
      })
    end,
  },
}
