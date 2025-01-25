return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = true,

    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      -- Don't format if we're in a disabled filetype
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return
      end

      return {
        timeout_ms = 750,
        -- Run Prettier last, after any ESLint non-formatting fixes
        async = false,
        lsp_fallback = false,
      }
    end,

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofumpt", "golines", "goimport" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
    },

    -- Configure format options by filetype
    format_options = {
      javascript = { stop_after_first = true },
      typescript = { stop_after_first = true },
      javascriptreact = { stop_after_first = true },
      typescriptreact = { stop_after_first = true },
    },

    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
  },
}
