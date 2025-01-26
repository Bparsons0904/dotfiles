return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup()
    require("scrollbar.handlers.gitsigns").setup()
  end,

  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle line blame")
      map("n", "<leader>hd", gs.diffthis, "Diff this")
    end,
  },
}
