return {
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-emoji' },
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
        dependencies = {
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
      },
      { 'hrsh7th/cmp-cmdline' },
      { 'onsails/lspkind.nvim' },
      {
        'zbirenbaum/copilot-cmp',
        config = true,
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
          { name = 'copilot' },
          { name = 'calc' },
          { name = 'emoji' },
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = false,
            menu = {
              nvim_lsp = 'LSP',
              luasnip = 'Snip',
              path = 'Path',
              copilot = 'Copilot',
              calc = 'Calc',
              emoji = 'Emoji',
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
    end,
  },

  {
    'numToStr/Comment.nvim', -- Comment stuff out
    event = 'BufRead',
    config = true,
  },

  {
    'lewis6991/gitsigns.nvim', -- Git signs in the gutter
    event = 'BufReadPost',
    -- cond = function()
    --   if vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == 'true' then
    --     return true
    --   else
    --     return false
    --   end
    -- end,
    config = true,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason')
      local null_ls = require('null-ls')
      local diagnostics = require('null-ls').builtins.diagnostics
      local actions = require('null-ls').builtins.code_actions
      local formatting = require('null-ls').builtins.formatting
      local hover = require('null-ls').builtins.hover

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
        sources = {
          -- Code actions
          actions.proselint,
          actions.shellcheck,

          -- Diagnostics
          diagnostics.shellcheck,
          diagnostics.gitlint,
          diagnostics.checkmake,
          diagnostics.vint,
          diagnostics.yamllint,
          diagnostics.proselint,
          diagnostics.write_good.with({
            extra_args = { '--tooWordy', '--so', '--cliches', '--adverb' },
          }),
          diagnostics.jsonlint,
          diagnostics.ruff,
          diagnostics.markdownlint.with({ extra_args = { '--disable MD041 MD051' } }),

          -- Formatters
          formatting.beautysh,
          formatting.black,
          formatting.isort,
          formatting.stylua.with({
            extra_args = {
              '--config-path',
              vim.fn.expand('~/.config/nvim/utils/linter-config/.stylua.toml'),
            },
          }),
          formatting.prettier.with({
            filetypes = { 'markdown', 'yaml', 'html' },
            extra_args = { '--prose-wrap', 'always' },
          }),
          formatting.rustfmt,
          formatting.goimports,
          formatting.gofmt,
          formatting.fixjson,
          -- formatting.swiftformat,

          -- Hover defs
          hover.dictionary,
          hover.printenv,
        },
        update_in_insert = false,
      })
    end,
  },
}
