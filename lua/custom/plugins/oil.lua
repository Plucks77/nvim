return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        keymaps = {
          ['<C-h>'] = false,
        },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open Oil' })
    end,
  },
}
