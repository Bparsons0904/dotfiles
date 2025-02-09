return {
  "monkoose/matchparen.nvim",
  event = "BufReadPost",
  config = function()
    require("matchparen").setup({
      on_startup = true, -- Should it be enabled by default
      hl_group = "MatchParen", -- Highlight group for matched brackets
      delay = 100, -- Timeout for highlighting in ms
    })
  end,
}
