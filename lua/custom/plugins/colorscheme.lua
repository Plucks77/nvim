return {
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 100,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1,
    init = function()
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'black' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'black' })
    end,
  },
  {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1,
  },
  {
    'oxfist/night-owl.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('night-owl').setup {
        bold = true,
        italics = false,
        underline = true,
        undercurl = true,
      }
    end,
  },
  { 'kepano/flexoki' },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 0,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        contrast = '',
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
    end,
  },
}
