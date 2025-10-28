return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedvariable = true,
        useany = true,
      },
      staticcheck = false,
      gofumpt = true,
      -- Reduce gopls diagnostics to avoid conflicts with golangci-lint
      diagnosticsDelay = "500ms",
      -- Let external linters handle more detailed checks
      experimentalPostfixCompletions = true,
      inlayHints = {
        enable = false,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

