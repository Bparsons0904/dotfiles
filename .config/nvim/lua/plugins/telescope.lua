return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          path_display = function(_, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s\t\t\t(%s)", tail, path)
          end,
          sorting_strategy = "ascending",
          file_ignore_patterns = { "node_modules" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--multiline",
          },
        },
        pickers = {
          buffers = {
            initial_mode = "normal",
            mappings = {
              n = {
                ["dd"] = "delete_buffer",
                ["x"] = "delete_buffer",
                ["q"] = "close",
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          smart_open = {
            match_algorithm = "fzf",
            cwd_only = true,
            ignore_patterns = {
              ".*_templ%.go",
              ".*_templ%.txt",
              -- Add test file patterns to ignore for main search
              ".*_test%.go",
              ".*%.test%.ts",
              ".*%.test%.js",
              ".*%.spec%.ts",
              ".*%.spec%.js",
              ".*/test/.*",
              ".*/tests/.*",
              ".*/__tests__/.*",
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("smart_open")

      -- Helper function to find test files
      local function find_test_files()
        builtin.find_files({
          find_command = {
            "fd",
            "--type",
            "f",
            "--follow",
            -- Include common test file patterns
            "-e",
            "go",
            "-e",
            "ts",
            "-e",
            "js",
            ".*(_test|test|spec)\\.(go|ts|js)$|.*/tests?/.*\\.(go|ts|js)$|.*/__tests__/.*\\.(ts|js)$",
          },
          prompt_title = "Find Test Files",
        })
      end

      addKeyMaps({
        {
          "n",
          "<leader>ff",
          function()
            telescope.extensions.smart_open.smart_open(require("telescope.themes").get_dropdown({ previewer = false }))
          end,
          "Find files (excluding tests)",
        },
        {
          "n",
          "<leader>ft",
          find_test_files,
          "Find test files",
        },
        { "n", "<leader>fo", builtin.find_files, "Find files" },
        { "n", "<leader>fr", builtin.oldfiles, "Find recent files" },
        { "n", "<leader>fg", builtin.live_grep, "Live grep" },
        { "n", "<leader>fb", builtin.buffers, "Buffers" },
        { "n", "<leader>fh", builtin.help_tags, "Help tags" },
        { "n", "<leader>fk", builtin.keymaps, "Current Keymaps" },
        -- LSP Symbols
        { "n", "<leader>fs", builtin.lsp_document_symbols, "LSP document symbols" },
        { "n", "<leader>fd", builtin.lsp_definitions, "LSP definitions" },
        -- Last Search
        { "n", "<leader>fl", builtin.resume, "Resume last search" },
        -- Marks
        { "n", "<leader>fm", builtin.marks, "Marks" },
        -- Colorschemes
        { "n", "<leader>fc", builtin.colorscheme, "Colorschemes" },
      })
    end,
  },
}
