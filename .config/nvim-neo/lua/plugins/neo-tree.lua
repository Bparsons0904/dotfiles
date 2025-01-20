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

	addToKeyMap("n", "<leader>e", "<cmd>Neotree reveal position=float<CR>", "Toggle file explorer on current file"),
}
