return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			use_popups_for_input = false,
		})
	end,
	addToKeyMap("n", "<leader>ee", "<cmd>Neotree reveal position=float<CR>", "Toggle file explorer on current file"),
	addToKeyMap("n", "<leader>eb", "<cmd>Neotree buffers position=float<CR>", "Toggle file explorer on current file"),
}
