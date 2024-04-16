require("toggleterm").setup({shade_terminals = false})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<leader>w', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local term = Terminal:new()
local float_term = Terminal:new({direction = "float"})
function toggle_terminal()
    term:toggle()
end
function toggle_floating_terminal()
    float_term:toggle()
end
vim.keymap.set("n", '<leader>tt', '<cmd> lua toggle_terminal()<CR>')
vim.keymap.set("n", '<leader>ft', '<cmd> lua toggle_floating_terminal()<CR>')


local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", })
function toggle_lazygit()
    lazygit:toggle()
end

vim.keymap.set("n", '<leader>lg', '<cmd> lua toggle_lazygit()<CR>')


