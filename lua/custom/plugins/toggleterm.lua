return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = 'ToggleTerm',
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
  },
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'float',
  },
}
