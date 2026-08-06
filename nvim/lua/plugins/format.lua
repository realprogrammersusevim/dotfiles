-- Format only the git-changed line ranges of the current buffer.
--
-- Roslyn's LSP formatter is whole-document: on a legacy codebase that was never
-- uniformly roslyn-formatted (BTNet), saving any file rewrites every
-- non-conforming blank line in it, so a 3-line edit produces a whole-file diff.
-- Instead we diff the in-memory buffer against its git index blob and ask
-- conform to range-format each changed hunk, leaving untouched methods alone.
local function format_changed_lines(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local conform = require('conform')

  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == '' then
    return
  end

  local dir = vim.fn.fnamemodify(name, ':h')
  local basename = vim.fn.fnamemodify(name, ':t')

  -- Index (staged) version of the file. NOTE: we can't `git diff` here because
  -- at BufWritePre the on-disk file still holds the OLD content; the unsaved
  -- edits live only in the buffer. So we diff the buffer against the blob.
  local index = vim.fn.systemlist({ 'git', '-C', dir, 'show', ':./' .. basename })
  if vim.v.shell_error ~= 0 then
    -- Untracked / new file: no baseline to diff, so format the whole thing once.
    conform.format({ bufnr = bufnr, lsp_format = 'prefer', timeout_ms = 3000 })
    return
  end

  local buf_lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local hunks = vim.diff(
    table.concat(index, '\n'),
    table.concat(buf_lines, '\n'),
    { result_type = 'indices' }
  )
  if not hunks then
    return
  end

  -- Bottom-to-top: formatting a lower hunk can shift line numbers, so process
  -- in reverse to keep the not-yet-handled upper hunks' ranges valid.
  for i = #hunks, 1, -1 do
    local start_b, count_b = hunks[i][3], hunks[i][4]
    if count_b > 0 then
      local last = start_b + count_b - 1
      conform.format({
        bufnr = bufnr,
        lsp_format = 'prefer',
        timeout_ms = 3000,
        range = {
          start = { start_b, 0 },
          ['end'] = { last, #(buf_lines[last] or '') },
        },
      })
    end
  end
end

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- C#/VB are handled by the changed-lines autocmd below so roslyn's
        -- whole-file reformat doesn't churn untouched methods.
        local ft = vim.bo[bufnr].filetype
        if ft == 'cs' or ft == 'vb' then
          return
        end
        return {
          lsp_format = 'prefer',
          timeout_ms = 500,
        }
      end,
      formatters = {
        prettier = {
          -- Windows-native nvim can't find the MSYS2 prettier on PATH, and
          -- libuv is flaky spawning the .cmd wrapper. Run it via node directly.
          command = 'C:/msys64/ucrt64/bin/node.exe',
          prepend_args = {
            'C:/msys64/ucrt64/lib/node_modules/prettier/bin/prettier.cjs',
            '--prose-wrap', 'always',
          },
        },
      },
      formatters_by_ft = {
        markdown = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        yaml = { 'prettier' },
        bash = { 'shfmt' },
      }
    },
    config = function(_, opts)
      require('conform').setup(opts)
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.cs', '*.vb' },
        desc = 'Format only git-changed lines (avoids roslyn whole-file churn)',
        callback = function(args)
          format_changed_lines(args.buf)
        end,
      })
    end,
  }
}
