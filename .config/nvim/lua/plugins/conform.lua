return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lc",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
    {
      "<leader>le",
      function()
        local filetype = vim.bo.filetype
        local js_ts_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
        if vim.tbl_contains(js_ts_filetypes, filetype) then
          require("conform").format({ formatters = { "eslint_d" }, async = true })
        else
          vim.notify("ESLint fix only available for JS/TS files", vim.log.levels.INFO)
        end
      end,
      desc = "ESLint fix",
    },
  },
  opts = {
    notify_on_error = true,

    format_after_save = {
      timeout_ms = 5000,
      lsp_fallback = true,
    },

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofumpt", "golines", "goimport" },
      javascript = { "eslint_d", "prettierd" },
      typescript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },
      typescriptreact = { "eslint_d", "prettierd" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      dart = { "dart_format" },
      sql = { "sqlfmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },

    format_options = {
      javascript = { stop_after_first = false },
      typescript = { stop_after_first = false },
      javascriptreact = { stop_after_first = false },
      typescriptreact = { stop_after_first = false },
    },

    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      eslint_d = {
        command = "eslint_d",
        args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
        stdin = true,
      },
      shfmt = {
        prepend_args = {
          "--indent",
          "2", -- Use 2 spaces for indentation
          "--case-indent", -- Indent case statements
          "--binary-next-line", -- Binary ops like && and || on next line
        },
      },
    },
  },
}
