return {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "lua",
        "css",
        "html",
        "javascript",
        "typescript",
      })
    end,
}
