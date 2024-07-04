return {
	"petertriho/nvim-scrollbar",
	config = function()
		require("scrollbar").setup()
		-- require("nvim-scrollbar").setup({
		-- auto_hide = true,
		-- auto_hide_timeout = 1000,
		-- auto_hide_lastline = true,
		-- require("scrollbar.handlers.search").setup({}),
		-- })
	end,
}
