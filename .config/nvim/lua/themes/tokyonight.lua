return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		on_highlights = function(hl)
			hl.IndentBlanklineContextChar = {
				fg = "#081633",
			}
			hl.TSConstructor = {
				fg = "#51afef",
			}
			hl.TSTagDelimiter = {
				fg = "#081633",
			}
		end,
		style = "moon",
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark",
			floats = "dark",
		},
		sidebars = {
			"qf",
			"vista_kind",
			"terminal",
			"packer",
			"spectre_panel",
			"NeogitStatus",
			"help",
		},
		day_brightness = 0.3,
		hide_inactive_statusline = false,
		dim_inactive = false,
		lualine_bold = false,
		use_background = true,
	},
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				local hl_groups = {
					"Normal",
					"SignColumn",
					"NormalNC",
					"TelescopeBorder",
					"NvimTreeNormal",
					"NvimTreeNormalNC",
					"EndOfBuffer",
					"MsgArea",
				}
				for _, name in ipairs(hl_groups) do
					vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
				end
			end,
		})
		vim.opt.fillchars = "eob: "
	end,
}
