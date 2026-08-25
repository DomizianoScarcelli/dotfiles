require('snacks').setup({
    bigfile = { enabled = true },
    animate = { enabled = true }, -- Fully enabled
    scroll = { 
        enabled = true,
        animate = {
            -- Lower these numbers to make the initial scroll faster
            duration = { step = 5, total = 150 }, 
            easing = "linear",
        },
        -- This controls the speed when you hold down the scroll keys (j/k or Ctrl+u/d)
        animate_repeat = {
            delay = 150, -- milliseconds before the repeat animation kicks in
            -- Make these numbers even lower for lightning-fast repeated scrolling
            duration = { step = 2, total = 20 }, 
            easing = "linear",
        },
    },
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
