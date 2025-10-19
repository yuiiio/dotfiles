return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local colors_dark = {
                blue = "#5fafd7",
                cyan = "#d7875f",
                black = "#1c1c1c",
                white = "#d0d0d0",
                red = "#af005f",
                violet = "#af87d7",
                grey = "#bcbcbc",
            }
            local colors_light = {
                blue = "#0087af",
                cyan = "#005f87",
                black = "#eeeeee",
                white = "#764e37",
                red = "#af0000",
                violet = "#8700af",
                grey = "#bcbcbc",
            }

            local colors = colors_light

            local opt_theme = {
                normal = {
                    a = { fg = colors.black, bg = colors.violet },
                    b = { fg = colors.white, bg = colors.grey },
                    c = { fg = colors.white },
                },

                insert = { a = { fg = colors.black, bg = colors.blue } },
                visual = { a = { fg = colors.black, bg = colors.cyan } },
                replace = { a = { fg = colors.black, bg = colors.red } },

                inactive = {
                    a = { fg = colors.white, bg = colors.black },
                    b = { fg = colors.white, bg = colors.black },
                    c = { fg = colors.white },
                },
            }

            require("lualine").setup({
                options = {
                    theme = opt_theme,
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                    lualine_b = { "filename", "branch" },
                    lualine_c = {
                        "%=", --[[ add your center compoentnts here in place of this comment ]]
                    },
                    lualine_x = {},
                    lualine_y = { "filetype", "progress" },
                    lualine_z = {
                        { "location", separator = { right = "" }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                tabline = {},
                extensions = {},
            })
        end,
    }
}
