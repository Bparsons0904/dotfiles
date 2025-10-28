return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "zsh" },
  root_markers = { ".git" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command|.zsh)",
    },
  },
}

