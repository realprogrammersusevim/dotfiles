return {
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP servers (must match the binaries lsp.lua / roslyn.nvim launch).
        -- NOTE: ruff and ty are installed as standalone binaries via `uv tool
        -- install` instead of Mason. Mason installs them with pip, which under
        -- MSYS2's MinGW Python has no matching PyPI wheel and falls back to a
        -- (failing) from-source Rust build. The uv binaries land in
        -- ~/.local/bin, already on PATH.
        'lua-language-server',
        'pyright',
        'rust-analyzer',
        'marksman',
        'clangd',
        'typescript-language-server',
        'tinymist',
        'harper-ls',
        'roslyn-language-server',
        -- DAP adapters used by nvim-dap
        'netcoredbg',
        -- Formatters used by conform.nvim
        'shfmt',
      },
    },
  },
}
