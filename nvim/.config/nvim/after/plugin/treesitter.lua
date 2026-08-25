local ensure_installed = {
  "lua", "python", "bash", "markdown", "markdown_inline", "yaml", "rust"
}

require("nvim-treesitter").install(ensure_installed)

-- Filetypes to enable treesitter features for (markdown_inline has no filetype of its own).
local filetypes = { "lua", "python", "sh", "markdown", "yaml", "rust" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function()
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Textobjects
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
})

vim.keymap.set({ "x", "o" }, "ib", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ab", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]b", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@code_cell.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[b", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@code_cell.outer", "textobjects")
end)
