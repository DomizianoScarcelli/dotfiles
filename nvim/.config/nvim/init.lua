require("dov")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


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

vim.g.python3_host_prog = "/Users/domiziano.scarcelli/miniconda3/envs/nvim-python/bin/python"

vim.filetype.add({
    extension = {
        j2 = 'jinja',
        jinja = 'jinja',
        jinja2 = 'jinja',
    },
})
