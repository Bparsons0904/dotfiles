return {
  "simnalamburt/vim-mundo",
  keys = {
    { "<leader>u", "<cmd>MundoToggle<cr>", desc = "Toggle undo tree" },
  },
  config = function()
    vim.g.mundo_width = 60
    vim.g.mundo_preview_height = 15
    vim.g.mundo_right = 1
  end,
}
