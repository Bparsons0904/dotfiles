return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "go",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "diff",
        "lua",
        "vim",
        "vimdoc",
        "templ",
        "html",
        "css",
        "query",
        "sql",
        "gowork",
        "gomod",
        "gosum",
        "gotmpl",
        "comment",
        "regex",
        "bash",
        "dart",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      injections = {
        enable = true,
        languages = {
          go = {
            sql = {
              pattern = [[(call_expression) @injection.content 
                (#match? @injection.content "(sql|query|SQL|QUERY)")
                (#set! injection.language "sql")]],
            },
          },
        },
      },
    })
  end,
}
