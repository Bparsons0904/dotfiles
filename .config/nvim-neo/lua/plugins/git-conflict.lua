return {
  "akinsho/git-conflict.nvim",
  version = "*",
  enabled = false,
  config = function()
    require("git-conflict").setup({
      default_mappings = true, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffAdd",
        current = "DiffText",
      },
    })

    -- Custom keymaps for conflict resolution
    addKeyMaps({
      { "n", "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", "Choose our changes" },
      { "n", "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", "Choose their changes" },
      { "n", "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", "Choose both changes" },
      { "n", "<leader>gc0", "<cmd>GitConflictChooseNone<cr>", "Choose none of the changes" },
      { "n", "]c", "<cmd>GitConflictNextConflict<cr>", "Move to next conflict" },
      { "n", "[c", "<cmd>GitConflictPrevConflict<cr>", "Move to previous conflict" },
      { "n", "<leader>gcl", "<cmd>GitConflictListQf<cr>", "List all conflicts in quickfix" },
    })
  end,
}
