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
			require("mini.move").setup( -- No need to copy this inside `setup()`. Will be used automatically.
				{
					-- Module mappings. Use `''` (empty string) to disable one.
					mappings = {
						-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
						left = "<M-h>",
						right = "<M-l>",
						down = "<M-j>",
						up = "<M-k>",

						-- Move current line in Normal mode
						line_left = "<M-h>",
						line_right = "<M-l>",
						line_down = "<M-j>",
						line_up = "<M-k>",
					},

					-- Options which control moving behavior
					options = {
						-- Automatically reindent selection during linewise vertical move
						reindent_linewise = true,
					},
				}
			)
			require("mini.ai").setup( -- No need to copy this inside `setup()`. Will be used automatically.
				{
					-- Table with textobject id as fields, textobject specification as values.
					-- Also use this to disable builtin textobjects. See |MiniAi.config|.
					custom_textobjects = nil,

					-- Module mappings. Use `''` (empty string) to disable one.
					mappings = {
						-- Main textobject prefixes
						around = "a",
						inside = "i",

						-- Next/last variants
						around_next = "an",
						inside_next = "in",
						around_last = "al",
						inside_last = "il",

						-- Move cursor to corresponding edge of `a` textobject
						goto_left = "g[",
						goto_right = "g]",
					},

					-- Number of lines within which textobject is searched
					n_lines = 50,

					-- How to search for object (first inside current line, then inside
					-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
					-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
					search_method = "cover_or_next",

					-- Whether to disable showing non-error feedback
					silent = false,
				}
			)
		end,
	},
}
