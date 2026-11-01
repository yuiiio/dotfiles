return {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({})
      vim.g.scrollbar_v2_notice = false
    end,
}
