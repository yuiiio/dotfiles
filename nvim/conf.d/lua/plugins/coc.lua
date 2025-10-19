return {
    {
        'neoclide/coc.nvim',
        branch = 'release', 
        config = function()
      local keyset = vim.keymap.set
      keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
      keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
    end,
    }
}
