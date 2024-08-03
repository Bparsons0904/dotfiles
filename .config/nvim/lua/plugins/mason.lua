return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"pyright",
				"gopls",
				"templ",
				"htmx",
				"dockerls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint",
				"eslint_d",
				"templ",
				"goimports",
				"golines",
				"gofumpt",
				"yamlls",
			},
		})
		-- require("go").setup({
		-- 	-- lsp_cfg = false,
		-- })
		-- local cfg = require("go.lsp").config()
		--
		-- require("lspconfig").gopls.setup(cfg)
	end,
}
