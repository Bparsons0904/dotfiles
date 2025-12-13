return {
  "kuri-sun/yoda.nvim",
  config = function()
    require("yoda").setup({

      -- Set light or dark variant
      theme = "dark", -- "dark" or "light"

      -- Style options
      italic_comments = true,
      transparent_background = false,
      bold_keywords = true,
      underline_match_paren = true,

      -- Override specific colors
      colors = {}, -- Override palette colors

      -- Override specific highlight groups
      highlights = {}, -- Override highlight groups

      -- Disable or enable colorscheme extensions
      extensions = {
        telescope = true,
        neo_tree = true,
        nvim_tree = true,
        cmp = true,
        gitsigns = true,
        snacks = true,
        netrw = true,
        todo_comments = true,
        indent_blankline = true,
        dashboard = true,
        which_key = true,
        misc = true,
        mini = true,
        noice = true,
        trouble = true,
      },
    })
  end,
}
