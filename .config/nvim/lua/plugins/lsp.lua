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
    "williamboman/mason.nvim",
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
      "saghen/blink.cmp",
    },
    config = function()
      require("mason").setup()
      
      -- Setup native LSP capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      
      -- Configure native LSP servers
      local config_path = vim.fn.stdpath("config")
      vim.lsp.config['lua_ls'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/lua_ls.lua'), { capabilities = capabilities })
      vim.lsp.config['html'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/html.lua'), { capabilities = capabilities })
      vim.lsp.config['htmx'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/htmx.lua'), { capabilities = capabilities })
      vim.lsp.config['emmet_ls'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/emmet_ls.lua'), { capabilities = capabilities })
      vim.lsp.config['templ'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/templ.lua'), { capabilities = capabilities })
      vim.lsp.config['biome'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/biome.lua'), { capabilities = capabilities })
      vim.lsp.config['eslint_d'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/eslint_d.lua'), { capabilities = capabilities })
      vim.lsp.config['bashls'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/bashls.lua'), { capabilities = capabilities })
      vim.lsp.config['gopls'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/gopls.lua'), { capabilities = capabilities })
      vim.lsp.config['cspell'] = vim.tbl_deep_extend('force', dofile(config_path .. '/lsp/cspell.lua'), { capabilities = capabilities })

      -- Enable all LSP servers - root_markers will determine which ones attach
      vim.lsp.enable({ 'lua_ls', 'html', 'htmx', 'emmet_ls', 'templ', 'biome', 'eslint_d', 'bashls', 'gopls', 'cspell' })
      
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
              -- Native LSP provides built-in keymaps: grn (rename), gra (code actions), grr (references), gri (implementation), gO (document symbols), CTRL-S (signature help)
              { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", opts },
              { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics", opts },
              { "n", "<leader>lr", ":LspRestart<CR>", "Restart LSP", opts },
            })
          end
        end,
      })


      -- Tool installation through Mason (for formatters, linters, etc.)
      local ensure_installed = {
        "stylua",
        "biome",
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
        "lua-language-server",
        "cspell",
      }
      
      -- Simple tool installer for Mason
      vim.api.nvim_create_user_command('MasonInstallAll', function()
        vim.cmd('MasonInstall ' .. table.concat(ensure_installed, ' '))
      end, {})
    end,
  },
}
