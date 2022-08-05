" Only loads these options if I'm not using the vscode-neovim plugin.
if !exists('g:vscode')

	" Load every plugin
	source ~/.config/nvim/plugins.vim

	" Load my Lua customization for Lua only config options
	luafile ~/.config/nvim/nvim_init.lua

	" Load the configurations for the plugins
	source ~/.config/nvim/plugin_config.vim

	" Load the rest of my random NeoVim configuration
	source ~/.config/nvim/other_nvim_config.vim

	" Load the custom commands that I've written
	source ~/.config/nvim/custom_nvim_commands.vim

endif
