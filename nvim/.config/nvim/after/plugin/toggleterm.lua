require("toggleterm").setup({
    shade_terminals = false,
    open_mapping= [[<c-\>]],
    start_in_insert=true,
    insert_mappings=true,
    direction="float",
    size=20,
    hide_numbers=true,
})

local Terminal  = require('toggleterm.terminal').Terminal
local term = Terminal:new()
local float_term = Terminal:new({direction = "float"})
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", })

function toggle_terminal()
    term:toggle()
end
function toggle_floating_terminal()
    float_term:toggle()
end

function toggle_lazygit()
    lazygit:toggle()
end


-- vim.keymap.set("n", 'c-t', '<cmd> lua toggle_terminal()<CR>')
-- vim.keymap.set("n", 'C-f', '<cmd> lua toggle_floating_terminal()<CR>')
-- vim.keymap.set("n", '<leader>lg', '<cmd> lua toggle_lazygit()<CR>')

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<M-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<M-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<M-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<M-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<M-w>', [[<C-\><C-n><C-w>]], opts)
  -- vim.keymap.set("t", 'C-t', '<cmd> lua toggle_terminal()<CR>')
  -- vim.keymap.set("t", 'C-f', '<cmd> lua toggle_floating_terminal()<CR>')
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
