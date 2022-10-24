local cmp = require'cmp'

-- Setup icons
local lspkind = require('lspkind')

-- Select first item by default
vim.opt.completeopt = 'menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['luasnp'].lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<S-Tab>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      menu = ({
        nvim_lsp = '[LSP]',
        buffer = '[BUF]',
        luasnip = '[Lua]',
        nvim_lua = '[Lua]',
        path = '[PATH]',
        vsnip = '[VSNIP]',
      }),
    }),
  },
})
