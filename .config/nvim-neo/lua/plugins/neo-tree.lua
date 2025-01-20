return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", 
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		require("neo-tree").setup({})
	end,

	addToKeyMap("n", "<leader>ee", "<cmd>Neotree reveal position=float<CR>", "Toggle file explorer on current file"),
	addToKeyMap("n", "<leader>eb", "<cmd>Neotree buffers position=float<CR>", "Toggle file explorer on current file"),
}
