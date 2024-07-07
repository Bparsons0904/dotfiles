return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = { light = "latte", dark = "mocha" },
			transparent_background = true,
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				mocha = {
					base = "#1a1b26",
					text = "#c0caf5",
					surface0 = "#15161E",
					red = "#f7768e",
					green = "#9ece6a",
					yellow = "#e0af68",
					blue = "#7aa2f7",
					lavender = "#9d7cd8",
					teal = "#7dcfff",
					overlay0 = "#a9b1d6",
				},
			},
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors.overlay0 },
					LineNr = { fg = colors.overlay0 },
					CursorLine = { bg = colors.surface0 },
					Keyword = { fg = colors.lavender },
					Type = { fg = colors.blue },
					Function = { fg = colors.blue },
					Identifier = { fg = colors.text },
					String = { fg = colors.green },
					Number = { fg = colors.yellow },
					Boolean = { fg = colors.yellow },
					Operator = { fg = colors.sky },
					Variable = { fg = colors.text },
					["@keyword"] = { fg = colors.lavender },
					["@variable"] = { fg = colors.teal },
					["@parameter"] = { fg = colors.yellow },
					["@boolean"] = { fg = colors.red },
					["@keyword.function"] = { fg = colors.lavender },
					["@keyword.import"] = { fg = colors.lavender },
					["@keyword.package"] = { fg = colors.lavender },
					Search = { bg = colors.green, fg = colors.blue },
					TelescopeSelection = { bg = colors.surface0 },
					TelescopeMatching = { fg = colors.green, bold = true },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				treesitter = true,
			},
		})
	end,
	-- vim.api.nvim_create_autocmd("ColorScheme", {
	-- 	pattern = "*",
	-- 	callback = function()
	-- 		vim.api.nvim_set_hl(0, "Search", { bg = "#FF5555", fg = "#1a1b26" })
	-- 		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#3b4261" })
	-- 		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#FF5555", bold = true })
	-- 	end,
	-- }),
}
