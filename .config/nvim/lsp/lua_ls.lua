return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = { 
        disable = { "missing-fields" },
        globals = { "vim" }
      },
      runtime = { 
        version = 'LuaJIT' 
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      telemetry = {
        enable = false,
      },
    }
  }
}