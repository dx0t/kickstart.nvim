return {
  'sindrets/diffview.nvim',
  lazy = true,
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    local RevType = require('diffview.vcs.rev').RevType

    local function update_index_hunk(source_rev_type)
      local view = require('diffview.lib').get_current_view()
      local entry = view and view:infer_cur_file()
      local layout = entry and entry.layout

      if not (layout and layout.a and layout.b) then
        vim.notify('No Diffview hunk available', vim.log.levels.WARN)
        return
      end

      local index_win
      local source_win
      for _, win in ipairs { layout.a, layout.b } do
        local rev = win.file and win.file.rev
        if rev and rev.type == RevType.STAGE and rev.stage == 0 then
          index_win = win
        elseif rev and rev.type == source_rev_type then
          source_win = win
        end
      end

      if not (index_win and source_win and index_win:is_valid() and source_win:is_valid()) then
        vim.notify('This Diffview pane cannot update the index hunk', vim.log.levels.WARN)
        return
      end

      local cur_win = vim.api.nvim_get_current_win()
      local cur_pos = vim.api.nvim_win_get_cursor(cur_win)

      index_win:focus()
      pcall(vim.api.nvim_win_set_cursor, index_win.id, cur_pos)
      vim.cmd 'diffget'
      vim.cmd 'write'

      if vim.api.nvim_win_is_valid(cur_win) then vim.api.nvim_set_current_win(cur_win) end
    end

    return {
      keymaps = {
        view = {
          { 'n', '<leader>hs', function() update_index_hunk(RevType.LOCAL) end, { desc = 'git [s]tage hunk' } },
          { 'n', '<leader>hu', function() update_index_hunk(RevType.COMMIT) end, { desc = 'git [u]nstage hunk' } },
        },
      },
    }
  end,
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
