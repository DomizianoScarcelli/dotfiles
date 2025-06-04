require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "python", "bash", "markdown", "markdown_inline", -- include others as needed
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ib"] = "@code_cell.inner",
        ["ab"] = "@code_cell.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]b"] = "@code_cell.outer",
      },
      goto_previous_start = {
        ["[b"] = "@code_cell.outer",
      },
    },
  },
})
