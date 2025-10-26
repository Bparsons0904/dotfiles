return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  opts = {
    on_attach = function(client, bufnr)
      -- Disable tsserver formatting in favor of prettier via conform
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      local opts = { buffer = bufnr }
      addKeyMaps({
        -- TypeScript specific commands
        { "n", "<leader>tR", "<cmd>TSToolsRenameFile<CR>", "Rename File", opts },
        { "n", "<leader>tI", "<cmd>TSToolsAddMissingImports<CR>", "Add Missing Imports", opts },
        { "n", "<leader>tO", "<cmd>TSToolsOrganizeImports<CR>", "Organize Imports", opts },
        { "n", "<leader>tS", "<cmd>TSToolsSortImports<CR>", "Sort Imports", opts },
        { "n", "<leader>tF", "<cmd>TSToolsFixAll<CR>", "Fix All", opts },
        { "n", "<leader>tU", "<cmd>TSToolsRemoveUnused<CR>", "Remove Unused", opts },
        { "n", "<leader>tA", "<cmd>TSToolsRemoveUnusedImports<CR>", "Remove Unused Imports", opts },
        { "n", "<leader>tG", "<cmd>TSToolsGoToSourceDefinition<CR>", "Go to Source Definition", opts },
        { "n", "<leader>tD", "<cmd>TSToolsFileReferences<CR>", "File References", opts },
        -- Inlay Hints Toggle
        {
          "n",
          "<leader>th",
          function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end,
          "Toggle Inlay Hints",
          opts,
        },
        {
          "n",
          "<leader>tH",
          function()
            vim.lsp.inlay_hint.enable(true)
          end,
          "Enable Inlay Hints",
          opts,
        },
        {
          "n",
          "<leader>tn",
          function()
            vim.lsp.inlay_hint.enable(false)
          end,
          "Disable Inlay Hints",
          opts,
        },
      })
    end,
    settings = {
      -- Spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      -- "change"|"insert_leave" determine when the client asks the server about diagnostic
      publish_diagnostic_on = "insert_leave",
      -- Array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
      -- "remove_unused_imports"|"organize_imports") -- or string "all"
      -- to include all supported code actions
      -- specify commands exposed as code_actions
      expose_as_code_action = {
        "fix_all",
        "add_missing_imports",
        "remove_unused",
        "remove_unused_imports",
        "organize_imports",
      },
      -- String|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
      -- not exists then standard path resolution strategy is applied
      tsserver_path = nil,
      -- Specify a list of plugins to load by tsserver, e.g., for support of styled-components
      -- (see 💅 `styled-components` support section)
      tsserver_plugins = {},
      -- This value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
      -- Memory limit in megabytes or "auto"(basically no limit)
      tsserver_max_memory = "auto",
      -- Described below
      tsserver_format_options = {},
      tsserver_file_preferences = {
        -- Inlay Hints - Disabled by default (distracting)
        includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayEnumMemberValueHints = false,
        -- Completions
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        includeCompletionsWithSnippetText = true,
        includeAutomaticOptionalChainCompletions = true,
      },
      -- Locale of all tsserver messages, supported locales you can find here:
      -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
      tsserver_locale = "en",
      -- Mirror of VSCode's `typescript.suggest.completeFunctionCalls`
      complete_function_calls = false,
      include_completions_with_insert_text = true,
      -- CodeLens
      -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
      -- possible values: ("off"|"all"|"implementations_only"|"references_only")
      code_lens = "off",
      -- By default code lenses are displayed on all referencable values and for some of you it can
      -- be too much this option reduce count of them by removing member references from lenses
      disable_member_code_lens = true,
      -- JSXCloseTag
      -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
      -- that maybe have a conflict if enable this feature. )
      jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
}
