-- Custom command to make a file whenever it's saved.
-- May only work with my way of writing Makefiles. The target name needs to be the name of the file without the extension. If your Makefile targets include the file extension then remove the 'r' from the vim.fn.expand part of the command
-- TODO: add the option to pass a string of the command that should be run for when there isn't a Makefile
vim.api.nvim_create_user_command('AutoMake', function()
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*' },
    command = 'silent AsyncRun make ' .. vim.fn.expand('%:t:r'), -- Remove 'r' here if make targets include extensions
  })
end, { nargs = 0 })

vim.api.nvim_create_user_command('AutoCompile', function(opts)
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*' },
    command = 'AsyncRun ' .. opts.args,
  })
end, { nargs = 1 })

vim.api.nvim_create_user_command('Daily', function()
  local function bar(total, current, name, length)
    -- Define defaults
    length = length or 50
    name = name or ''

    if current > total then
      current = total
    end

    local unit = length / total
    local filler = '■'
    local spacer = string.rep(' ', string.len(name) + 1)
    local line = string.rep('─', length)

    local full_bar = {}
    table.insert(full_bar, spacer .. '╭' .. line .. '╮')
    table.insert(
      full_bar,
      name
        .. ' │'
        .. string.rep(filler, math.floor(unit * current))
        .. string.rep(' ', length - math.floor(unit * current))
        .. '│'
    )
    table.insert(full_bar, spacer .. '╰' .. line .. '╯')

    return full_bar
  end

  local function put_text(text)
    for i = 1, #text do
      vim.api.nvim_buf_set_lines(0, i, i, true, { text[i] })
    end
  end

  -- Put text in opposite order it will appear in doc
  put_text(bar(6, os.date('*t').wday, 'Week'))
  put_text(bar(365, os.date('*t').yday, 'Year'))
  put_text(bar(90, os.date('%Y') - 2006, 'Life'))
end, { nargs = 0 })

vim.api.nvim_create_user_command('ZoteroCite', function()
  local format = 'pandoc'
  local api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format=' .. format .. '&brackets=1'
  local ref = vim.fn.system('curl -s "' .. api_call .. '"')
  vim.cmd('normal! i' .. ref)
end, { nargs = 0 })

vim.api.nvim_create_user_command('Sig', function()
  vim.cmd('r !echo ",\\n\\n\\nSincerely,\\nJonathan Milligan"')
  vim.cmd('r !/Users/jonathanmilligan/Documents/Email\\ Format/quotes')
end, { nargs = 0 })
