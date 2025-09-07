return {
  cmd = { 'cspell-lsp', '--stdio' },
  filetypes = { 
    'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
    'python', 'lua', 'go', 'rust', 'c', 'cpp', 'java',
    'markdown', 'text', 'html', 'css', 'scss', 'json',
    'yaml', 'toml', 'sh', 'bash', 'zsh', 'vim'
  },
  root_markers = { 'cspell.json', '.cspell.json', 'package.json', '.git' },
  single_file_support = true,
  settings = {
    cspell = {
      -- Enable cspell
      enabled = true,
      -- Show suggestions when a word is not recognized
      showSuggestions = true,
      -- Maximum number of suggestions to show
      maxNumberOfProblems = 100,
      -- Maximum number of suggestions per word
      maxDuplicateProblems = 5,
      -- Show status in the status bar
      showStatus = true,
    }
  }
}