local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>db', [[<cmd>lua require('snacks').bufdelete()<CR>]], opts)
map('n', '<leader>cR', [[<cmd>lua require('snacks').rename.rename_file()<CR>]], opts)
map('n', '<leader>gg', [[<cmd>lua require('snacks').lazygit()<CR>]], opts)
map('n', '<c-\\>', [[<cmd>lua require('snacks').terminal.toggle()<CR>]], opts)
map('n', ']]', [[<cmd>lua require('snacks').words.jump(vim.v.count1)<CR>]], opts)
map('n', '[[', [[<cmd>lua require('snacks').words.jump(-vim.v.count1)<CR>]], opts)

