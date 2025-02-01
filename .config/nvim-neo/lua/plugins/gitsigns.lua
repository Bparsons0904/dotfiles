return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup()
    require("scrollbar.handlers.gitsigns").setup()
  end,

  opts = {
    on_attach = function()
      local gs = package.loaded.gitsigns

      addKeyMaps({
        -- { "n", "<leader>gb", gs.toggle_current_line_blame, "Toggle line blame" },
        { "n", "<leader>hd", gs.diffthis, "Diff this" },
      })
    end,
  },
}
