-- "CATPPUCCIN THEME"
-- local color = 'catppuccin-mocha'
-- require("catppuccin").setup(
-- {
--     transparent_background=true
-- })
-- vim.cmd.colorscheme(color)

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- "ARIAKE THEME"
-- Enable termguicolors if available
-- if vim.fn.has("termguicolors") == 1 then
--   vim.opt.termguicolors = true
-- end

-- -- Theme settings
-- vim.cmd("syntax enable")
-- vim.opt.background = "dark"  -- Set background to dark
-- -- For the light theme, uncomment the next line:
-- -- vim.opt.background = "light"

-- -- Set colorscheme
-- vim.cmd("colorscheme ariake")


vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
-- vim.api.nvim_set_hl(0, 'Visual', {bg=0x33f5e0dc, fg="#9399b2"})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg='none'})
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='none'})
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='none'})
-- vim.api.nvim_set_hl(0, 'SpecialKey', {bg='none'})
-- vim.api.nvim_set_hl(0, 'VertSplit', {bg='none'})
vim.api.nvim_set_hl(0, 'EndOfBuffer', {bg='none'})
-- vim.api.nvim_set_hl(0, 'EndOfFile', {bg='none'})
-- vim.api.nvim_set_hl(0, 'SignColumn', {bg='none'})
-- vim.api.nvim_set_hl(0, 'NonText', {bg='none'})
-- For Cattpuccin
vim.api.nvim_set_hl(0, 'LineNr', {fg='#6c7086'})
-- For gruvbox
vim.api.nvim_set_hl(0, 'LineNr', {fg='#9f8e7a'})
-- vim.api.nvim_set_hl(0, 'Folded', {bg='none'})
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#7f849c"})
-- vim.api.nvim_set_hl(0, "@comment", { link = "Comment"})
