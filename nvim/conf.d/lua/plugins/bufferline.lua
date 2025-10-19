return {
    {
        'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "ordinal",
                    diagnostics = "coc",
                    separator_style = "slant",
                    diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or ""
                        return " " .. icon
                    end,
                },
            })
            vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true })
        end,
    }
}
