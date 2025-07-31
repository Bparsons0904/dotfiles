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
  },
  opts = {
    notify_on_error = true,

    format_after_save = {
      timeout_ms = 5000,
      lsp_fallback = true,
    },

    formatters_by_ft = {
      json = { "prettier" },
      yaml = { "prettier" },
    },

    formatters = {
      prettier = {
        prepend_args = { "--tab-width", "2" },
      },
    },
  },
}