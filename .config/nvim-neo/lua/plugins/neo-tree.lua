return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup({
      use_popups_for_input = false,
    })
  end,

  addKeyMaps({
    {
      "n",
      "<leader>e",
      "<cmd>Neotree reveal position=float<CR>",
      "Toggle file explorer on current file in a float",
    },
    -- {
    -- 	"n",
    -- 	"<leader>es",
    -- 	"<cmd>Neotree reveal position=left<CR>",
    -- 	"Toggle file explorer on current file on left Window",
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>eb",
    -- 	"<cmd>Neotree buffers position=float<CR>",
    -- 	"Toggle file explorer on current file in a float",
    -- },
  }),
}
