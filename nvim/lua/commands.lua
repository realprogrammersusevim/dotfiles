-- Custom command to make a file whenever it's saved.
-- May only work with my way of writing Makefiles. The target name needs to be the name of the file without the extension. If your Makefile targets include the file extension then remove the 'r' from the vim.fn.expand part of the command
-- TODO: add the option to pass a string of the command that should be run for when there isn't a Makefile
vim.api.nvim_create_user_command('AutoMake', function()
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*' },
    command = 'silent AsyncRun make',
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

vim.api.nvim_create_user_command('MarkdownFollowLink', function()
  local current_line = vim.api.nvim_get_current_line()
  local _, cur_col = unpack(vim.api.nvim_win_get_cursor(0))

  local current_line_lh = current_line:sub(0, cur_col + 2)

  -- Search for two open brackets followed by any number of non-open bracket
  -- characters nor close bracket characters
  local open = current_line_lh:find('%[%[[^%[%]]*%]?%]?$')
  local close = current_line:find('%]%]', cur_col)

  if open == nil or close == nil then
    print('Could not find link on line')
    return
  end

  local note_name = current_line:sub(open + 2, close - 1)
  local note_file_name = note_name

  if note_file_name:match('|[^%]]*') then
    note_file_name = note_file_name:sub(1, note_file_name:find('|') - 1)
  end

  if not note_file_name:match('%.md') then
    note_file_name = note_file_name .. '.md'
  end

  vim.ui.select({ 'current', 'new tab', 'split', 'vsplit' }, {
    prompt = 'How would you like to open the link?',
    format_item = function(item)
      return 'Open in ' .. item
    end,
  }, function(choice)
    if choice == 'current' then
      vim.cmd.e(note_file_name)
    elseif choice == 'new tab' then
      vim.cmd.tabnew(note_file_name)
    elseif choice == 'split' then
      vim.cmd.split(note_file_name)
    elseif choice == 'vsplit' then
      vim.cmd.vsplit(note_file_name)
    end
  end)
end, { nargs = 0 })

vim.api.nvim_create_user_command('ZoteroCite', function()
  local format = 'pandoc'
  local api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format=' .. format .. '&brackets'
  local ref = vim.fn.system('curl -s "' .. api_call .. '"')
  vim.cmd('normal! i' .. ref)
end, { nargs = 0 })
