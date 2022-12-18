local cmp = require('cmp')

-- Setup icons
local lspkind = require('lspkind')

-- Select first item by default
-- vim.opt.completeopt = 'menuone,preview,noselect'

cmp.setup({
  enabled = function()
    local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
    if in_prompt then -- Disable CMP in the Telescope window
      return false
    end
    local context = require('cmp.config.context')
    return
      not (
          context.in_treesitter_capture('comment') == true -- Disable CMP in code comments
          or context.in_syntax_group('Comment')
        )
  end,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<S-CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'copilot' },
    { name = 'calc' },
    { name = 'emoji' },
    { name = 'nvim_lua' },
    { name = 'git' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      menu = {
        nvim_lsp = 'Lsp',
        luasnip = 'Snip',
        nvim_lua = 'Lua',
        path = 'Path',
        copilot = 'Copilot',
        calc = 'Calc',
        emoji = 'Emoji',
        git = 'Git',
      },
    }),
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  experimental = { ghost_text = true }, -- Shows the suggestion in italics. Esp. helpful for seeing the entire Copilot suggestion
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})
