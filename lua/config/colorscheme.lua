local M = {}

local default = 'tokyonight-night'
local path = vim.fn.stdpath 'config' .. '/colorscheme'
local legacy_path = vim.fn.stdpath 'state' .. '/colorscheme'

local function read_name(file_path)
  local file = io.open(file_path, 'r')
  if not file then
    return nil
  end

  local name = file:read '*l'
  file:close()
  return name and vim.trim(name) or nil
end

function M.save(name)
  if not name or name == '' then
    return
  end

  local file = io.open(path, 'w')
  if file then
    file:write(name)
    file:close()
  end
end

function M.load()
  local name = read_name(path) or read_name(legacy_path)
  name = name or default

  if not pcall(vim.cmd.colorscheme, name) then
    vim.notify(('Colorscheme "%s" unavailable, using %s'):format(name, default), vim.log.levels.WARN)
    vim.cmd.colorscheme(default)
  end
end

function M.setup()
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
      M.load()
    end,
  })

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('colorscheme-persist', { clear = true }),
    callback = function()
      if vim.g.colors_name then
        M.save(vim.g.colors_name)
      end
    end,
  })
end

return M
