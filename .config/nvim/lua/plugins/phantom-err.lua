return {
  -- "phantom-err.nvim",
  -- dir = "~/Development/phantom-err.nvim/",
  "Bparsons0904/phantom-err.nvim",
  ft = "go",
  config = function()
    require("phantom-err").setup({
      auto_enable = true,
      mode = "full",
      dimming_mode = "conceal",
      reveal_mode = "normal",
    })
    addKeyMaps({
      {
        "n",
        "<leader>pt",
        "<cmd>PhantomToggle<CR>",
        "Run Command GoErrorToggle",
      },
      {
        "n",
        "<leader>ps",
        "<cmd>PhantomShow<CR>",
        "Run Command GoErrorShow",
      },
      {
        "n",
        "<leader>ph",
        "<cmd>PhantomHide<CR>",
        "Run Command GoErrorHide",
      },
    })
  end,
}
