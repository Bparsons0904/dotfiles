require("core.keymaps")
require("core.options")
require("core.autocmds")
require("core.commands")

vim.filetype.add({ extension = { templ = "templ" } })

require("core.lazy")

local themes = {
  tokyo = "tokyonight",
  tokyonight = "tokyonight-night",
  tokyodark = "tokyodark",
  eldritch = "eldritch",
  stoics = "stoics",
  nightfall = "nightfall",
  oasis = "oasis",
  nightingale = "nightingale",
  yoda = "yoda",
}

vim.cmd.colorscheme(themes.nightingale)
