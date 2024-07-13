return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "tabs",
		},
	},
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				-- Add padding to the buffers
				separator_style = "slant",
				enforce_regular_tabs = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
			highlights = {
				fill = {
					fg = "#3b4261",
					bg = "NONE",
				},
				background = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				tab = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				tab_selected = {
					fg = "#c0caf5",
					bg = "NONE",
					bold = true,
				},
				tab_separator = {
					fg = "#3b4261",
					bg = "#3b4261",
				},
				tab_separator_selected = {
					fg = "#7aa2f7",
					bg = "NONE",
					sp = "#7aa2f7",
					underline = true,
				},
				tab_close = {
					fg = "#f7768e",
					bg = "NONE",
				},
				close_button = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				close_button_visible = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				close_button_selected = {
					fg = "#f7768e",
					bg = "NONE",
				},
				buffer_visible = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				buffer_selected = {
					fg = "#c0caf5",
					bg = "NONE",
					bold = true,
					italic = true,
				},
				numbers = {
					fg = "#0764fe",
					bg = "NONE",
				},
				numbers_visible = {
					fg = "#737aa2",
					bg = "NONE",
				},
				numbers_selected = {
					fg = "#65fe08",
					bg = "NONE",
					bold = true,
					italic = true,
				},
				diagnostic = {
					fg = "#f7768e",
					bg = "NONE",
				},
				diagnostic_visible = {
					fg = "#f7768e",
					bg = "NONE",
				},
				diagnostic_selected = {
					fg = "#f7768e",
					bg = "NONE",
					bold = true,
					italic = true,
				},
				hint = {
					fg = "#1abc9c",
					sp = "#1abc9c",
					bg = "NONE",
				},
				hint_visible = {
					fg = "#1abc9c",
					bg = "NONE",
				},
				hint_selected = {
					fg = "#1abc9c",
					bg = "NONE",
					sp = "#1abc9c",
					bold = true,
					italic = true,
				},
				hint_diagnostic = {
					fg = "#1abc9c",
					sp = "#1abc9c",
					bg = "NONE",
				},
				hint_diagnostic_visible = {
					fg = "#1abc9c",
					bg = "NONE",
				},
				hint_diagnostic_selected = {
					fg = "#1abc9c",
					bg = "NONE",
					sp = "#1abc9c",
					bold = true,
					italic = true,
				},
				info = {
					fg = "#0db9d7",
					sp = "#0db9d7",
					bg = "NONE",
				},
				info_visible = {
					fg = "#0db9d7",
					bg = "NONE",
				},
				info_selected = {
					fg = "#0db9d7",
					bg = "NONE",
					sp = "#0db9d7",
					bold = true,
					italic = true,
				},
				info_diagnostic = {
					fg = "#0db9d7",
					sp = "#0db9d7",
					bg = "NONE",
				},
				info_diagnostic_visible = {
					fg = "#0db9d7",
					bg = "NONE",
				},
				info_diagnostic_selected = {
					fg = "#0db9d7",
					bg = "NONE",
					sp = "#0db9d7",
					bold = true,
					italic = true,
				},
				warning = {
					fg = "#e0af68",
					sp = "#e0af68",
					bg = "NONE",
				},
				warning_visible = {
					fg = "#e0af68",
					bg = "NONE",
				},
				warning_selected = {
					fg = "#e0af68",
					bg = "NONE",
					sp = "#e0af68",
					bold = true,
					italic = true,
				},
				warning_diagnostic = {
					fg = "#e0af68",
					sp = "#e0af68",
					bg = "NONE",
				},
				warning_diagnostic_visible = {
					fg = "#e0af68",
					bg = "NONE",
				},
				warning_diagnostic_selected = {
					fg = "#e0af68",
					bg = "NONE",
					sp = "#e0af68",
					bold = true,
					italic = true,
				},
				error = {
					fg = "#f7768e",
					bg = "NONE",
					sp = "#f7768e",
				},
				error_visible = {
					fg = "#f7768e",
					bg = "NONE",
				},
				error_selected = {
					fg = "#f7768e",
					bg = "NONE",
					sp = "#f7768e",
					bold = true,
					italic = true,
				},
				error_diagnostic = {
					fg = "#f7768e",
					bg = "NONE",
					sp = "#f7768e",
				},
				error_diagnostic_visible = {
					fg = "#f7768e",
					bg = "NONE",
				},
				error_diagnostic_selected = {
					fg = "#f7768e",
					bg = "NONE",
					sp = "#f7768e",
					bold = true,
					italic = true,
				},
				modified = {
					fg = "#e0af68",
					bg = "NONE",
				},
				modified_visible = {
					fg = "#e0af68",
					bg = "NONE",
				},
				modified_selected = {
					fg = "#e0af68",
					bg = "NONE",
				},
				duplicate_selected = {
					fg = "#737aa2",
					bg = "NONE",
					italic = true,
				},
				duplicate_visible = {
					fg = "#737aa2",
					bg = "NONE",
					italic = true,
				},
				duplicate = {
					fg = "#737aa2",
					bg = "NONE",
					italic = true,
				},
				separator_selected = {
					fg = "#000000",
					bg = "NONE",
				},
				separator_visible = {
					fg = "#000000",
					bg = "NONE",
				},
				separator = {
					fg = "#000000",
					bg = "NONE",
				},
				indicator_visible = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				indicator_selected = {
					fg = "#7aa2f7",
					bg = "NONE",
				},
				pick_selected = {
					fg = "#9d7cd8",
					bg = "NONE",
					bold = true,
					italic = true,
				},
				pick_visible = {
					fg = "#9d7cd8",
					bg = "NONE",
					bold = true,
					italic = true,
				},
				pick = {
					fg = "#9d7cd8",
					bg = "NONE",
					bold = true,
					italic = true,
				},
				offset_separator = {
					fg = "#3b4261",
					bg = "NONE",
				},
				trunc_marker = {
					fg = "#737aa2",
					bg = "NONE",
				},
			},
		})
	end,
}
