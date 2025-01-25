require("core.keymaps")
require("core.options")

vim.filetype.add({ extension = { templ = "templ" } })

require("core.lazy")

local themes = {
  tokyonight = "tokyonight",
  tokyodark = "tokyodark",
  eldritch = "eldritch",
}

vim.cmd.colorscheme(themes.eldritch)
