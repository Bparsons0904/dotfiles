return {
  "ray-x/go.nvim",
  enabled = true,
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',

  vim.api.nvim_set_keymap("n", "<leader>Gc", ":GoCodeLen<CR>", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>Gi", ":GoToggleInlay<CR>", { noremap = true, silent = true }),
}
