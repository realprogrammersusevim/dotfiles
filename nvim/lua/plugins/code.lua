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
      { 'ray-x/cmp-treesitter' },
      { 'jc-doyle/cmp-pandoc-references' },
      { 'chrisgrieser/cmp-nerdfont' },
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
          { name = 'treesitter' },
          { name = 'pandoc-references' },
          { name = 'nerdfont' },
        },
        formatting = {
          format = lspkind.cmp_format({
            preset = 'codicons',
            mode = 'symbol',
            maxwidth = 50,
            ellipsis = '…',
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
            cmp.config.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            -- cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' },
        },
      })

      cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    end,
  },

  {
    'numToStr/Comment.nvim', -- Comment stuff out
    event = 'BufRead',
    config = true,
  },

  {
    'lewis6991/gitsigns.nvim', -- Git signs in the gutter
    event = 'VeryLazy',
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
            extra_args = { '--tooWordy', '--so', '--cliches' },
          }),
          diagnostics.jsonlint,
          diagnostics.ruff,
          diagnostics.codespell.with({
            extra_args = { '-L', 'crate' }, -- Fix annoying Rust errors
          }),

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

  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function()
      vim.api.nvim_create_augroup('neogit-additions', {})
      vim.api.nvim_create_autocmd('FileType', {
        group = 'neogit-additions',
        pattern = 'NeogitCommitMessage',
        command = 'silent! set filetype=gitcommit',
      })

      require('neogit').setup({
        signs = {
          section = { '', '' },
          item = { '', '' },
          hunk = { '', '' },
        },
        integrations = {
          diffview = true,
        },
      })
    end,
  },

  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    event = 'InsertEnter',
    opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = '<M-l>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = false,
        markdown = true, -- Overrode the defaults here. Not as annoying since I only use it through cmp
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node version must be < 18
      plugin_manager_path = vim.fn.stdpath('data') .. '/site/pack/packer',
      server_opts_overrides = {},
    },
  },
}
