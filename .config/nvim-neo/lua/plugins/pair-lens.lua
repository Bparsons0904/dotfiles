return {
  "nabekou29/pair-lens.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("pair-lens").setup()
  end,
}
