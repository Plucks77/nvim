return {
  {
    'oxfist/night-owl.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('night-owl').setup {
        bold = true,
        italics = false,
        underline = true,
        undercurl = true,
        -- transparent_background = true,
      }

      vim.cmd.colorscheme 'night-owl'
    end,
  },
}
