return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local transform_mod = require("telescope.actions.mt").transform_mod

			local custom_actions = transform_mod({
				open_trouble_qflist = function()
					trouble.toggle("quickfix")
				end,
			})

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						".git",
						"node_modules",
						"vendor",
						".*_templ%.go",
						".*_templ%.txt",
					},
					path_display = { "smart" },
					layout_strategy = "horizontal",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
							["<C-y>"] = actions.select_default,
						},
					},
				},
				pickers = {
					marks = {
						initial_mode = "normal",
					},
					buffers = {
						initial_mode = "normal",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("noice")
			telescope.load_extension("smart_open")

			addKeys({
				{ "n", "<leader>sf", "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
				{ "n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
				{ "n", "<leader>st", "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
				{ "n", "<leader>sc", "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
				{ "n", "<leader>sk", "<cmd>Telescope keymaps<cr>", "Find keymaps" },
				{ "n", "<leader>sh", "<cmd>Telescope history<cr>", "Search history" },
				{ "n", "<leader>ss", "<cmd>TodoTelescope<cr>", "Find todos" },
				{
					"n",
					"<leader>sd",
					"<cmd>lua require('telescope.builtin').live_grep({ additional_args = function() return { '--hidden' } end })<cr>",
					"Find string in cwd including hidden files",
				},
				{ "n", "<leader>sb", "<cmd>Telescope buffers<cr>", "Find buffers" },
				{ "n", "<leader>sl", "<cmd>Telescope resume<cr>", "Find string in cwd" },
				{ "n", "<leader>sm", "<cmd>Telescope marks<cr>", "Find Marks" },
				{ "n", "<leader>sS", "<cmd>Telescope lsp_document_symbols<cr>", "Find Symbols" },
				{ "n", "<leader>sF", "<cmd>Telescope lsp_document_symbols symbols=function<cr>", "Find Functions" },
			})
		end,
	},
}
