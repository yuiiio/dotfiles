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

            local home = os.getenv("HOME")
            vim.lsp.config("rust_analyzer", {
                cmd = { home .. "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer" },

                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            -- プロジェクトの .cargo/config.toml からターゲット(xtensa-...)を自動検出させる
                            targetFromDiscover = true,

                            -- sysroot(標準ライブラリ群)や build-std を自動検出して解析に含める
                            sysroot = "discover",
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                        checkOnSave = true,
                        check = {
                            -- 特有のFeature依存エラーを防ぐため、チェック時もワークスペースの設定に合わせる
                            command = "check",
                        },
                    },
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
