return {
  filetypes = { "python" },

  init_options = {
    settings = {
      -- Ruff server configuration
      lint = {
        -- Enable all rules by default, can be customized per project
        enable = true,
        -- Run linting on save
        run = "onSave",
      },

      format = {
        -- Enable formatting capabilities
        enable = true,
      },

      -- LSP-specific settings
      organizeImports = true,
      fixAll = true,

      -- Code action settings
      codeAction = {
        -- Enable auto-fix code actions
        disableRuleComment = {
          enable = true,
        },
        fixViolation = {
          enable = true,
        },
      },
    },
  },

  on_attach = function(client, bufnr)
    -- Disable hover in favor of basedpyright
    client.server_capabilities.hoverProvider = false

    -- Enable code actions for auto-fixing
    if client.server_capabilities.codeActionProvider then
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.fixAll' } } })<CR>",
        { noremap = true, silent = true, desc = "Ruff: Fix all auto-fixable issues" }
      )

      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>lo",
        "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } } })<CR>",
        { noremap = true, silent = true, desc = "Ruff: Organize imports" }
      )
    end
  end,
}
