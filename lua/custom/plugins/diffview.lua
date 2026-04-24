return {
  'sindrets/diffview.nvim',
  lazy = true,
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    vim.api.nvim_create_autocmd('BufNew', {
      group = vim.api.nvim_create_augroup('custom-diffview-noswapfile', { clear = true }),
      callback = function(args)
        if not vim.bo[args.buf].buflisted then vim.bo[args.buf].swapfile = false end
      end,
    })
  end,
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
    { '<leader>gD', '<cmd>DiffviewClose<cr>', desc = 'Diffview Close' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview File History' },
  },
}
