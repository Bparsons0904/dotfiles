return {
  "monkoose/matchparen.nvim",
  event = "BufReadPost",
  config = function()
    require("matchparen").setup()
  end,
}
