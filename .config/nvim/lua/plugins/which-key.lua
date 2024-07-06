return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.register({
			b = {
				name = "Buffers",
			},
			c = {
				name = "CoPilot",
			},
			l = {
				name = "LSP",
			},
			g = {
				name = "General",
			},
			s = {
				name = "Search",
			},
			t = {
				name = "Tabs",
			},
		}, { prefix = "<leader>" })
	end,
}
