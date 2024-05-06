local db = require("dashboard")

-- HYPER setup
db.setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        shortcut = {
        },
    },
})

-- Opens nvim dashboard when the last buffer is closed, instead of opening an empty buffer
vim.defer_fn(
    function()
        vim.api.nvim_create_autocmd(
            'BufDelete',
            {
                group    = vim.api.nvim_create_augroup('open-dashboard-after-last-buffer-close', { clear = true }),
                callback = function(event)
                    for buf = 1, vim.fn.bufnr('$') do
                        if buf ~= event.buf and vim.fn.buflisted(buf) == 1 then
                            if vim.api.nvim_buf_get_name(buf) ~= '' and vim.bo[buf].filetype ~= 'dashboard' then
                                return
                            end
                        end
                    end
                    vim.cmd('Dashboard')
                end,
            }
        )
    end,
    0
)
