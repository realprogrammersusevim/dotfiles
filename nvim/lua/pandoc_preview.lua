-- Live preview for pandoc markdown. Pandoc renders the buffer to Typst in a
-- temp dir on every (debounced) change, and tinymist's preview server -- the
-- same one typst-preview.nvim uses -- watches that file and hot-reloads the
-- browser.
local M = {}

local DEBOUNCE_MS = 300
local IMAGE_FILTER = vim.fn.stdpath('config') .. '/utils/pandoc/absolute-images.lua'

local previews = {} -- bufnr -> { dir, typ, cwd, timer, job, rendering, dirty, last_err }

local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = 'PandocPreview' })
end

local function buf_text(buf)
  return table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), '\n')
end

local function buf_dir(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  return name ~= '' and vim.fn.fnamemodify(name, ':p:h') or vim.fn.getcwd()
end

local function pandoc_cmd(out)
  return {
    'pandoc', '-f', 'markdown', '-t', 'typst', '-s',
    '--lua-filter', IMAGE_FILTER, '--citeproc', '-o', out,
  }
end

-- Render to a .part file and rename it into place, so tinymist never compiles
-- a half-written file. Only one pandoc runs per buffer; edits made while it
-- runs trigger one follow-up render.
local function render(buf)
  local p = previews[buf]
  if not p then return end
  if p.rendering then
    p.dirty = true
    return
  end
  p.rendering = true

  local part = p.typ .. '.part'
  vim.system(pandoc_cmd(part), { stdin = buf_text(buf), cwd = p.cwd, text = true }, function(res)
    vim.schedule(function()
      if previews[buf] ~= p then return end -- stopped while rendering
      p.rendering = false
      if res.code == 0 then
        vim.uv.fs_rename(part, p.typ)
        p.last_err = nil
      elseif res.stderr ~= p.last_err then -- don't repeat the same error on every keystroke
        p.last_err = res.stderr
        notify('pandoc failed: ' .. vim.trim(res.stderr), vim.log.levels.WARN)
      end
      if p.dirty then
        p.dirty = false
        render(buf)
      end
    end)
  end)
end

function M.stop(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  local p = previews[buf]
  if not p then return end
  previews[buf] = nil
  p.timer:stop()
  p.timer:close()
  pcall(vim.api.nvim_del_augroup_by_name, 'PandocPreview' .. buf)
  if p.job then p.job:kill('sigterm') end
  vim.fn.delete(p.dir, 'rf')
end

function M.start(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  if previews[buf] then return end

  local tinymist = vim.fn.exepath('tinymist')
  if tinymist == '' or vim.fn.executable('pandoc') == 0 then
    notify('needs both pandoc and tinymist on $PATH', vim.log.levels.ERROR)
    return
  end

  local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t:r')
  if name == '' then name = 'preview' end
  local dir = vim.fn.tempname()
  vim.fn.mkdir(dir, 'p')
  -- macOS tempdirs live under /var, a symlink to /private/var. tinymist's file
  -- watcher gets events for the /private path and silently ignores them unless
  -- it was given the resolved path.
  dir = vim.uv.fs_realpath(dir) or dir

  local p = {
    dir = dir,
    typ = dir .. '/' .. name .. '.typ',
    cwd = buf_dir(buf), -- so relative bibliography/image paths resolve
    timer = vim.uv.new_timer(),
  }
  previews[buf] = p

  -- First render runs synchronously: tinymist needs the file to exist.
  local res = vim.system(pandoc_cmd(p.typ), { stdin = buf_text(buf), cwd = p.cwd, text = true }):wait()
  if res.code ~= 0 then
    p.last_err = res.stderr
    notify('pandoc failed: ' .. vim.trim(res.stderr), vim.log.levels.WARN)
    vim.fn.writefile({}, p.typ)
  end

  p.job = vim.system({
    tinymist, 'preview', '--open',
    '--root', '/', -- the image filter emits absolute paths
    -- Random ports, so several previews (and typst-preview.nvim) can coexist
    '--data-plane-host', '127.0.0.1:0',
    '--control-plane-host', '127.0.0.1:0',
    '--page-title', name,
    p.typ,
  }, { stdout = false, stderr = false }, function(out)
    vim.schedule(function()
      if previews[buf] ~= p then return end -- we stopped it ourselves
      notify('tinymist exited (code ' .. out.code .. ')', vim.log.levels.WARN)
      M.stop(buf)
    end)
  end)

  local group = vim.api.nvim_create_augroup('PandocPreview' .. buf, { clear = true })
  vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
    group = group,
    buffer = buf,
    callback = function()
      p.timer:stop()
      p.timer:start(DEBOUNCE_MS, 0, vim.schedule_wrap(function() render(buf) end))
    end,
  })
  vim.api.nvim_create_autocmd({ 'BufUnload', 'BufWipeout' }, {
    group = group,
    buffer = buf,
    callback = function() M.stop(buf) end,
  })
end

function M.toggle(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  if previews[buf] then M.stop(buf) else M.start(buf) end
end

-- Build a PDF next to the markdown file via pandoc's Typst engine, then open it
-- in sioyek (which reloads on change if it's already open).
function M.pdf(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  if file == '' then
    notify('buffer has no file name', vim.log.levels.ERROR)
    return
  end
  local pdf = vim.fn.fnamemodify(file, ':p:r') .. '.pdf'
  notify('building ' .. vim.fn.fnamemodify(pdf, ':t') .. '...')
  vim.system(
    { 'pandoc', '-f', 'markdown', '--citeproc', '--pdf-engine=typst', '-o', pdf },
    { stdin = buf_text(buf), cwd = buf_dir(buf), text = true },
    function(res)
      vim.schedule(function()
        if res.code ~= 0 then
          notify('PDF build failed: ' .. vim.trim(res.stderr), vim.log.levels.ERROR)
          return
        end
        vim.system({ 'sioyek', pdf })
      end)
    end
  )
end

vim.api.nvim_create_user_command('PandocPreview', function() M.toggle() end,
  { desc = 'Toggle live pandoc markdown preview' })
vim.api.nvim_create_user_command('PandocPdf', function() M.pdf() end,
  { desc = 'Build PDF with pandoc + typst and open in sioyek' })

vim.api.nvim_create_autocmd('VimLeavePre', {
  group = vim.api.nvim_create_augroup('PandocPreviewCleanup', { clear = true }),
  callback = function()
    for buf in pairs(previews) do M.stop(buf) end
  end,
})

return M
