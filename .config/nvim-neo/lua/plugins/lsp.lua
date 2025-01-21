return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        "saghen/blink.cmp", -- Add blink.cmp as dependency
      },
      config = function()
        -- Your existing LSP attach autocmd
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
            end
          end,
        })

        -- Setup base capabilities with blink.cmp
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Your server configurations
        local servers = {
          lua_ls = {
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace",
                },
                diagnostics = { disable = { "missing-fields" } },
              },
            },
          },
        }

        -- Setup Mason ensures
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
          "stylua",
          "eslint_d",
          "ruff",
          "prettierd",
          "prettier",
          "isort",
          "black",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        -- Setup LSP with blink.cmp capabilities
        require("mason-lspconfig").setup({
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              -- Merge any server-specific capabilities with blink.cmp capabilities
              server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
              require("lspconfig")[server_name].setup(server)
            end,
          },
        })
      end,
    },
  },
}

-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		cmd = "Mason",
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		dependencies = {
-- 			"williamboman/mason.nvim",
-- 		},
--     config = function()
--       require("mason").setup()
--       require("mason-lspconfig").setup {
--         ensure_installed = { "lua_ls" },
--       }
--     end,
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		dependencies = {
-- 			"williamboman/mason.nvim",
-- 			"williamboman/mason-lspconfig.nvim",
-- 		},
-- 		config = function() end,
-- 	},
-- }
