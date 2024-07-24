return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		nvimtree.setup({
			view = {
				width = 45,
				relativenumber = true,
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 60,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			renderer = {
				root_folder_modifier = false,
				full_name = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "►",
							arrow_open = "▼",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = true,
					},
				},
			},
			filters = {
				custom = { ".DS_Store", ".git" },
			},
			git = {
				ignore = true,
			},
			reload_on_bufenter = true,

			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
		})

		addToKeyMap("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file")
		-- addToKeyMap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", "Toggle file explorer")
		-- addToKeyMap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer")
		-- addToKeyMap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer")
	end,
}
