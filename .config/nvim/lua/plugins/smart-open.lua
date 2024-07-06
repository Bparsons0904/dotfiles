return {
	"danielfalk/smart-open.nvim",
	branch = "0.2.x",
	config = function()
		require("telescope").load_extension("smart_open")
		vim.keymap.set("n", "<leader>f", function()
			require("telescope").extensions.smart_open.smart_open({
				filename_first = true,
				cwd_only = true,
			})
		end, { noremap = true, silent = true, desc = "Smart Open" })
	end,
	dependencies = {
		"kkharji/sqlite.lua",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
	},
}
