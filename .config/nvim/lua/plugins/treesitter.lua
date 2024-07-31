return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"andymass/vim-matchup",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			matchup = {
				enable = true,
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"go",
				"templ",
				"sql",
				"regex",
			},
			injections = {
				enable = true,
				languages = {
					go = {
						sql = "(raw_string_literal) @sql",
					},
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
			-- custom_highlights = function(colors)
			-- 	return {
			-- 		Keyword = { fg = colors.lavender },
			-- 		goPackage = { fg = colors.lavender },
			-- 		goImport = { fg = colors.lavender },
			-- 		goFunc = { fg = colors.lavender },
			-- 	}
			-- end,
		})

		-- Set up nvim-ts-autotag after Treesitter
		-- require("nvim-ts-autotag").setup({
		-- 	enable = true,
		-- 	enable_rename = true,
		-- 	enable_close = true,
		-- 	enable_close_on_slash = false,
		-- })
		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- -- Also override individual filetype configs, these take priority.
			-- -- Empty by default, useful if one of the "opts" global settings
			-- -- doesn't work well in a specific filetype
			-- per_filetype = {
			-- 	["html"] = {
			-- 		enable_close = false,
			-- 	},
			-- },
		})
		require("treesitter-context").setup({
			enable = true,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 3,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
		})
	end,
}
