return {
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- MUST stay off for BTNet. broad_search makes roslyn.nvim walk DOWN the
      -- directory tree hunting for .sln files, which descends into node_modules,
      -- packages, TestResults, .git, etc. and blocks the main thread for ~14s on
      -- every C# buffer open. The default upward search is cheap and sufficient
      -- here because BuilderTREND.sln lives at the repo root, so any nested file
      -- finds it by walking up its parents.
      broad_search = false,
      -- Once we've attached to BuilderTREND.sln, stop re-prompting for a target.
      lock_target = true,
      -- Let Roslyn own file watching. Neovim's own watcher chokes on a tree this
      -- size (node_modules, packages, TestResults, .git) on Windows.
      filewatching = "roslyn",
      -- Both BuilderTREND.sln and BuildertrendLinux.sln sit at the root; prefer
      -- the main solution so we're not asked which target every session.
      choose_target = function(targets)
        return vim.iter(targets):find(function(t)
          return t:match("BuilderTREND%.sln$")
        end)
      end,
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  }
}
