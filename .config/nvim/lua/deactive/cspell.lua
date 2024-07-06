return {
	"git@github.com:davidmh/cspell.nvim.git",
	dependencies = { "nvim-lua/plenary.nvim", "jose-elias-alvarez/null-ls.nvim" },
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
			filetypes = { "python", "lua", "javascript" }, -- Add your desired filetypes
		}

		local cspell_diagnostics = cspell.diagnostics.with({
			config = options,
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = vim.diagnostic.severity.HINT
			end,
		})

		local cspell_code_actions = cspell.code_actions.with({ config = options })

		-- Set up null-ls with CSpell sources
		null_ls.setup({
			sources = {
				cspell_diagnostics,
				cspell_code_actions,
			},
			-- Keep code actions always available
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/codeAction") then
					vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
				end
			end,
		})

		-- Disable diagnostics by default, but keep code actions enabled
		vim.diagnostic.disable()

		-- Function to run CSpell check
		local function run_cspell_check()
			vim.diagnostic.enable()
			vim.lsp.buf.format({ async = false })
			vim.defer_fn(function()
				vim.diagnostic.disable()
			end, 1000) -- Adjust this delay if needed
		end

		-- Command to manually trigger CSpell check
		vim.api.nvim_create_user_command("CSpellCheck", run_cspell_check, {})

		-- Optional: Key mapping to trigger CSpell check
		vim.keymap.set(
			"n",
			"<leader>ls",
			run_cspell_check,
			{ noremap = true, silent = true, desc = "Run CSpell check" }
		)

		-- Command to toggle diagnostics
		vim.api.nvim_create_user_command("CSpellToggle", function()
			if vim.diagnostic.is_disabled() then
				vim.diagnostic.enable()
			else
				vim.diagnostic.disable()
			end
		end, {})
	end,
}
