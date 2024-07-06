return {
	"git@github.com:davidmh/cspell.nvim.git",
	config = function()
		local cspell = require("cspell")
		local options = {
			find_json = function()
				local global_cspell_path = vim.fn.expand("~/.config/cspell/cspell.json")
				return global_cspell_path
			end,
		}
		require("null-ls").setup({
			sources = {
				cspell.diagnostics.with({
					config = options,
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.HINT
					end,
				}),
				cspell.code_actions.with({ config = options }),
			},
			debounce = 500,
		})
	end,
}
