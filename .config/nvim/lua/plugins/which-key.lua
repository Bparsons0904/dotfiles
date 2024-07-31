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
		wk.add({
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "CoPilot" },
			{ "<leader>g", group = "General" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Tabs" },
		})
	end,
}
