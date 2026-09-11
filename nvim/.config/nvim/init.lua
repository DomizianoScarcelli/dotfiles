require("dov")

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
    end,
})

-- Work-Mac python provider; only set it where it exists so other machines fall back to the default.
local work_py = "/Users/domiziano.scarcelli/miniconda3/envs/nvim-python/bin/python"
if vim.fn.executable(work_py) == 1 then
    vim.g.python3_host_prog = work_py
end

vim.filetype.add({
    extension = {
        j2 = 'jinja',
        jinja = 'jinja',
        jinja2 = 'jinja',
    },
})
