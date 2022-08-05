" Only loads these options if I'm not using the vscode-neovim plugin.
if !exists('g:vscode')

	" Load my Lua customization for Lua only config options
	luafile nvim_init.lua

	" Load every plugin
	source plugins.vim

	" Load the configurations for the plugins
	source plugin_config.vim

	" Load the rest of my random NeoVim configuration
	source other_nvim_config.vim

	" Finally, load the custom commands that I've written
	source custom_nvim_commands.vim

endif
