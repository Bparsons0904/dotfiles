return {
  "uhs-robert/oasis.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("oasis").setup({
      style = "starlight",
    })
  end,
}
-- colorscheme oasis-abyss // I like this one, something I am not loving but lets keep it for now
-- colorscheme oasis-lagoon // Blue background... better than I thought
-- colorscheme oasis-night // Med black
-- colorscheme oasis-midnight // Dark black
-- colorscheme oasis-starlight // Full black
