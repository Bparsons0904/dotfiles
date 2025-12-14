require("core.keymaps")
require("core.options")
require("core.autocmds")
require("core.commands")
local nightingale = require("colorschemes.nightingale")

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
  moonfly = "moonfly",
  nightingale = "nightingale",
  darkOrchid = "dark-orchid",
  aNvimThem = "neon",
}

vim.cmd.colorscheme(themes.aNvimThem)
