return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "saghen/blink.cmp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })

            local opts = { buffer = event.buf }
            addKeyMaps({
              { "n", "gD", vim.lsp.buf.declaration, "Go to declaration", opts },
              { "n", "gd", vim.lsp.buf.definition, "Go to definition", opts },
              { "n", "gi", vim.lsp.buf.implementation, "Go to implementation", opts },
              { "n", "gt", vim.lsp.buf.type_definition, "Go to type definition", opts },
              { "n", "gr", vim.lsp.buf.references, "Show references", opts },
              { "n", "<leader>D", vim.diagnostic.setloclist, "Show buffer diagnostics", opts },
              { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics", opts },
              { "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic", opts },
              { "n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic", opts },
              { "n", "K", vim.lsp.buf.hover, "Show documentation under cursor", opts },
              { "n", "<leader>lr", ":LspRestart<CR>", "Restart LSP", opts },
              { "n", "<leader>la", vim.lsp.buf.code_action, "Code actions", opts },
              { "n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol", opts },
            })
          end
        end,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
        bashls = {
          filetypes = { "sh", "bash", "zsh" },
        },
      }

      local ensure_installed = {
        "yaml-language-server",
        "json-lsp",
        "bash-language-server",
        "prettier",
      }
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
  {
    "b0o/schemastore.nvim",
  },
}