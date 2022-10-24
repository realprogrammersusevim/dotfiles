require('mason').setup()
require('mason-lspconfig').setup()

-- And now setup all the LSP servers automatically
require('mason-lsp-config').setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a specific handler
  function(server_name)
    require('lspconfig')[server_name].setup {}
  end,

  ['rust_analyzer'] = function(server_name)
    require('lspconfig')[server_name].setup {
      settings = {
        ['rust-analyzer'] = {
          assist = {
            importGranularity = 'module',
            importPrefix = 'by_self',
          },
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    }
  end,

  ['pyright'] = function(server_name)
    require('lspconfig')[server_name].setup {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    }
  end,
}
