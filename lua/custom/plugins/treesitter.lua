local ensure_installed = {
  'bash',
  'c',
  'html',
  'lua',
  'markdown',
  'ruby',
  'vim',
  'vimdoc',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    main = 'nvim-treesitter',
    opts = {},
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          if ft == '' then
            return
          end

          if not pcall(vim.treesitter.start, args.buf) then
            return
          end

          if ft == 'ruby' then
            vim.cmd.syntax 'enable'
          elseif ft ~= 'ruby' then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)

      local already_installed = require('nvim-treesitter').get_installed 'parsers'
      local to_install = vim.iter(ensure_installed)
        :filter(function(lang)
          return not vim.tbl_contains(already_installed, lang)
        end)
        :totable()

      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end
    end,
  },
}
