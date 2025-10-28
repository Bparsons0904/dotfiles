return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'templ' },
  root_markers = { 'package.json', '.git' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}