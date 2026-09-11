require("dov")

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
