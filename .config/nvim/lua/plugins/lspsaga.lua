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
        auto_save = false,
      },
      outline = {
        layout = "float",
        max_height = 1,
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
      code_action = {
        num_shortcut = true,
        show_server_name = false,
        keys = {
          quit = { "q", "<ESC>" },
          exec = "<CR>",
        },
        filter = function(actions)
          -- Sort actions to prioritize import-related ones
          table.sort(actions, function(a, b)
            local a_title = (a.title or ""):lower()
            local b_title = (b.title or ""):lower()

            -- Prioritize import actions
            local a_is_import = a_title:match("import") or a_title:match("add missing") or a_title:match("organize")
            local b_is_import = b_title:match("import") or b_title:match("add missing") or b_title:match("organize")

            if a_is_import and not b_is_import then
              return true
            elseif not a_is_import and b_is_import then
              return false
            end

            -- Among import actions, prioritize "add missing imports"
            local a_is_add_import = a_title:match("add missing")
            local b_is_add_import = b_title:match("add missing")

            if a_is_add_import and not b_is_add_import then
              return true
            elseif not a_is_add_import and b_is_add_import then
              return false
            end

            return false
          end)
          return actions
        end,
      },
    })

    addKeyMaps({
      { "n", "<leader>lf", "<cmd>Lspsaga finder<CR>", "LSP Finder" },
      { { "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code Actions" },
      { "n", "<leader>lI", function()
        vim.lsp.buf.code_action({
          filter = function(action)
            local title = (action.title or ""):lower()
            return title:match("import") or title:match("add missing") or title:match("organize")
          end,
          apply = true,
        })
      end, "Import Actions Only" },
      { "n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
      { "n", "<leader>ln", "<cmd>Lspsaga rename ++project<CR>", "Rename Symbol" },
      { "n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation" },
      { "n", "<leader>o", "<cmd>Lspsaga outline<CR>", "Toggle Outline" },
      { { "n", "t" }, "<A-t>", "<cmd>Lspsaga term_toggle<CR>", "Toggle Terminal" },
      { "n", "<leader>li", "<cmd>Lspsaga incoming_calls<CR>", "Toggle Terminal" },
      { "n", "<leader>lo", "<cmd>Lspsaga outgoing_calls<CR>", "Toggle Terminal" },
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
