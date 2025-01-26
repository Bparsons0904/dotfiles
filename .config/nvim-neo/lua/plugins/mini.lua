return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment = "gc",
          comment_line = "<leader>/",
          comment_visual = "<leader>/",
          textobject = "gc",
        },
      })
      require("mini.icons").setup({})
      require("mini.move").setup({
        mappings = {
          left = "<M-h>",
          right = "<M-l>",
          down = "<M-j>",
          up = "<M-k>",

          line_left = "<M-h>",
          line_right = "<M-l>",
          line_down = "<M-j>",
          line_up = "<M-k>",
        },

        options = {
          reindent_linewise = true,
        },
      })
      require("mini.ai").setup({
        custom_textobjects = nil,
        mappings = {
          around = "a",
          inside = "i",

          around_next = "an",
          inside_next = "in",
          around_last = "al",
          inside_last = "il",

          goto_left = "g[",
          goto_right = "g]",
        },

        n_lines = 50,

        search_method = "cover_or_next",
        silent = false,
      })
      require("mini.bufremove").setup({
        addKeyMaps({
          {
            "n",
            "<leader>x",
            function()
              require("mini.bufremove").delete()
            end,
            "Close the current buffer",
          },
          {
            "n",
            "<leader>ba",
            function()
              local current = vim.api.nvim_get_current_buf()
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if buf ~= current then
                  require("mini.bufremove").delete(buf, false)
                end
              end
            end,
            "Close all buffers except current",
          },
          {
            "n",
            "<leader>bx",
            function()
              local current = vim.api.nvim_get_current_buf()
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if buf ~= current then
                  require("mini.bufremove").delete(buf, false)
                end
              end
              require("mini.bufremove").delete(current, false)
            end,
            "Close all buffers",
          },
        }),
      })
      require("mini.pairs").setup()
      -- require("mini.animate").setup()
    end,
  },
}
