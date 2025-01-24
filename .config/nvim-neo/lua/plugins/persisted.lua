return {
  "olimorris/persisted.nvim",
  lazy = false,
  config = function()
    require("persisted").setup({
      autoload = true,
    })
  end,
}
