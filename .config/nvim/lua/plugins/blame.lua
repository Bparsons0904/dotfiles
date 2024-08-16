return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup()
	end,

	vim.keymap.set("n", "<leader>gw", "<cmd>BlameToggle window<CR>", { noremap = true }),
	vim.keymap.set("n", "<leader>gv", "<cmd>BlameToggle virtual<CR>", { noremap = true }),
}
