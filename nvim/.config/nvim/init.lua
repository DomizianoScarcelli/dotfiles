require("dov")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
    end,
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*.py",
--   callback = function()
--     -- Only force it if it's not already set correctly to avoid loops,
--     -- OR force it blindly if the syntax is missing.
--     if vim.bo.filetype == 'python' then
--         -- This forces the "Filetype" event to re-fire
--         vim.cmd('set filetype=python') 
--     end
--   end,
-- })
vim.g.python3_host_prog = "/Users/domiziano.scarcelli/miniconda3/envs/nvim-python/bin/python"
