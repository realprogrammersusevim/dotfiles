-- Custom command to make a file whenever it's saved.
-- May only work with my way of writing Makefiles. The target name needs to be the name of the file without the extension. If your Makefile targets include the file extension then remove the 'r' from the vim.fn.expand part of the command
-- TODO: add the option to pass a string of the command that should be run for when there isn't a Makefile
vim.api.nvim_create_user_command('AutoMake', function(opts)
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*' },
    command = 'silent AsyncRun make ' .. vim.fn.expand('%:t:r'), -- Remove 'r' here if make targets include extensions
  })
end, { nargs = 0 })
