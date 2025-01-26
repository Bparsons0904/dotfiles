return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- for git integration
  },
  config = function()
    require("scrollbar").setup({
      show = true,
      handle = {
        text = " ",
        color = "#4A4A4A",
        hide_if_all_visible = true,
      },
      marks = {
        Search = { color = "#ff9e64" },
        Error = { color = "#db4b4b" },
        Warn = { color = "#e0af68" },
        Info = { color = "#0db9d7" },
        Hint = { color = "#1abc9c" },
        Misc = { color = "#9d7cd8" },
        GitAdd = { color = "#449dab" },
        GitChange = { color = "#6183bb" },
        GitDelete = { color = "#914c54" },
      },
      handlers = {
        gitsigns = true,
      },
    })
  end,
}
