-- Helper function to detect if project uses Biome
local function has_biome_config(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  if bufname == "" then
    return false
  end

  -- Search up from the buffer's directory to find biome.json
  local current_dir = vim.fn.fnamemodify(bufname, ":h")

  while current_dir and current_dir ~= "/" and current_dir ~= "." do
    if
      vim.fn.filereadable(current_dir .. "/biome.json") == 1
      or vim.fn.filereadable(current_dir .. "/biome.jsonc") == 1
    then
      return true
    end
    -- Move up one directory
    local parent = vim.fn.fnamemodify(current_dir, ":h")
    if parent == current_dir then
      break
    end
    current_dir = parent
  end

  return false
end

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
          -- Use the configured formatter (Biome, or ESLint+Prettier based on has_biome_config)
          require("conform").format({ async = true, lsp_format = "fallback" })
        else
          vim.notify("Format/fix only available for JS/TS files", vim.log.levels.INFO)
        end
      end,
      desc = "Fix/format JS/TS",
    },
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      notify_on_error = true,

      format_after_save = {
        timeout_ms = 5000,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofumpt", "golines" },
        javascript = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "eslint_d", "prettierd" }
        end,
        typescript = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "eslint_d", "prettierd" }
        end,
        javascriptreact = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "eslint_d", "prettierd" }
        end,
        typescriptreact = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "eslint_d", "prettierd" }
        end,
        json = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "prettierd" }
        end,
        jsonc = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "prettierd" }
        end,
        css = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "prettierd" }
        end,
        scss = { "prettierd" },
        html = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        dart = { "dart_format" },
        sql = { "sqlfmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
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
        biome = {
          command = "biome",
          args = {
            "check",
            "--write",
            "--stdin-file-path",
            "$FILENAME",
          },
          stdin = true,
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
            "--binary-next-line", -- Binary ops like and || on next line
          },
        },
      }, -- end formatters
    })
  end,
}
