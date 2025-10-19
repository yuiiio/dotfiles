return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    config = function()
        vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true })
    end,
}
