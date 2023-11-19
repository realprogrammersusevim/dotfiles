return {
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_lua').lazy_load({ paths = './snippets' })
        end,
        dependencies = {
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
      },
      { 'onsails/lspkind.nvim' },
      {
        'zbirenbaum/copilot-cmp',
        config = true,
        enabled = true,
        dependencies = {
          'zbirenbaum/copilot.lua',
        },
      },
      { 'neovim/nvim-lspconfig' },
    },
    config = function()
      local cmp = require('cmp')

      -- Setup icons
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      -- Select first item by default
      -- vim.opt.completeopt = 'menuone,preview,noselect'

      cmp.setup({
        enabled = function()
          local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
          if in_prompt then -- Disable CMP in the Telescope window
            return false
          end
          local context = require('cmp.config.context')
          return not (
            context.in_treesitter_capture('comment') == true -- Disable CMP in code comments
            or context.in_syntax_group('Comment')
          )
        end,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          -- ['<C-Space>'] = cmp.mapping.complete(),
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
          { name = 'treesitter' },
          { name = 'copilot' },
        },
        formatting = {
          format = lspkind.cmp_format({
            preset = 'codicons',
            mode = 'symbol',
            before = function(entry, vim_item)
              -- Get the full snippet (and only keep first line)
              local word = entry:get_insert_text()
              if
                entry.completion_item.insertTextFormat
                == require('cmp.types').lsp.InsertTextFormat.Snippet
              then
                word = vim.lsp.util.parse_snippet(word)
              end
              word = require('cmp.utils.str').oneline(word)

              if
                entry.completion_item.insertTextFormat
                  == require('cmp.types').lsp.InsertTextFormat.Snippet
                and string.sub(vim_item.abbr, -1, -1) == '~'
              then
                word = word .. '~'
              end
              vim_item.abbr = word

              return vim_item
            end,
            maxwidth = 50,
          }),
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        experimental = { ghost_text = true }, -- Shows the suggestion in italics. Esp. helpful for seeing the entire Copilot suggestion
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    end,
  },
}
