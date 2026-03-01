return {
  "uga-rosa/translate.nvim",
  config = function()
    require("translate").setup({
      default = {
        command = "google",
        output = "floating", -- デフォルトをポップアップ表示に設定
      },
    })

    -- キーバインドの設定
    local opts = { silent = true, desc = "Translate to Japanese" }
    
    -- ビジュアルモードで選択して <leader>t で翻訳
    -- (gv は直前の選択範囲を再選択するコマンドで、範囲を確定させます)
    vim.keymap.set("v", "t", ":Translate ja<CR>", opts)
  end,
}
