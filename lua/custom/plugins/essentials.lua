return {
  'tpope/vim-sleuth',

  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
    },
  },

  { 'tpope/vim-fugitive' },
  { 'rest-nvim/rest.nvim' },
  { 'mbbill/undotree' },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors'):setup()
    end,
  },
}
