require('snacks').setup({
    bigfile = { enabled = true },
    animate = { enabled = true }, -- Fully enabled
    scroll = { enabled = true },  -- Smooth scrolling out-of-the-box
    notifier = { enabled = true, timeout = 3000 },
    picker = { enabled = true },
    quickfile = { enabled = true },
    dashboard = {
        enabled = true,
        -- Override the default sections to remove the lazy.nvim stats dependency
        sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        }
    },
    styles = {
        notification = { wo = { wrap = true } }
    }
})
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- map('n', '<leader>db', [[<cmd>lua require('snacks').bufdelete()<CR>]], opts)
map('n', '<leader>cR', [[<cmd>lua require('snacks').rename.rename_file()<CR>]], opts)
map('n', '<leader>gg', [[<cmd>lua require('snacks').lazygit()<CR>]], opts)
map('n', '<c-\\>', [[<cmd>lua require('snacks').terminal.toggle()<CR>]], opts)
map('n', ']]', [[<cmd>lua require('snacks').words.jump(vim.v.count1)<CR>]], opts)
map('n', '[[', [[<cmd>lua require('snacks').words.jump(-vim.v.count1)<CR>]], opts)
