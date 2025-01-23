require("core.options")

vim.filetype.add({ extension = { templ = "templ" } })

require("config.lazy")
require("core.keymaps")
