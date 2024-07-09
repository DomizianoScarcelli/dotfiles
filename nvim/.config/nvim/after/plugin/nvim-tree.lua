-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymap for opening NvimTree
vim.keymap.set("n", "<leader>pv", "<CMD>:NvimTreeFindFile<CR>")

-- Require nvim-tree and setup configuration
local nvim_tree = require("nvim-tree")

-- Function to calculate center position
local function calculate_center()
    local total_width = vim.o.columns
    local total_height = vim.o.lines
    local width = total_width - 50
    local height = total_height - 20 -- Adjust height to a more reasonable value
    local row = math.floor((total_height - height) / 2)
    local col = math.floor((total_width - width) / 2)
    return {row = row, col = col, width = width, height = height}
end

local center = calculate_center()

nvim_tree.setup({
    view = {
        relativenumber = true,
        float = {
            enable = false, -- Strange error with telescope at start if float
            open_win_config = {
                relative = "editor",
                border = "double",
                width = center.width,
                height = center.height,
                row = center.row,
                col = center.col
            }
        }
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
})

