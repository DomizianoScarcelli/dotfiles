local color = 'catppuccin-mocha'
require("catppuccin").setup(
{
    transparent_background=true
})

vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg='none'})
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='none'})
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='none'})
-- vim.api.nvim_set_hl(0, 'SpecialKey', {bg='none'})
-- vim.api.nvim_set_hl(0, 'VertSplit', {bg='none'})
vim.api.nvim_set_hl(0, 'EndOfBuffer', {bg='none'})
-- vim.api.nvim_set_hl(0, 'EndOfFile', {bg='none'})
-- vim.api.nvim_set_hl(0, 'SignColumn', {bg='none'})
-- vim.api.nvim_set_hl(0, 'NonText', {bg='none'})
-- vim.api.nvim_set_hl(0, 'LineNr', {bg='none'})
-- vim.api.nvim_set_hl(0, 'Folded', {bg='none'})

