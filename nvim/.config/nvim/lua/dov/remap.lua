vim.g.mapleader = " "
-- If using the default NetRw file explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- If using oil.nvim
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

-- To use j, k also in soft wrap mode
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "s$", "g$")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("i", "<M-BS>", "<C-W>")

vim.keymap.set("n", "<leader>s", vim.cmd.update)

vim.keymap.set("n", "/", "/\\c")

vim.keymap.set("n", "H", "<CMD>bprevious<cr>")
vim.keymap.set("n", "L", "<CMD>bnext<cr>")
vim.keymap.set("n", "<leader>db", "<CMD>bdelete<cr>")




