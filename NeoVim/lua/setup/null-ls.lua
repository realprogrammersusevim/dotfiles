require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.shellcheck,
    require('null-ls').builtins.diagnostics.checkmake,
    require('null-ls').builtins.diagnostics.selene,
    require('null-ls').builtins.diagnostics.mypy,
    require('null-ls').builtins.diagnostics.vint,
    require('null-ls').builtins.diagnostics.yamllint,
    require('null-ls').builtins.diagnostics.proselint,
    require('null-ls').builtins.formatting.beautysh,
    require('null-ls').builtins.formatting.black,
    require('null-ls').builtins.formatting.isort,
    require('null-ls').builtins.formatting.lua_format,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.hover.dictionary,
    require('null-ls').builtins.hover.printenv,
  },
})
