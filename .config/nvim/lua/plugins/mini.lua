return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.comment").setup({
				mappings = {
					comment = "gc",
					comment_line = "<leader>/",
					comment_visual = "<leader>/",
					textobject = "gc",
				},
			})
			require("mini.move").setup({
				mappings = {
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",

					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},

				options = {
					reindent_linewise = true,
				},
			})
			require("mini.ai").setup({
				custom_textobjects = nil,
				mappings = {
					around = "a",
					inside = "i",

					around_next = "an",
					inside_next = "in",
					around_last = "al",
					inside_last = "il",

					goto_left = "g[",
					goto_right = "g]",
				},

				n_lines = 50,

				search_method = "cover_or_next",
				silent = false,
			})
		end,
	},
}
