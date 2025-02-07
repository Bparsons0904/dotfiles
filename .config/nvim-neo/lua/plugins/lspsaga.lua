return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        code_action = "💡",
      },
      lightbulb = {
        enable = false,
        sign = true,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = true,
        separator = " › ",
      },
      diagnostic = {
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
      rename = {
        quit = "<ESC>",
        in_select = false,
        auto_save = true,
      },
      outline = {
        layout = "float",
        max_height = 1,
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
    })

    addKeyMaps({
      { "n", "<leader>lf", "<cmd>Lspsaga finder<CR>", "LSP Finder" },
      { { "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code Actions" },
      { "n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
      { "n", "<leader>ln", "<cmd>Lspsaga rename ++project<CR>", "Rename Symbol" },
      { "n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation" },
      { "n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
      { "n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Cursor Diagnostics" },
      { "n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
      { "n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
      {
        "n",
        "[e",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        "Previous Error",
      },
      {
        "n",
        "]e",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        "Next Error",
      },
      { "n", "<leader>o", "<cmd>Lspsaga outline<CR>", "Toggle Outline" },
      { { "n", "t" }, "<A-t>", "<cmd>Lspsaga term_toggle<CR>", "Toggle Terminal" },
      { "n", "<leader>li", "<cmd>Lspsaga incoming_calls<CR>", "Toggle Terminal" },
      { "n", "<leader>lo", "<cmd>Lspsaga outgoing_calls<CR>", "Toggle Terminal" },
      { "n", "<leader>ld", "<cmd>Lspsaga hover_doc<CR>", "Toggle Terminal" },
    })
  end,
}

-- { { "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code Actions" },
-- { "n", "gh", "<cmd>Lspsaga finder<CR>", "LSP Finder" },
-- { "n", "gp", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
-- { "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename Symbol" },
-- { "n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
-- { "n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
-- {
--   "n",
--   "[E",
--   function()
--     require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
--   end,
--   "Previous Error",
-- },
-- {
--   "n",
--   "]E",
--   function()
--     require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
--   end,
--   "Next Error",
-- },
-- { { "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", "Toggle Terminal" },
