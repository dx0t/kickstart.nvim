return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermSelect' },
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
    { '<leader>t1', '<cmd>1ToggleTerm<cr>', desc = 'Toggle terminal 1' },
    { '<leader>t2', '<cmd>2ToggleTerm<cr>', desc = 'Toggle terminal 2' },
    { '<leader>t3', '<cmd>3ToggleTerm<cr>', desc = 'Toggle terminal 3' },
    { '<leader>t4', '<cmd>4ToggleTerm<cr>', desc = 'Toggle terminal 4' },
    { '<leader>ta', '<cmd>ToggleTermToggleAll<cr>', desc = 'Toggle all terminals' },
    { '<leader>ts', '<cmd>TermSelect<cr>', desc = 'Select terminal' },
  },
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'float',
  },
}
