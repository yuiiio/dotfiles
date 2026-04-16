return {
    "brenoprata10/nvim-highlight-colors",
    opts = {
        render = 'background', -- 'background', 'foreground', 'virtual' (VSCode風)
        enable_tailwind = true,
    },
    config = function(_, opts)
        require("nvim-highlight-colors").setup(opts)
    end,
}
