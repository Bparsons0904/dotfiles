return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/personal/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/personal/**.md",
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/personal",
      },
      {
        name = "vault",
        path = "~/Documents/Obsidian/",
      },
    },

    -- Use the note title as the filename (preserving spaces and case)
    note_id_func = function(title)
      if title ~= nil then
        return title
      else
        return tostring(os.time())
      end
    end,
    completion = { nvim_cmp = false },

    -- Preferred link style
    preferred_link_style = "wiki",
  },
}
