return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("omnisharp", {
                cmd = {
                    vim.fn.expand("~/.local/opt/omnisharp/OmniSharp"),
                    "--languageserver",
                },
            })

            vim.lsp.enable("clangd")
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("gopls")          -- Go
            vim.lsp.enable("pyright")        -- Python
            vim.lsp.enable("bashls")         -- Shell
            vim.lsp.enable("jsonls")         -- JSON
            vim.lsp.enable("html")           -- HTML
            vim.lsp.enable("ts_ls")          -- TypeScript
            vim.lsp.enable("omnisharp")      -- C#
            vim.lsp.enable("lua_ls")         -- Lua

            local keyset = vim.keymap.set
            --keyset("n", "gd", vim.lsp.buf.definition)
            --keyset("n", "gy", vim.lsp.buf.type_definition)
            --keyset("n", "gi", vim.lsp.buf.implementation)
            --keyset("n", "gr", vim.lsp.buf.references)

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "gr", builtin.lsp_references)
            vim.keymap.set("n", "gd", builtin.lsp_definitions)
            vim.keymap.set("n", "gi", builtin.lsp_implementations)
            vim.keymap.set("n", "gy", builtin.lsp_type_definitions)
        end,
    }
}
