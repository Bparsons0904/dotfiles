return {
  "xeind/nightingale.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightingale").setup({
      transparent = true, -- set to true for transparent background
    })
  end,
}
