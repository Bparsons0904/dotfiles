return {
	"git@github.com:davidmh/cspell.nvim.git",
	dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls.nvim" },
	config = function()
		local cspell = require("cspell")
		local null_ls = require("null-ls")

		local options = {
			find_json = function(bufnr)
				local root = vim.fn.getcwd()
				local project_config = root .. "/cspell.json"
				if vim.fn.filereadable(project_config) == 1 then
					return project_config
				end
				return vim.fn.expand("~/.config/cspell/cspell.json")
			end,
			filetypes = { "python", "lua", "typescript", "go", "templ" },
		}

		local cspell_diagnostics = cspell.diagnostics.with({
			config = options,
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = vim.diagnostic.severity.HINT
			end,
		})

		local cspell_code_actions = cspell.code_actions.with({ config = options })

		null_ls.setup({
			sources = {
				cspell_diagnostics,
				cspell_code_actions,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = options.filetypes,
			callback = function()
				null_ls.enable({})
			end,
		})

		vim.api.nvim_create_user_command("CSpellCheck", function()
			null_ls.enable({})
		end, {})
	end,
}
