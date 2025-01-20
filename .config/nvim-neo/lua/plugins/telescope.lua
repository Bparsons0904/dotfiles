return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		{
			"danielfalk/smart-open.nvim",
			branch = "0.2.x",
			dependencies = {
				"kkharji/sqlite.lua",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					smart_open = {
						match_algorithm = "fzf",
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("smart_open")
			addKeyMaps({
				{
					"n",
					"<leader>ff",
					function()
						telescope.extensions.smart_open.smart_open(
							require("telescope.themes").get_dropdown({ previewer = false })
						)
					end,
					"Find files the smart way",
				},
				{ "n", "<leader>fo", builtin.find_files, "Find files the smart way" },
				{ "n", "<leader>fg", builtin.live_grep, "Live grep" },
				{ "n", "<leader>fb", builtin.buffers, "Buffers" },
				{ "n", "<leader>fh", builtin.help_tags, "Help tags" },
			})
		end,
	},
}
