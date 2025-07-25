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

          if client and client.server_capabilities.documentHighlightProvider then
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
              { "n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references", opts },
              { "n", "gD", vim.lsp.buf.declaration, "Go to declaration", opts },
              { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions", opts },
              { "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations", opts },
              { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions", opts },
              -- { { "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "See available code actions", opts },
              -- { "n", "<leader>lr", vim.lsp.buf.rename, "Smart rename", opts },
              { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", opts },
              { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics", opts },
              -- { "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic", opts },
              -- { "n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic", opts },
              -- { "n", "K", vim.lsp.buf.hover, "Show documentation under cursor", opts },
              { "n", "<leader>lr", ":LspRestart<CR>", "Restart LSP", opts },
            })
          end
        end,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

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
        html = {
          filetypes = { "html", "templ" },
        },
        htmx = {
          filetypes = { "html", "templ" },
          root_dir = require("lspconfig.util").root_pattern("*.html", "*.templ", ".git"),
        },
        emmet_ls = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "templ" },
        },
        templ = {
          filetypes = { "templ" },
          cmd = { "templ", "lsp" },
          root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
        },
        eslint_d = {
          capabilities = capabilities,
          settings = {
            workingDirectory = { mode = "auto" },
            -- packageManager = "npm",
            -- options = {
            --   resolvePluginsRelativeTo = ".",
            -- },
          },
          -- on_attach = function(client, bufnr)
          --   client.server_capabilities.documentFormattingProvider = true
          --   vim.api.nvim_create_autocmd("BufWritePre", {
          --     buffer = bufnr,
          --     command = "EslintFixAll",
          --   })
          -- end,
        },
        bashls = {
          filetypes = { "sh", "bash", "zsh" },
          settings = {
            bashIde = {
              globPattern = "*@(.sh|.inc|.bash|.command|.zsh)",
            },
          },
        },
        -- dartls = { cmd = { "dart", "language-server", "--protocol=lsp" },
        --   filetypes = { "dart" },
        --   init_options = {
        --     closingLabels = true,
        --     flutterOutline = true,
        --     onlyAnalyzeProjectsWithOpenFiles = true,
        --     outline = true,
        --     suggestFromUnimportedLibraries = true,
        --   },
        --   settings = {
        --     dart = {
        --       completeFunctionCalls = true,
        --       showTodos = true,
        --       enableSnippets = true,
        --       updateImportsOnRename = true,
        --       lineLength = 100,
        --     },
        --   },
        -- },
      }

      local ensure_installed = {
        "stylua",
        "eslint",
        "eslint_d",
        "ruff",
        "prettierd",
        "prettier",
        "isort",
        "black",
        "gopls",
        "gofumpt",
        "golines",
        "goimports",
        "golangci-lint",
        "templ",
        "html-lsp",
        "htmx-lsp",
        "emmet-ls",
        "bash-language-server",
        "shellcheck",
        "shfmt",
        -- "dart-debug-adapter",
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
}
