require('null-ls').setup({
  local null_ls = require('null-ls')

  sources = {
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.alex,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.selene
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.proselint,
    null_ls.builtins.diagnostics.vale,
    null_ls.builtins.diagnostics.vint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.beautysh,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.hover.dictionary,
    null_ls.builtins.hover.printenv,
  }
})
