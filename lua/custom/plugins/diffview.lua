return {
  'sindrets/diffview.nvim',
  lazy = true,
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
    { '<leader>gD', '<cmd>DiffviewClose<cr>', desc = 'Diffview Close' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview File History' },
  },
}
