return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  keys = {
    { '\\', ':NvimTreeOpen<CR>', desc = 'NvimTree Open', silent = true },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function() require('nvim-tree').setup {} end,
}
